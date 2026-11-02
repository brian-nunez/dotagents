# README House Style

The look is a centered, product-page header written in HTML inside the markdown, followed by plain markdown sections. GitHub strips CSS, so all layout comes from `align="center"`, `width`, `<br>`, `<b>`, `<i>` and `<sub>`.

## 1. Overall Shape

```
Centered header block   (brand logo, app icon, title, tagline, description, badges, CTA, link bar)
Hero image              (full-width screenshot with a caption)
Callout                 (optional GitHub alert)
Section link bar        (centered anchors to the H2 sections)
Body sections           (markdown, in the order defined in sections.md)
```

## 2. Header Block

Write it exactly in this order, in HTML. Omit any element that has no real content, but keep the order of the rest.

```html
<p align="center">
  <a href="https://brand-site.example/">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="docs/brand/logo-white.svg">
      <img alt="Brand" src="docs/brand/logo.svg" width="200">
    </picture>
  </a>
</p>

<p align="center">
  <img src="docs/brand/icon.png" width="128" height="128" alt="Project icon: short description of the artwork">
</p>

<h1 align="center">Project Name</h1>

<p align="center">
  <b>Category; a one-sentence statement of what it is and what it is built with.</b>
</p>

<p align="center">
  One or two sentences on what it does, where it runs, and who it is for.<br>
  <i>By Author or Team.</i>
</p>

<p align="center">
  <img alt="Written in Go" src="https://img.shields.io/badge/written%20in-Go-00758f?style=flat-square&logo=go&logoColor=white">
  <img alt="Runs on macOS" src="https://img.shields.io/badge/runs%20on-macOS-00add8?style=flat-square">
  <img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-00758f?style=flat-square">
  <br>
  <a href="..."><img alt="CI" src="https://img.shields.io/github/actions/workflow/status/<owner>/<repo>/<file>.yml?branch=main&style=flat-square&label=CI&logo=githubactions&logoColor=white"></a>
  <a href="..."><img alt="Latest release" src="https://img.shields.io/github/v/release/<owner>/<repo>?style=flat-square&logo=github"></a>
</p>

<p align="center">
  <a href="PRIMARY_URL"><img alt="Primary action" src="https://img.shields.io/badge/Primary%20Action-COLOR?style=for-the-badge&logo=LOGO&logoColor=white" height="40"></a>
</p>

<p align="center">
  <a href="PRIMARY_URL"><b>Primary destination</b></a> ·
  <a href="...">Second link</a> ·
  <a href="...">Third link</a>
</p>

<br>

<p align="center">
  <img src="docs/images/hero.png" alt="Detailed description of what the screenshot shows" width="100%">
  <br><sub><b>Caption title</b>: one sentence on what the screenshot demonstrates.</sub>
</p>
```

Element rules:
*   **Brand logo**: only when the project belongs to a wider brand or organization with its own logo. Use `<picture>` with a dark-mode source when a white variant exists.
*   **App icon**: 128×128, rounded square artwork, with alt text that describes the image. Skip it if the project has no icon.
*   **Title**: `<h1 align="center">`, the project name only. GitHub draws a rule under it.
*   **Tagline**: `<b>`, one sentence, ends with a period. Pattern: what it is; then a fuller statement of what it is and what it is built with.
*   **Description**: one or two plain sentences, then `<br>` and an italic byline when there is a known author or team.
*   **Brand color**: pick one hue per project and use two shades of it everywhere in the header (icon gradient, fact badges, CTA), so the header reads as one design.
*   **Fact badges (first row)**: static two-tone `flat-square` badges built as `badge/<label>-<value>-<color>`, labels in lower case (`written in`, `runs on`, `license`, `built with`, `agents`). Alternate two shades of one brand color across the row. Separate multiple values with ` · ` (`%20%C2%B7%20`).
*   **Status badges (second row, after `<br>`)**: live badges that link somewhere: CI, latest release, code quality, reviews, package registry. Always `flat-square` with a logo.
*   **CTA button**: one large `for-the-badge` badge at `height="40"`, for the single most important action (join the community, download, open the docs, try the demo). Use the project's brand color, or the destination's brand color for a community link. For a private repository with no public page, link it to `#quick-start`.
*   **Link bar**: the first link is bold and goes to the primary destination; others are plain; separated by ` · ` at line ends.
*   **Hero image**: the best full screenshot of the project working, `width="100%"`, with a `<sub>` caption whose first words are bold. Use a GIF or an embedded video (a bare `https://github.com/user-attachments/assets/...` line) when motion matters. Never fabricate a screenshot; use only real captures or user-supplied media.

## 3. Callout and Section Link Bar

After the hero, an optional GitHub alert for one message worth highlighting (community, status, a key requirement):

```markdown
> [!NOTE]
> **One bold sentence.** One or two supporting sentences, with a **[bold link](url)** if useful.
```

Use `[!NOTE]`, `[!TIP]`, `[!IMPORTANT]` or `[!WARNING]` by meaning. Then a centered link bar to every H2 section:

```html
<p align="center">
  <a href="#why-project">Why Project</a> ·
  <a href="#quick-start">Quick start</a> ·
  <a href="#license">License</a>
</p>
```

Anchors must match GitHub's heading slugs (lowercase, spaces to hyphens, punctuation removed). Keep the bar to about seven entries so it fits on one line; drop minor sections from it rather than letting it wrap.

## 4. Body Section Patterns

### "Why" section
The first H2 after the header is `## Why <Project>`: a bullet list where each item starts with a bold one-word or two-word quality ending in a period, followed by one to three sentences of concrete detail, with links to deeper docs inline.

```markdown
- **Fast.** Concrete reason, with the technique or number that backs it.
- **Private.** Concrete reason.
```

### Feature tables
For projects with many distinct features, themed H2s with a framing sentence and a table:

```markdown
| Feature | Preview |
| ------- | ------- |
| **Feature Name**<br>One sentence on what it does. | <a href="media.gif"><img src="media.gif" width="180" alt="Feature Name demo"></a> |
```

Without media, use `| Feature | Description |` with the name in bold in the first column. Keep to one table per theme, names in Title Case, one sentence per description.

### Image gallery
For several screenshots, a two-column HTML table:

```html
<table>
<tr>
<td width="50%" valign="top"><img src="docs/images/a.png" alt="..."></td>
<td width="50%" valign="top"><img src="docs/images/b.png" alt="..."></td>
</tr>
</table>
```

### Quick start
One code block of the common commands, each with an aligned trailing comment:

```sh
make build                     # build the binary
make run                       # start the server on :8080
make test                      # run the tests
```

Follow with short paragraphs for prerequisites and anything that needs explanation. Use H3 subsections for topics such as configuration, logs or the web build.

### Reference tables
Configuration, environment variables and supported integrations go in tables (`| Variable | Default | Effect |`). Bold the primary row of a provider table. Long catalogs go inside `<details><summary><strong>Title</strong></summary> ... </details>`.

## 5. Badge Reference

Static badge: `https://img.shields.io/badge/<label>-<value>-<hex>?style=flat-square&logo=<logo>&logoColor=white`. Escape spaces as `%20`, hyphens as `--`, underscores as `__`.

Live badges:

| Badge | URL pattern |
|-------|-------------|
| CI | `https://img.shields.io/github/actions/workflow/status/<owner>/<repo>/<file>.yml?branch=main&style=flat-square&label=CI&logo=githubactions&logoColor=white` |
| Latest release | `https://img.shields.io/github/v/release/<owner>/<repo>?style=flat-square&logo=github` |
| Go Reference | `https://pkg.go.dev/badge/github.com/<owner>/<repo>.svg` |
| Go Report Card | `https://goreportcard.com/badge/github.com/<owner>/<repo>` |
| npm | `https://img.shields.io/npm/v/<package>?style=flat-square&logo=npm` |
| Crates.io | `https://img.shields.io/crates/v/<crate>?style=flat-square&logo=rust` |
| SonarCloud | `https://img.shields.io/badge/Scanned_by-SonarCloud-4b9fd5?style=flat-square&logo=sonarqubecloud&logoColor=white` |
| Discord online | `https://img.shields.io/discord/<server-id>?style=for-the-badge&label=Discord&color=5865F2&logo=discord&logoColor=white` |

Live badges for private repositories do not render; use static fact badges instead (for example `ships as · one binary`, `network · none at runtime`, `permissions · microphone only`).

CTA colors: Discord `5865F2`, YouTube `FF0000`, X `181717`, LinkedIn `0A66C2`, GitHub `181717`, docs `526CFE`, Go `00ADD8`.

## 6. Formatting Rules

*   The header is HTML; everything after the section link bar is markdown (HTML only for galleries, `<details>` and image cells).
*   H1 only in the header. H2 for sections, H3 inside them.
*   Sentence case for H2 headings after the first word (`## Quick start`), except proper nouns.
*   No emoji.
*   Code blocks always declare a language.
*   Relative links for files in the repo; absolute URLs for everything else.
*   Every image has descriptive alt text.
*   No horizontal rules, no "generated by" footers.
