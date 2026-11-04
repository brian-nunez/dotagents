# Hygiene Files

## LICENSE

*   Default: MIT, the exact text from <https://spdx.org/licenses/MIT.txt>, with `<year> <copyright holders>` replaced by `<current year> Brian Nunez`.
*   Another license named in the interview: its exact SPDX text, fetched, never written from memory.
*   An existing `LICENSE` is kept. When it disagrees with the interview answer, report the conflict and wait for Brian.

## .gitignore

Build it in labelled blocks, baseline first:

```gitignore
# OS
.DS_Store
Thumbs.db

# Editors
.idea/
.vscode/*
!.vscode/extensions.json
*.swp

# Environment and secrets
.env
.env.*
!.env.example

# Logs
*.log
```

Then one block per stack from the interview, based on the matching template at <https://github.com/github/gitignore>, trimmed to entries the project can produce. Extending an existing file: append only missing entries, under the same block labels.

## .gitattributes

```gitattributes
# Normalize line endings; LF in the repository and the working tree.
* text=auto eol=lf

# Windows scripts keep CRLF.
*.bat text eol=crlf
*.cmd text eol=crlf
*.ps1 text eol=crlf

# Binary assets: no diff, no merge, no normalization.
*.png binary
*.jpg binary
*.jpeg binary
*.gif binary
*.webp binary
*.ico binary
*.pdf binary
*.zip binary
*.woff binary
*.woff2 binary
```

Add, from the survey:

*   `linguist-generated` for generated output that is committed (lockfiles, generated clients, `*.pb.go`, `*_templ.go`), so GitHub collapses it in diffs and drops it from language stats.
*   `linguist-vendored` for vendored third-party code.
*   Binary rules for any other binary extension present in the repository.

## CODEOWNERS

Path: `.github/CODEOWNERS`. Owners must be GitHub users or teams with write access, or GitHub ignores the line.

```text
# Default owner for everything.
*       @brian-nunez
```

Add one line per path-specific owner from the interview, below the default; later lines take precedence.
