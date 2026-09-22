#!/usr/bin/env python3
"""Semantic Versioning (SemVer 2.0.0) helpers and tag validator.

Accepts a version with an optional leading "v" (e.g. "v2.6.0" or "2.6.0-beta.1").

CLI:
    semver.py <version>      # prints the normalized version, exit 0 on success
    semver.py --validate <version>   # no output, exit 0/1 (for callers)

SemVer grammar:
    <valid semver> ::= <version core> [ "-" <prerelease> ] [ "+" <build> ]
    <version core> ::= <major> "." <minor> "." <patch>
"""

import re
import sys

SEMVER_RE = re.compile(
    r"^v?"
    r"(?P<major>0|[1-9]\d*)"
    r"\.(?P<minor>0|[1-9]\d*)"
    r"\.(?P<patch>0|[1-9]\d*)"
    r"(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)"
    r"(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?"
    r"(?:\+(?P<build>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?"
    r"$"
)


def validate(version: str) -> str | None:
    """Return the normalized version (leading "v" stripped) or None if invalid."""
    version = version.strip()
    match = SEMVER_RE.match(version)
    if not match:
        return None
    normalized = (
        f"{match.group('major')}.{match.group('minor')}.{match.group('patch')}"
    )
    if match.group("prerelease"):
        normalized += f"-{match.group('prerelease')}"
    if match.group("build"):
        normalized += f"+{match.group('build')}"
    return normalized


def parse(version: str) -> dict | None:
    """Split a version into (major, minor, patch, prerelease) or None."""
    match = SEMVER_RE.match(version.strip())
    if not match:
        return None
    return {
        "major": int(match.group("major")),
        "minor": int(match.group("minor")),
        "patch": int(match.group("patch")),
        "prerelease": match.group("prerelease").split(".")
        if match.group("prerelease")
        else None,
        "build": match.group("build"),
    }


def _prerelease_key(prerelease):
    key = []
    for identifier in prerelease or ():
        if identifier.isdigit():
            key.append((0, int(identifier), ""))
        else:
            key.append((1, 0, identifier))
    return key


def compare(left: str, right: str) -> int:
    """SemVer precedence: negative if left < right, zero if equal, positive if left > right."""
    left_parsed, right_parsed = parse(left), parse(right)
    if left_parsed is None or right_parsed is None:
        return (left_parsed is None) - (right_parsed is None)
    left_core = (left_parsed["major"], left_parsed["minor"], left_parsed["patch"])
    right_core = (right_parsed["major"], right_parsed["minor"], right_parsed["patch"])
    if left_core != right_core:
        return (left_core > right_core) - (left_core < right_core)
    if left_parsed["prerelease"] is None and right_parsed["prerelease"] is None:
        return 0
    if left_parsed["prerelease"] is None:
        return 1
    if right_parsed["prerelease"] is None:
        return -1
    left_prerelease = _prerelease_key(left_parsed["prerelease"])
    right_prerelease = _prerelease_key(right_parsed["prerelease"])
    if left_prerelease != right_prerelease:
        return (left_prerelease > right_prerelease) - (
            left_prerelease < right_prerelease
        )
    return 0


def is_prerelease(version: str) -> bool:
    parsed = parse(version)
    return bool(parsed and parsed["prerelease"])


def main() -> int:
    args = sys.argv[1:]
    if len(args) != 1:
        print(
            "usage: semver.py [--validate] <version>",
            file=sys.stderr,
        )
        return 2
    quiet = args[0] == "--validate"
    if quiet:
        args = args[1:]
    if len(args) != 1:
        print(
            "usage: semver.py [--validate] <version>",
            file=sys.stderr,
        )
        return 2
    normalized = validate(args[0])
    if normalized is None:
        print(
            f"::error ::'{args[0]}' is not a valid Semantic Version. "
            "Expected MAJOR.MINOR.PATCH with optional -prerelease/+build, "
            "optionally prefixed with 'v'.",
            file=sys.stderr,
        )
        return 1
    if not quiet:
        print(normalized)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())