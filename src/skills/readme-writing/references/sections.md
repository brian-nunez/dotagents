# Section Catalog

The section set follows the readme.so editor's section list (project sections only), adapted for generated content. Sections are listed in the order they appear in a finished README. Pick only the sections the repository supports.

Each entry gives: **Use when** (signals in the repo), **Needs** (facts that must be found or asked for), and **Shape** (markdown structure to fill with real content).

## Header Sections

These four are rendered by the header block in `style.md`, not as H2 sections.

### Logo
*   **Use when**: a logo or icon file exists in the repo, or the user supplies one.
*   **Shape**: image link directly above the H1 title.

### Title and Description
*   **Use when**: always.
*   **Shape**: H1 title, bold tagline, pitch paragraph.

### Badges
*   **Use when**: always offered; the user chooses which.
*   **Shape**: status row under the title, social row after the demo. See `style.md` section 3.

### Demo
*   **Use when**: a GIF, video, or hosted demo exists or is supplied.
*   **Shape**: media under the tagline, plus a link line for videos or live demos.

## Body Sections

### Features
*   **Use when**: always, when the project has user-facing capabilities.
*   **Needs**: capabilities found in code, CLI commands, routes, or docs; media decision from the confirm step.
*   **Shape**: grouped feature tables, see `style.md` section 4. Rendered as one or more themed H2s directly after the header, not under a heading named "Features".

### Screenshots
*   **Use when**: images exist that do not belong to a single feature row (full-app views, themes, platforms).
*   **Shape**:
    ```markdown
    ## Screenshots

    | Light | Dark |
    |-------|------|
    | ![Light theme](docs/media/light.png) | ![Dark theme](docs/media/dark.png) |
    ```
    A single image needs no table.

### Supported (Custom Reference Tables)
*   **Use when**: the project integrates with a list of providers, drivers, formats, or platforms.
*   **Shape**: reference tables, see `style.md` section 5. Title it for what it lists, e.g. "Supported Databases".

### Tech Stack
*   **Use when**: an application with distinct layers (client/server/infra), where the stack helps a reader orient. Skip for single-language libraries; the badges cover it.
*   **Shape**:
    ```markdown
    ## Tech Stack

    **Client:** <frameworks>

    **Server:** <language, frameworks>

    **Infrastructure:** <datastores, queues, deploy target>
    ```

### Downloads
*   **Use when**: prebuilt binaries, installers, or release artifacts exist.
*   **Shape**: bullet links: stable releases, latest builds, build from source (and which platforms each covers).

### Installation
*   **Use when**: the project is consumed as a package, library, or installed binary.
*   **Needs**: the real install command for each supported channel.
*   **Shape**:
    ~~~markdown
    ## Installation

    Install with <tool>:

    ```bash
    <install command>
    ```
    ~~~
    One short sentence plus one code block per channel (go install, npm, brew, docker pull).

### Run Locally
*   **Use when**: the project is an application someone would clone and run.
*   **Needs**: clone URL, prerequisites with versions, setup and start commands (Makefile targets, scripts, compose).
*   **Shape**: a short prerequisites list, then numbered-by-prose steps, each a one-line sentence followed by a `bash` block: clone, enter directory, install dependencies, configure, start.

### Environment Variables
*   **Use when**: the code reads environment variables or ships an `.env.example`.
*   **Needs**: every variable name, whether required, default, and meaning. Ask for meanings the code does not make obvious.
*   **Shape**:
    ```markdown
    ## Environment Variables

    | Variable | Required | Default | Description |
    |----------|----------|---------|-------------|
    | `NAME` | Yes | | What it controls. |
    ```

### Usage/Examples
*   **Use when**: always for libraries and CLIs; for apps, when there is a common workflow worth showing.
*   **Needs**: a real, minimal example that compiles or runs against the current API.
*   **Shape**: H2 "Usage", one sentence per example, one fenced code block per example in the project's language. CLI usage shows the command and, when short, its output.

### API Reference
*   **Use when**: the project exposes HTTP endpoints or a public library API.
*   **Needs**: routes, methods, parameters, and response shape from the code.
*   **Shape** (HTTP):
    ~~~markdown
    ## API Reference

    #### Get all items

    ```http
    GET /api/items
    ```

    | Parameter | Type | Description |
    | :-------- | :--- | :---------- |
    | `api_key` | `string` | **Required**. Your API key. |
    ~~~
    Library APIs: H4 per function or type with its signature in a code block and one sentence on behavior. For large APIs, link to generated docs (pkg.go.dev, docs.rs) instead of duplicating them.

### Running Tests
*   **Use when**: tests exist.
*   **Shape**: one sentence and a `bash` block with the real test command(s), including integration tests and their prerequisites if separate.

### Deployment
*   **Use when**: deploy config exists (Dockerfile, compose, Helm, Terraform, fly.toml, CI deploy job) or the user describes the process.
*   **Needs**: target environment and the real deploy command or pipeline.
*   **Shape**: one sentence per step with `bash` blocks.

### Documentation
*   **Use when**: docs exist beyond the README (docs folder, site, ROADMAP, CONTRIBUTING, design docs).
*   **Shape**: bullet links with short labels:
    ```markdown
    ## Documentation

    - [Development setup](docs/dev_setup.md)
    - [Architecture](docs/architecture.md)
    - [Roadmap](ROADMAP.md)
    ```

### Roadmap
*   **Use when**: a ROADMAP file, milestones, or user-supplied plans exist. If a ROADMAP file exists, link it from Documentation instead of duplicating it, unless the user wants a summary here.
*   **Shape**: bullet list of planned items, optionally as a task list (`- [ ]` / `- [x]`).

### FAQ
*   **Use when**: the user supplies questions, or issues/docs show recurring questions.
*   **Shape**: H4 per question, answer as a short paragraph beneath.

### Optimizations
*   **Use when**: the project has notable performance, accessibility, or refactoring work worth calling out (benchmarks, design choices). Common for portfolio projects.
*   **Shape**: short paragraphs or bullets naming the optimization and its measured effect.

### Lessons Learned
*   **Use when**: the user asks for it; typical for portfolio or learning projects.
*   **Shape**: short paragraphs on challenges and how they were solved.

### Used By
*   **Use when**: the user supplies a list of adopting companies or projects.
*   **Shape**: one sentence and a bullet list, optionally with logos.

### Related
*   **Use when**: sibling or companion projects exist (same owner's libraries, plugins, alternatives worth noting).
*   **Shape**: one sentence and bullet links, each with a short description.

### Color Reference
*   **Use when**: a design-heavy project with a defined palette (themes, UI kits).
*   **Shape**:
    ```markdown
    ## Color Reference

    | Color | Hex |
    | ----- | --- |
    | Primary | ![#0a192f](https://dummyimage.com/10/0a192f/0a192f?text=+) `#0a192f` |
    ```

### Authors
*   **Use when**: the user wants maintainers credited.
*   **Shape**: bullet list of `[@handle](https://github.com/handle)` entries.

### Contributing
*   **Use when**: the project accepts contributions.
*   **Shape**: one or two sentences, a link to `CONTRIBUTING.md` if it exists, and a link to the code of conduct if it exists. Never link files that do not exist.

### Feedback
*   **Use when**: the user supplies a feedback channel.
*   **Shape**: one sentence with the channel (issues link, discussions, email).

### Support
*   **Use when**: the user supplies a support channel.
*   **Shape**: one sentence with the channel.

### Acknowledgements
*   **Use when**: the project builds on notable libraries, papers, or prior work, or the user supplies credits.
*   **Shape**: bullet links with a short reason each.

### Appendix
*   **Use when**: there is useful material that fits nowhere else (glossary, background, benchmarks detail).
*   **Shape**: free-form, with H3 subheadings.

### License
*   **Use when**: a `LICENSE` file exists.
*   **Shape**: one sentence naming the license(s) with links to the license files, the copyright line if the license file has one, and a pointer to `NOTICE` if it exists.
    ```markdown
    ## License

    Project Name is licensed under the [MIT License](LICENSE).
    ```

### Custom Section
*   **Use when**: something important does not fit any section above (architecture overview, security policy, migration guide, benchmarks).
*   **Shape**: H2 with a specific title; follow the formatting rules in `style.md`.
