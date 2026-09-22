#!/usr/bin/env python3
"""Read a Pharo project's metadata and describe its source repository.

The Pharo project metadata lives in a Monticello-style `.project` file (a
Smalltalk dictionary literal) which, at minimum, locates the source repository:

    {
        'srcDirectory' : 'src'
    }

The source repository location is always resolved *relative to the directory
that contains the project file*. The project file location defaults to
`.project` in the current directory and can be overridden (this is how the
GitHub Action is configured for repositories with unusual layouts).

The package name is derived from the Metacello baseline class
(`<src>/BaselineOfX/BaselineOfX.class.st`), cross-checked against the
`baseline` entry of `.smalltalk.ston` when present.

Emits a single JSON object on stdout:

    {
        "projectDir":     absolute path of the directory holding the project file,
        "projectFile":    path of the project file as resolved,
        "srcRepository":  raw source repository location read from the metadata,
        "srcDir":         absolute path of the source repository directory,
        "baseline":       baseline class name (e.g. "BaselineOfMuTalk"),
        "package":        package name (e.g. "MuTalk")
    }
"""

import argparse
import json
import re
import sys
from pathlib import Path

DEFAULT_PROJECT_FILE = ".project"
DEFAULT_SRC_DIRECTORY = "src"


def _unescape_smalltalk_string(value: str) -> str:
    return value.replace("''", "'")


def parse_project_file(text: str) -> dict:
    """Parse a Smalltalk dictionary literal into a {key: value} mapping."""
    entries = {}
    expression = re.compile(r"'((?:[^']|'')*)'\s*:\s*'((?:[^']|'')*)'")
    for match in expression.finditer(text):
        key = _unescape_smalltalk_string(match.group(1))
        value = _unescape_smalltalk_string(match.group(2))
        entries[key] = value
    return entries


def parse_smalltalkci_ston(text: str) -> dict:
    ston = {}
    baseline = re.search(r"#baseline\s*:\s*'([^']*)'", text)
    if baseline:
        ston["baseline"] = baseline.group(1)
    return ston


def discover_package(baseline_name: str, src_dir: Path) -> str:
    if baseline_name and (src_dir / baseline_name / f"{baseline_name}.class.st").is_file():
        return baseline_name[len("BaselineOf") :]
    candidates = sorted(
        p.parent.name
        for p in src_dir.glob("BaselineOf*/BaselineOf*.class.st")
    )
    if len(candidates) == 1:
        return candidates[0][len("BaselineOf") :]
    if len(candidates) > 1:
        raise ValueError(
            "multiple baselines found in the source repository "
            f"({', '.join(candidates)}); cannot determine the package name"
        )
    raise ValueError(
        f"no BaselineOf* baseline class found under '{src_dir}'; "
        "cannot determine the package name"
    )


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Describe a Pharo project from its project metadata file."
    )
    parser.add_argument(
        "--project-file",
        default=DEFAULT_PROJECT_FILE,
        help=f"path of the Pharo project metadata file (default: {DEFAULT_PROJECT_FILE})",
    )
    args = parser.parse_args()

    project_file = Path(args.project_file)
    if not project_file.is_file():
        print(
            f"::error ::project file not found: {project_file}",
            file=sys.stderr,
        )
        return 1

    project_dir = project_file.resolve().parent
    metadata = parse_project_file(project_file.read_text(encoding="utf-8"))

    src_repository = metadata.get("srcDirectory", DEFAULT_SRC_DIRECTORY)
    src_dir = (project_dir / src_repository).resolve()

    ston_path = project_dir / ".smalltalk.ston"
    ston = parse_smalltalkci_ston(ston_path.read_text(encoding="utf-8"))
    baseline = ston.get("baseline")

    package = discover_package(baseline, src_dir)
    baseline = f"BaselineOf{package}"

    if not src_dir.is_dir():
        print(
            f"::error ::source repository directory '{src_dir}' "
            "(from the project metadata) does not exist",
            file=sys.stderr,
        )
        return 1

    result = {
        "projectDir": str(project_dir),
        "projectFile": str(project_file),
        "srcRepository": src_repository,
        "srcDir": str(src_dir),
        "baseline": baseline,
        "package": package,
    }
    print(json.dumps(result, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())