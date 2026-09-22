#!/usr/bin/env python3
"""Adapt host-specific release data into the neutral `release.json` schema.

This is the *only* place where GitHub's REST API response shape is translated.
It consumes a raw GitHub releases JSON array (from
`gh api repos/{owner}/{repo}/releases`), combines it with the freshly built
artifacts of the release being published, and emits the neutral metadata that
`index.py` renders. `index.py` itself never sees host-specific concepts.

Usage:
    gh_adapter.py \
        --releases-file releases.json \
        --tag <tag> --version <version> --date <iso> \
        --project-name <name> --package <package> \
        --source-url <url> --source-filename <file> --source-sha256 <hex> \
        --changes-file <markdown> \
        --previous-output <file>
        --output release.json

The previous release version (for changelog generation) is printed to stdout.
"""

import argparse
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from semver import compare, is_prerelease, parse  # noqa: E402


def from_github_release(raw: dict) -> dict:
    tag = raw.get("tag_name", "")
    version = tag[1:] if tag.startswith("v") else tag
    artifacts = []
    for asset in raw.get("assets", []) or []:
        name = asset.get("name", "")
        url = asset.get("browser_download_url", "")
        if name and url and name != "source.zip":
            artifacts.append({"name": name, "url": url, "size": asset.get("size")})
    record = {
        "version": version,
        "date": raw.get("published_at", ""),
        "prerelease": bool(raw.get("prerelease")),
        "changes": raw.get("body") or "",
    }
    record["artifacts"] = artifacts
    return record


def main() -> int:
    parser = argparse.ArgumentParser(description="Build release.json from host releases.")
    parser.add_argument("--releases-file", required=True, help="raw GitHub releases JSON array")
    parser.add_argument("--tag", required=True, help="tag being released")
    parser.add_argument("--version", required=True, help="normalized version being released")
    parser.add_argument("--date", required=True, help="ISO date of this release")
    parser.add_argument("--project-name", required=True)
    parser.add_argument("--package", required=True)
    parser.add_argument("--repository", required=True, help="owner/name for artifact URLs")
    parser.add_argument("--changes-file", required=True, help="changelog markdown")
    parser.add_argument("--previous-output", required=True, help="file receiving previous version")
    parser.add_argument("--output", required=True, help="path of generated release.json")
    args = parser.parse_args()

    with open(args.releases_file, encoding="utf-8") as handle:
        existing = json.load(handle)

    previous = None
    prior = []
    for raw in existing:
        tag = raw.get("tag_name", "")
        if tag == args.tag:
            continue
        prior.append(from_github_release(raw))
        if parse(tag) is None or compare(tag, args.tag) >= 0:
            continue
        if previous is None or compare(tag, previous) > 0:
            previous = tag

    changes = open(args.changes_file, encoding="utf-8").read()

    current = {
        "version": args.version,
        "date": args.date,
        "prerelease": is_prerelease(args.version),
        "artifacts": [{
            "name": "index.html",
            "url": f"https://github.com/{args.repository}/releases/download/"
            f"{args.tag}/index.html",
        }],
        "changes": changes,
    }

    metadata = {
        "generated_at": args.date,
        "project": {
            "name": args.project_name,
            "package": args.package,
        },
        "releases": [current, *prior],
    }

    with open(args.output, "w", encoding="utf-8") as handle:
        json.dump(metadata, handle, indent=2)
        handle.write("\n")

    with open(args.previous_output, "w", encoding="utf-8") as handle:
        handle.write(previous or "")

    print(previous or "")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())