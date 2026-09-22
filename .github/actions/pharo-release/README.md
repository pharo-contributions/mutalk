# Pharo release automation

A reusable [composite GitHub Action] that publishes a **source archive** and a
**machine-readable HTML release index** for Pharo packages, triggered by a
Semantic Versioning tag.

[composite GitHub Action]: https://docs.github.com/actions/creating-actions/creating-a-composite-action

```
Git tag
  │
  ▼
Validate SemVer ──────────────► fail on invalid tags
  │
  ▼
Read Pharo project metadata (package name + source repository)
  │
  ▼
Create source.zip (from git, never contains index.html)
  │
  ▼
Query the GitHub Releases REST API (existing releases)
  │
  ▼
Generate index.html (release metadata + source URL + SHA-256 + changelog + README)
  │
  ▼
Create the GitHub Release with source.zip and index.html
```

## Usage

The action lives in `.github/actions/pharo-release` and ships its own scripts
via `github.action_path`, so adopting repositories do **not** need to copy any
code. Reference it pinned to a tag or commit SHA of this repository. The only
permission required is `contents: write`:

```yaml
name: Release

on:
  push:
    tags: ['*']

permissions:
  contents: write

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
          fetch-tags: true
      - uses: pharo-contributions/mutalk/.github/actions/pharo-release@master
        with:
          project-file: .project        # optional; defaults to .project
```

`tag` is optional: when omitted it defaults to the tag that triggered the
workflow. For reproducible builds pin the action to a commit SHA (or a release
tag you maintain) instead of the moving `master` branch shown above.

Non-SemVer tags fail the run on purpose. An invalid tag therefore does not
publish anything but stays visible as a failed workflow.

This repository's own release workflow is `.github/workflows/pharo-release.yml`
(tag push + `workflow_dispatch`, which accepts `tag` and `project-file` for
manual testing). Use it as the template for other repositories.

## Inputs

| Input          | Required | Default   | Description                                                                 |
| -------------- | -------- | --------- | --------------------------------------------------------------------------- |
| `tag`          | no       | triggering tag | Tag to release (e.g. `2.7.0` or `v2.7.0`). The leading `v` is optional and stripped for the version. |
| `project-file` | no       | `.project`| Location of the Pharo project metadata file, relative to the repository root. |

Outputs: `version` (normalized SemVer released) and `url` (release page URL).

The `contents: write` permission must be granted on the calling workflow (as in
the snippet above).

## Pharo project metadata contract

The source repository/location is **never hard-coded** in the workflow. It is
read from the Pharo project metadata file (a Monticello-style Smalltalk
dictionary, e.g. `.project`):

```
{
    'srcDirectory' : 'src'
}
```

- The **source repository location** is the value of `srcDirectory` (default
  `src`) and is resolved **relative to the directory containing the project
  file**.
- The **package name** is derived from the Metacello baseline found in the
  source directory (`BaselineOfMuTalk` → `MuTalk`), cross-checked with the
  `baseline` entry of `.smalltalk.ston` when present.

`--project-file` overrides the metadata location, so projects with unusual
layouts (a subfolder holding `.project`) work unchanged: everything is resolved
relative to that file.

## The generated index (index.html)

`scripts/index.py` is the pure, host-agnostic generator. It takes a neutral
`release.json` plus an optional `README.md` and emits a fully self-contained
page (inline CSS, inline Pharo SVG logo, light/dark themes via
`prefers-color-scheme` with `[data-theme]` overrides, no JavaScript). The source
archive link inside the index is relative (`./source.zip`) so the page keeps
working when the pair is hosted anywhere, not only on GitHub.

### release.json schema (input, format 1)

```jsonc
{
  "generated_at": "2026-09-22T10:00:00Z",   // ISO-8601
  "project": {                               // project-level, stable metadata
    "name": "MuTalk",                        // display name
    "package": "MuTalk"                      // Pharo package name
  },
  "releases": [                              // extensible: any number of releases
    {
      "version": "2.7.0",                    // SemVer, no leading "v"
      "date": "2026-09-22T10:00:00Z",        // ISO-8601 publish date
      "prerelease": false,
      "source": {
        "url": "./source.zip",               // download URL (host-relative is valid)
        "filename": "source.zip",
        "sha256": "<64 hex chars>"
      },
      "changes": "## Fixed\n- ..."           // Markdown release description/changelog
    }
  ]
}
```

`generated_at` and the `project` section are reserved for stable machine
consumption; release-specific data lives strictly under `releases[]`. Unknown
fields are ignored, so consumers can extend the schema without breaking readers.
The page carries the format number via:
`<meta name="pharo-index-format" content="1">`.

### Stable HTML contract

The CSS classes and data attributes below are part of the format and can be
relied upon by consumers:

| Element                                                            | Purpose                                   |
| ------------------------------------------------------------------ | ----------------------------------------- |
| `<main class="pharo-index" data-project="MuTalk">`                 | root container (package name), `data-project` |
| `<header class="index-header">` → `<h1 class="project-name" data-project-name>` | project title, `data-project-name` |
| `<span class="project-package">`                                   | Pharo package name badge                  |
| `<section class="project-readme" data-section="readme" id="readme">` | rendered README content (human section)  |
| `<ol class="release-list">` → `<li>` → `<article class="release"`  | one `<article class="release">` per release |
| `data-release-version="2.7.0"`, `data-release-index="0"`, `data-prerelease="true|false"` | machine-readable release identity |
| `<h2 class="release-version">`                                     | version heading                          |
| `<time class="release-date" datetime=…>`                           | release date                            |
| `<a class="release-source" data-kind="source" href=… download=…>`  | source archive download link            |
| `<code class="checksum" data-checksum-algorithm="SHA-256">`        | checksum (algorithm in attribute)      |
| `<section class="release-notes">`                                  | rendered changelog/release description |
| `<meta name="pharo-index-format" content="1">`                     | format version                         |

README content and release metadata never mix: the README is rendered only
inside `[data-section="readme"]`, releases only inside `.release-list`.

## Separation of concerns

- `index.py` — the pure generator. Reads `release.json` + `README.md`, writes
  `index.html`. No GitHub or network dependencies.
- `gh_adapter.py` — the only GitHub→neutral translation: turns the raw Releases
  API payload into `release.json`. The generated index therefore depends on no
  GitHub-specific concept.
- `previous_version.py`, `changelog.py`, `metadata.py`, `semver.py` — focused
  helpers used by the action.
- `action.yml` — orchestration and the release API/CLI calls (`gh`, `jq`).

## Requirements on the release job

Python 3, `gh` CLI, `jq`, `zip` (via `git archive`) — all preinstalled on
GitHub-hosted `ubuntu-latest`. The only additional dependency is the `markdown`
Python package; the action installs it (`pip install markdown`). On a custom
runner, provide it via a venv if needed.

## Reference

- Release index format and HTML contract: this file.
- Archive contents: `git archive` of the released tag, whole tracked tree,
  `.git` excluded by construction and `index.html` explicitly excluded.