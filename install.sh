#!/usr/bin/env bash
set -e

echo "🤖 Symlinking AI Agent Rules to system directories..."

# Get absolute path to the src directory
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
SRC_DIR="${REPO_DIR}/src"

# Links each skill individually so tool-managed skills in the directory survive.
link_skills() {
  local skills_root="$1"
  local skill_dir skill_name skill_target

  # Migrate installs where the whole directory was a symlink into this repo.
  if [[ -L "${skills_root}" ]]; then
    rm "${skills_root}"
  fi
  mkdir -p "${skills_root}"

  # An earlier install could nest this link inside a real directory.
  if [[ "$(readlink "${skills_root}/skills" || true)" == "${SRC_DIR}/skills" ]]; then
    rm "${skills_root}/skills"
  fi

  for skill_dir in "${SRC_DIR}"/skills/*; do
    [[ -f "${skill_dir}/SKILL.md" ]] || continue
    skill_name="${skill_dir##*/}"
    skill_target="${skills_root}/${skill_name}"
    if [[ -e "${skill_target}" && ! -L "${skill_target}" ]]; then
      echo "Cannot link ${skill_name}: ${skill_target} already exists and is not a symlink." >&2
      exit 1
    fi
    ln -sfn "${skill_dir}" "${skill_target}"
  done
}

# ---------------------------------------------------------
# 1. Google Gemini / Antigravity
#    Global: ~/.gemini/config/AGENTS.md + skills/
# ---------------------------------------------------------
echo "  → Gemini / Antigravity..."
mkdir -p ~/.gemini/config
ln -sf "${SRC_DIR}/AGENTS.md" ~/.gemini/config/AGENTS.md
link_skills "${HOME}/.gemini/config/skills"

# ---------------------------------------------------------
# 2. OpenAI Codex CLI
#    Global: ~/.codex/AGENTS.md + skills/
# ---------------------------------------------------------
echo "  → OpenAI Codex..."
mkdir -p ~/.codex
ln -sf "${SRC_DIR}/AGENTS.md" ~/.codex/AGENTS.md
link_skills "${HOME}/.codex/skills"

# ---------------------------------------------------------
# 3. Anthropic Claude Code
#    Global: ~/.claude/CLAUDE.md + skills/
#    Note: Claude uses CLAUDE.md instead of AGENTS.md
# ---------------------------------------------------------
echo "  → Claude Code..."
mkdir -p ~/.claude
ln -sf "${SRC_DIR}/AGENTS.md" ~/.claude/CLAUDE.md
link_skills "${HOME}/.claude/skills"

# ------------------------------------------------------------
# 4. OpenCode
#    Global: ~/.config/opencode/AGENTS.md
# ------------------------------------------------------------
echo "  → OpenCode..."
mkdir -p ~/.config/opencode
ln -sf "${SRC_DIR}/AGENTS.md" ~/.config/opencode/AGENTS.md

# ------------------------------------------------------------
# 5. Agent Skills standard
#    Global: ~/.agents/AGENTS.md + skills/
# ------------------------------------------------------------
echo "  → Agent Skills..."
mkdir -p ~/.agents
ln -sf "${SRC_DIR}/AGENTS.md" ~/.agents/AGENTS.md
link_skills "${HOME}/.agents/skills"

echo "✅ All AI Agent rules have been successfully symlinked!"
echo ""
echo "Linked paths:"
echo "  Gemini:  ~/.gemini/config/AGENTS.md → ${SRC_DIR}/AGENTS.md"
echo "  Codex:   ~/.codex/AGENTS.md         → ${SRC_DIR}/AGENTS.md"
echo "  Claude:  ~/.claude/CLAUDE.md        → ${SRC_DIR}/AGENTS.md"
echo "  OpenCode: ~/.config/opencode/AGENTS.md → ${SRC_DIR}/AGENTS.md"
echo "  Agents:  ~/.agents/AGENTS.md        → ${SRC_DIR}/AGENTS.md"
echo "  Skills:  ~/.{claude,codex,agents}/skills/*, ~/.gemini/config/skills/* → ${SRC_DIR}/skills/*"

