---
name: readme-writing
description: Writes or rewrites a project's README.md in a fixed house style (centered HTML product header with icon, two-tone badges, CTA button, hero screenshot, then markdown sections) from a section catalog, then renders and checks it visually. Trigger when asked to create, rewrite, or overhaul a README for a repository.
---
# README Writing

A README is built from three inputs:

*   **Section catalog** (`references/sections.md`): the sections a README may contain, when each applies, what facts it needs, and its shape.
*   **House style** (`references/style.md`): the centered header markup, body section patterns, badge reference and formatting rules. Copy its HTML templates literally; the header is what readers judge first, and a left-aligned markdown header is a failed README.
*   **Tools** (`scripts/`): render a GitHub-style preview, serve badges offline, capture screenshots, and check links. Run `npm install` in `scripts/` once; Python needs Playwright with Chromium and Pillow.

Read both reference files before starting.

## Workflow

### 1. Inspect the repository
Gather facts before proposing anything. Look at, at minimum:
*   Manifests and toolchain: `go.mod`, `package.json`, `Cargo.toml`, `pyproject.toml`, `requirements.txt`, `mkdocs.yml`, `Makefile`, `Dockerfile`, `docker-compose.yml` / `compose.yml`.
*   Entry points and layout: `cmd/`, `src/`, `internal/`, `bin/`, `scripts/`.
*   Existing docs: current `README.md`, `docs/`, `_docs/`, `ROADMAP.md`, `CONTRIBUTING.md`, `CHANGELOG.md`, `AGENTS.md`.
*   Licensing: `LICENSE*`, `NOTICE`.
*   CI and releases: `.github/workflows/`, release config, git tags.
*   Configuration: `.env.example`, config loaders and their defaults, flags, environment variable reads. Take defaults from the code, not from the Makefile or compose file, and say where those differ.
*   Routes and features: router registration, handlers, pipeline stages, CLI commands. Existing READMEs are often out of date; the code is the source of truth, and features missing from the old README belong in the new one.
*   Media: `docs/images/`, `docs/brand/`, `assets/`, any `.gif`, `.png`, `.webp`, `.mp4`, logos and icons.
*   Visibility: whether the repository is public or private (live shields.io badges do not render for private repositories).

For a private repository that a plain `git clone` cannot reach, attach it through the session's repository tools before cloning.

Every claim in the README must trace back to something found here or something the user states. Never invent commands, flags, env vars, endpoints, contacts, companies, or metrics.

### 2. Study any reference README from its source
When the user points at a README they like, read its raw markdown, never a fetched or rendered page: page fetchers strip the HTML (`<p align="center">`, `<picture>`, badge `<img>` rows, `<sub>` captions) that makes the layout. Get the source with a sparse clone:

```sh
git clone -q --depth 1 --filter=blob:none --sparse https://github.com/<owner>/<repo>.git ref
git -C ref sparse-checkout set --no-cone /README.md
```

If the user's screenshot shows a different repository than the link (for example a sibling project from the same organization), find and read that one. Match the reference's structure element by element.

### 3. Gather media
The header needs an icon and a hero image to look right. In order of preference:
1.  Media already in the repo or supplied by the user.
2.  Real captures: run the project locally and screenshot it with `python3 scripts/capture.py <url> docs/images/<name>.png [dark|light]` (1600×1000 viewport at device scale 2, saved 2000px wide). For a docs site, build it (`mkdocs build -d <dir>`), serve the output with `python3 -m http.server`, and capture the home page plus one or two representative pages for a gallery.
3.  For a missing icon, an original SVG tile saved as `docs/brand/icon.svg`: 256×256 rounded square (`rx="56"`), a gradient in the project's brand color, and one simple white glyph that says what the project does. Call it out as a placeholder in the final report.

Never fabricate a screenshot of UI that was not captured. If the project cannot be run here (missing toolchain, blocked module downloads, platform-specific app), leave out the hero image and report exactly which capture is still needed and where it goes (`docs/images/hero.png`).

### 4. Propose, then confirm (one round)
Unless the user said not to ask (see below), present a single proposal and wait for the answer before writing. Use the interactive question tool when one is available; otherwise ask in plain text. The proposal covers:

1.  **Sections**: the catalog sections selected for this repo, in final order, each with a one-line reason drawn from the inspection. List the notable sections left out, so the user can add them back. Offer a Custom section if something in the repo does not fit the catalog.
2.  **Badges**: always ask. Offer the fact badges and live badges from `references/style.md` that the repo can support (license found, CI workflow found, tags found, language detected, public or private), and ask for any social URLs (Discord, X, YouTube, LinkedIn, website).
3.  **Tagline, CTA and link bar**: the proposed bold tagline, the single CTA button, and the links for the bold-first link bar.
4.  **Media**: what was found or captured, which icon will be used, and how to handle feature-table previews (user media, placeholders, or no Preview column).
5.  **Missing facts**: for every selected section that needs facts the repo does not reveal (deployment target, support contact, env var meanings, FAQ entries, Used By list), ask for them here. If the user declines to supply them, drop that section rather than writing filler.

### 5. Write
*   Follow `references/style.md` for the header, callout, section link bar, body patterns and formatting rules.
*   Use each section's shape from `references/sections.md`, filled with real content. The shapes are structure, not text to copy; never leave template sample values (`my-project`, `fake@fake.com`, `API_KEY`, dummy images).
*   When rewriting an existing README, keep accurate content and links the user did not ask to remove.
*   Write to `README.md` at the repository root. Media goes under `docs/images/` and `docs/brand/`, and is delivered together with the README.

### 6. Verify
Run every check before reporting done. A README that has not been rendered and looked at is not done.

1.  **Links**: `bash scripts/check_links.sh README.md <repo-root>` must report nothing. It covers markdown links, HTML `src`/`href`/`srcset`, and in-page anchors against heading slugs. Run it against the real repository tree with the new media copied in, not against an output folder that lacks the repo's files.
2.  **Facts**: every command matches a Makefile target, script, package script or binary flag; every env var and default matches the code; every badge URL matches the real owner/repo, workflow filename and license.
3.  **Render**: build a GitHub-style preview and screenshot it in both themes:
    ```sh
    node scripts/render.mjs README.md /tmp/readme-dark.html dark
    python3 scripts/preview.py /tmp/readme-dark.html /tmp/readme-dark.png 1250 dark
    node scripts/render.mjs README.md /tmp/readme-light.html light
    python3 scripts/preview.py /tmp/readme-light.html /tmp/readme-light.png 1250 light
    python3 scripts/preview.py /tmp/readme-dark.html /tmp/readme-full.png full dark
    ```
    Keep the HTML next to the README (or pass absolute image paths) so relative images resolve. `preview.py` serves shields.io badges through `scripts/badge.mjs` (the same renderer shields.io uses), so badges show even when `img.shields.io` is unreachable; live badges appear with the message `live` because their real values only exist on shields.io.
4.  **Look**: open the screenshots and compare the header against `references/style.md` section 2 and any reference README the user gave: centered icon, title with rule, bold tagline, description and byline, two badge rows, CTA button, bold-first link bar, hero with caption, callout, one-line section link bar. Check the body for broken tables, raw HTML showing as text, and code blocks that overflow. Fix and re-render until it matches.
5.  **Hand over**: show the user the rendered previews along with the files.

## When the user says not to ask

Skip step 4. Make the choices yourself and list them in the final report:
*   Sections: everything the repository supports with real content.
*   Badges: fact badges for language, platform, engine/runtime and license, plus every live badge the repo supports (only for public repositories). Leave out socials with no known URL.
*   CTA button: the most useful public destination (docs site, releases, live demo). For a private repository with no public destination, link the button to `#quick-start`.
*   Media: as in step 3, with placeholder icons where none exist.
*   Missing facts: leave out the section.

## Final report

State plainly:
*   Which media are real captures, which are placeholders, and which captures are still missing and why.
*   Any badge or value that could not be verified from here.
*   Any choice made without asking.

Do not describe the README as matching a reference unless the rendered screenshot was compared against it.
