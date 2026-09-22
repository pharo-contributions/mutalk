#!/usr/bin/env python3
"""Generate the Pharo package release index (`index.html`).

This script is intentionally free of any GitHub-specific concept: it consumes a
plain JSON metadata file plus an optional Markdown README and emits a
self-contained HTML page with absolute artifact links.

Usage:
    index.py --metadata release.json [--readme README.md] --output index.html

Dependencies: the `markdown` package (pip install markdown).

The input schema, the stable HTML classes/data-attributes and the CSS are
documented in .github/actions/pharo-release/README.md.
"""

import argparse
import base64
import html
import json
import mimetypes
import sys
from pathlib import Path

try:
    import markdown
except ImportError:  # pragma: no cover - dependency not installed
    print(
        "the 'markdown' Python package is required: pip install markdown",
        file=sys.stderr,
    )
    raise SystemExit(1)

INDEX_FORMAT = 1

DEFAULT_LOGO_PATH = Path(__file__).with_name("Pharo_Beacon_v3.0.svg")


CSS = """
:root {
    --pharo-blue: #2e6da4;
    --pharo-blue-soft: #7aaedb;
    --pharo-blue-pale: #a9cce8;
    --pharo-blue-ink: #143652;
    --pr-bg: #ffffff;
    --pr-surface: #f6f8fb;
    --pr-border: #dbe4ee;
    --pr-text: #1d2631;
    --pr-text-muted: #5b6b7a;
    --pr-accent: #2e6da4;
    --pr-code-bg: #eef3f8;
    --pr-shadow: 0 1px 3px rgba(20, 54, 82, 0.08);
    color-scheme: light dark;
}

html[data-theme="dark"] {
    --pr-bg: #101418;
    --pr-surface: #171c22;
    --pr-border: #2a333d;
    --pr-text: #e8edf3;
    --pr-text-muted: #93a3b3;
    --pr-accent: #7aaedb;
    --pr-code-bg: #1d2530;
    --pr-shadow: 0 1px 3px rgba(0, 0, 0, 0.4);
}

@media (prefers-color-scheme: dark) {
    :root {
        --pr-bg: #101418;
        --pr-surface: #171c22;
        --pr-border: #2a333d;
        --pr-text: #e8edf3;
        --pr-text-muted: #93a3b3;
        --pr-accent: #7aaedb;
        --pr-code-bg: #1d2530;
        --pr-shadow: 0 1px 3px rgba(0, 0, 0, 0.4);
    }
    html[data-theme="light"] {
        --pr-bg: #ffffff;
        --pr-surface: #f6f8fb;
        --pr-border: #dbe4ee;
        --pr-text: #1d2631;
        --pr-text-muted: #5b6b7a;
        --pr-accent: #2e6da4;
        --pr-code-bg: #eef3f8;
        --pr-shadow: 0 1px 3px rgba(20, 54, 82, 0.08);
    }
}

html {
    font-size: 16px;
}

body {
    margin: 0;
    background: var(--pr-bg);
    color: var(--pr-text);
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
        Helvetica, Arial, sans-serif;
    line-height: 1.55;
}

.pharo-index {
    max-width: 860px;
    margin: 0 auto;
    padding: 3rem 1.25rem 4rem;
}

.pharo-index h1, .pharo-index h2, .pharo-index h3 {
    color: var(--pr-accent);
    line-height: 1.2;
}

.index-header {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding-bottom: 1.25rem;
    border-bottom: 2px solid var(--pr-border);
    margin-bottom: 1.5rem;
}

.index-header .project-name {
    margin: 0;
    font-size: 3rem;
    line-height: 1;
}

.index-logo {
    width: 48px;
    height: 48px;
    flex: 0 0 48px;
    object-fit: contain;
}

.latest-release {
    background: var(--pr-code-bg);
    border: 1px solid var(--pr-border);
    border-radius: 8px;
    padding: 1rem 1.1rem;
}

.latest-release h2 {
    margin: 0;
    font-size: 1.05rem;
}

.latest-release p {
    margin: 0.35rem 0 0;
}

.table-of-contents ul {
    display: flex;
    flex-wrap: wrap;
    gap: 0.35rem 1.25rem;
    margin: 0;
    padding-left: 1.2rem;
}

.section-title {
    font-size: 0.85rem;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    color: var(--pr-text-muted);
    margin: 2rem 0 0.6rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.section-title::after {
    content: "";
    flex: 1;
    height: 1px;
    background: var(--pr-border);
}

.release-list {
    list-style: none;
    margin: 0;
    padding: 0;
    display: grid;
    gap: 1.25rem;
}

.release {
    background: var(--pr-surface);
    border: 1px solid var(--pr-border);
    border-radius: 12px;
    padding: 1.1rem 1.25rem;
    box-shadow: var(--pr-shadow);
}

.release-head {
    display: flex;
    flex-wrap: wrap;
    align-items: baseline;
    justify-content: space-between;
    gap: 0.4rem 1rem;
    margin-bottom: 0.4rem;
}

.release-version {
    margin: 0;
    font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
    font-size: 1.35rem;
}

.release-badge {
    font-size: 0.72rem;
    padding: 0.08rem 0.5rem;
    border-radius: 999px;
    vertical-align: middle;
    margin-left: 0.5rem;
    border: 1px solid var(--pr-border);
    color: var(--pr-text-muted);
}

.release-date {
    color: var(--pr-text-muted);
    font-size: 0.9rem;
}

.release-meta {
    font-size: 0.9rem;
    padding: 0.6rem 0.8rem;
    background: var(--pr-code-bg);
    border-radius: 8px;
    margin: 0.6rem 0;
}

.release-meta dt {
    display: inline-block;
    min-width: 7.5em;
    color: var(--pr-text-muted);
}

.release-meta dd {
    display: inline;
    margin: 0;
    margin-left: 0.4rem;
    margin-right: 1.4rem;
}

.release-meta code {
    font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
    word-break: break-all;
}

.release-artifacts {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem 1rem;
    margin: 0.8rem 0;
}

.release-artifacts a {
    overflow-wrap: anywhere;
}

.release-toc ul {
    columns: 2;
    margin: 0 0 1rem;
    padding-left: 1.2rem;
}

.release-notes {
    font-size: 0.95rem;
}

.release-notes code {
    font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
    font-size: 0.85em;
    background: var(--pr-code-bg);
    border-radius: 4px;
    padding: 0.1rem 0.35rem;
    color: var(--pr-accent);
}

.release-notes pre {
    background: var(--pr-code-bg);
    border-radius: 8px;
    padding: 0.7rem 0.9rem;
    overflow-x: auto;
}

.release-notes blockquote {
    margin: 0.5rem 0;
    padding-left: 0.8rem;
    border-left: 3px solid var(--pr-border);
    color: var(--pr-text-muted);
}

.release-notes table {
    border-collapse: collapse;
    margin: 0.5rem 0;
}

.release-notes th, .release-notes td {
    border: 1px solid var(--pr-border);
    padding: 0.3rem 0.6rem;
    text-align: left;
}

.project-readme {
    background: var(--pr-surface);
    border: 1px solid var(--pr-border);
    border-radius: 12px;
    padding: 1.1rem 1.25rem;
    box-shadow: var(--pr-shadow);
    overflow-wrap: break-word;
}

.project-readme img {
    max-width: 100%;
}

.project-readme pre {
    background: var(--pr-code-bg);
    border-radius: 8px;
    padding: 0.7rem 0.9rem;
    overflow-x: auto;
}

.project-readme code {
    font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
    font-size: 0.85em;
    background: var(--pr-code-bg);
    border-radius: 4px;
    padding: 0.1rem 0.35rem;
}

.project-readme table {
    border-collapse: collapse;
    margin: 0.5rem 0;
}

.project-readme th, .project-readme td {
    border: 1px solid var(--pr-border);
    padding: 0.3rem 0.6rem;
}

.index-footer {
    margin-top: 2.5rem;
    color: var(--pr-text-muted);
    font-size: 0.8rem;
    text-align: center;
}

a {
    color: var(--pr-accent);
}
"""


def render_markdown(source: str) -> str:
    return markdown.markdown(
        source,
        extensions=["sane_lists", "tables", "fenced_code", "attr_list"],
    )


def logo_markup(logo: str | None) -> str:
    if not logo:
        logo = str(DEFAULT_LOGO_PATH)
    if logo.startswith(("http://", "https://")):
        return (
            f'<img class="index-logo" src="{html.escape(logo, quote=True)}" '
            'alt="Pharo logo">'
        )

    logo_path = Path(logo)
    if not logo_path.is_file():
        raise ValueError(f"logo file not found: {logo}")
    content = logo_path.read_bytes()
    mime_type = mimetypes.guess_type(logo_path.name)[0] or "application/octet-stream"
    if mime_type == "image/svg+xml":
        svg = content.decode("utf-8")
        return svg.replace("<svg", '<svg class="index-logo"', 1)
    encoded = base64.b64encode(content).decode("ascii")
    return (
        f'<img class="index-logo" src="data:{mime_type};base64,{encoded}" '
        f'alt="{html.escape(logo_path.stem)} logo">'
    )


def project_section(project: dict, logo: str | None) -> str:
    name = html.escape(project.get("name", "Pharo package"))
    description = html.escape(project.get("description", ""))
    subtitle = (
        f'<p class="project-description">{description}</p>'
        if description and description != package
        else ""
    )
    return f"""
    <header class="index-header">
            {logo_markup(logo)}
      <div>
        <h1 class="project-name" data-project-name>{name}</h1>
        {subtitle}
      </div>
    </header>
    """.replace("\n    ", "\n")


def release_section(release: dict, index: int) -> str:
    version = str(release.get("version", f"release-{index}"))
    date = str(release.get("date", ""))
    prerelease = bool(release.get("prerelease"))
    changes = render_markdown(release.get("changes", ""))

    artifacts = release.get("artifacts", [])

    badge = '<span class="release-badge">prerelease</span>' if prerelease else ""
    time_html = (
        f'<time class="release-date" datetime="{html.escape(date)}">'
        f"{html.escape(_human_date(date))}</time>"
        if date
        else ""
    )

    artifact_links = []
    for artifact in artifacts:
        name = html.escape(str(artifact.get("name", "artifact")))
        url = html.escape(str(artifact.get("url", "")), quote=True)
        if url.startswith(("https://", "http://")):
            artifact_links.append(
                f'<a class="release-artifact" href="{url}">{name}</a>'
            )
    artifact_html = (
        '<div class="release-artifacts" aria-label="Release artifacts">'
        + "".join(artifact_links)
        + "</div>"
        if artifact_links
        else ""
    )

    notes = (
        f'<section class="release-notes" aria-label="Release notes">'
        f"<h3>Release notes</h3>{changes}</section>"
        if changes.strip()
        else ""
    )

    return f"""
    <li>
      <article class="release"
               id="release-{html.escape(version)}"
               data-release-version="{html.escape(version)}"
               data-release-index="{index}"
               data-prerelease="{"true" if prerelease else "false"}">
        <div class="release-head">
          <h2 class="release-version">{html.escape(version)}{badge}</h2>
          {time_html}
        </div>
        {artifact_html}
        {notes}
      </article>
    </li>
    """.replace("\n    ", "\n")


def readme_section(readme_path: Path | None) -> str:
    if readme_path is None or not readme_path.is_file():
        return ""
    content = readme_path.read_text(encoding="utf-8")
    return f"""
    <h2 class="section-title">README</h2>
    <section class="project-readme" data-section="readme" id="readme"
             aria-label="README">{render_markdown(content)}</section>
    """.replace("\n    ", "\n")


def latest_release_section(release: dict) -> str:
        version = html.escape(str(release.get("version", "latest")))
        date = str(release.get("date", ""))
        date_html = f' ({html.escape(_human_date(date))})' if date else ""
        return f"""
        <section class="latest-release" id="latest-release" aria-labelledby="latest-release-title">
            <h2 id="latest-release-title">Latest release</h2>
            <p><a href="#release-{version}">{version}</a>{date_html}</p>
        </section>
        """.replace("\n    ", "\n")


def table_of_contents(readme_path: Path | None) -> str:
        readme_link = (
                '<li><a href="#readme">README</a></li>'
                if readme_path is not None and readme_path.is_file()
                else ""
        )
        return f"""
        <nav class="table-of-contents" aria-label="Table of contents">
            <h2 class="section-title">Contents</h2>
            <ul>
                <li><a href="#releases">All releases</a></li>
                {readme_link}
            </ul>
        </nav>
        """.replace("\n    ", "\n")


def releases_table_of_contents(releases: list[dict]) -> str:
        links = "".join(
                f'<li><a href="#release-{html.escape(str(release.get("version", index)))}">'
                f'{html.escape(str(release.get("version", f"release-{index}")))}</a></li>'
                for index, release in enumerate(releases)
        )
        return f"""
        <nav class="release-toc" aria-label="Release table of contents">
            <ul>{links}</ul>
        </nav>
        """.replace("\n    ", "\n")


def _human_date(iso_date: str) -> str:
    try:
        import datetime

        date = datetime.datetime.fromisoformat(iso_date.replace("Z", "+00:00"))
        if date.tzinfo:
            date = date.astimezone()
        return date.strftime("%B %d, %Y")
    except ValueError:
        return iso_date


def main() -> int:
    parser = argparse.ArgumentParser(description="Generate the release index HTML.")
    parser.add_argument("--metadata", required=True, help="path to release.json")
    parser.add_argument("--readme", help="path to the project README (Markdown)")
    parser.add_argument("--logo", help="path or URL for the project logo")
    parser.add_argument("--output", required=True, help="path of the generated index.html")
    args = parser.parse_args()

    metadata = json.loads(Path(args.metadata).read_text(encoding="utf-8"))
    project = metadata.get("project", {})
    releases = metadata.get("releases", [])
    if not isinstance(releases, list) or not releases:
        print("release metadata must contain a non-empty 'releases' list", file=sys.stderr)
        return 1

    readme_path = Path(args.readme) if args.readme else None
    release_html = "".join(
        release_section(release, index) for index, release in enumerate(releases)
    )
    generated_at = metadata.get("generated_at", "")
    footer_line = (
        f"Generated on {html.escape(_human_date(generated_at))}."
        if generated_at
        else "Generated from release metadata."
    )

    page = f"""<!DOCTYPE html>
<html lang="en" data-theme="system">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="color-scheme" content="light dark">
  <meta name="pharo-index-format" content="{INDEX_FORMAT}">
  <title>{html.escape(project.get('name', 'Pharo release index'))} — releases</title>
  <style>{CSS}</style>
</head>
<body>
  <main class="pharo-index" data-project="{html.escape(project.get('package', project.get('name', '')))}">
        {project_section(project, args.logo)}
        {latest_release_section(releases[0])}
        {table_of_contents(readme_path)}
    {readme_section(readme_path)}
        <section id="releases" aria-labelledby="releases-title">
            <h2 class="section-title" id="releases-title">Releases</h2>
            {releases_table_of_contents(releases)}
            <ol class="release-list">
      {release_html}
            </ol>
        </section>
    <footer class="index-footer">
      {footer_line}
    </footer>
  </main>
</body>
</html>
"""
    out = Path(args.output)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(page, encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())