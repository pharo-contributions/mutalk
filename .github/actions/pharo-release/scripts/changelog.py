#!/usr/bin/env python3
"""Generate a Markdown changelog from a `git log` range.

Usage:
    changelog.py --range <from>..<to> [--output FILE]

Commit subjects are grouped by Conventional Commits prefixes when present;
anything else falls back to a flat, chronological list.

The changelog is plain Markdown and intentionally carries no host-specific
concepts, so it can be embedded in the generated HTML index as well as used as
the GitHub Release description.
"""

import argparse
import re
import subprocess
import sys
from collections import OrderedDict

CONVENTIONAL = re.compile(
    r"^(?P<type>[a-z]+)(?:\((?P<scope>[^()]*)\))?(?P<breaking>!)?:\s*(?P<subject>.+)$"
)

SECTIONS = OrderedDict(
    [
        ("Breaking changes", ["breaking"]),
        ("Added", ["feat", "feature"]),
        ("Changed", ["refactor", "perf", "performance"]),
        ("Deprecated", ["deprecate"]),
        ("Removed", ["remove"]),
        ("Fixed", ["fix", "bugfix"]),
        ("Documentation", ["docs"]),
        ("Build system", ["build", "ci", "chore", "style", "test"]),
        ("Other", []),
    ]
)


def run_git(args):
    return subprocess.run(
        ["git", *args],
        check=True,
        capture_output=True,
        text=True,
    ).stdout


def main() -> int:
    parser = argparse.ArgumentParser(description="Build a changelog from a git range.")
    parser.add_argument("--range", required=True, help="git range, e.g. 'v2.5.0..v2.6.0'")
    parser.add_argument("--output", help="write the changelog to this file")
    args = parser.parse_args()

    log = run_git(
        [
            "log",
            "--format=%x00%H%x00%s%x00%b%x00",
            args.range,
        ]
    )

    collected = OrderedDict((name, []) for name in SECTIONS)
    shas = []
    for record in log.split("\x00\x00"):
        parts = record.split("\x00")
        if len(parts) < 4:
            continue
        _, sha, subject, body = parts[:4]
        shas.append(sha)

        match = CONVENTIONAL.match(subject.strip())
        breaking = bool(match and match.group("breaking")) or "BREAKING CHANGE" in body
        if breaking:
            section = "Breaking changes"
        elif match:
            commit_type = match.group("type")
            section = next(
                (name for name, kinds in SECTIONS.items() if commit_type in kinds),
                "Other",
            )
            text = match.group("subject").strip()
        else:
            section = "Other"
            text = subject.strip()
        collected[section].append(f"- {text} (`{sha[:7]}`)")

    lines = []
    if not shas:
        lines.append("_No changes recorded in this range._")
    else:
        for name, items in collected.items():
            if items:
                lines.append(f"## {name}")
                lines.extend(items)
                lines.append("")
        lines.append(f"_From {len(shas)} commit{'s' if len(shas) != 1 else ''}._")

    changelog = "\n".join(lines).rstrip() + "\n"
    if args.output:
        with open(args.output, "w", encoding="utf-8") as handle:
            handle.write(changelog)
    else:
        sys.stdout.write(changelog)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())