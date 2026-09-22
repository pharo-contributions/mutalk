#!/usr/bin/env python3
"""Print the highest existing release version strictly older than the given tag.

Reads the raw host releases JSON array (see `--releases-file`) and applies
SemVer precedence. The empty string is printed when there is no previous
release, so callers can fall back to the full history.

Usage:
    previous_version.py --releases-file releases.json --tag <tag>
"""

import argparse
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from semver import compare, parse  # noqa: E402


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Find the previous release version for a tag."
    )
    parser.add_argument("--releases-file", required=True)
    parser.add_argument("--tag", required=True)
    args = parser.parse_args()

    with open(args.releases_file, encoding="utf-8") as handle:
        releases = json.load(handle)

    previous = None
    for release in releases:
        tag = release.get("tag_name", "")
        if parse(tag) is None or compare(tag, args.tag) >= 0:
            continue
        if previous is None or compare(tag, previous) > 0:
            previous = tag
    print(previous or "")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())