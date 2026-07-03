#!/usr/bin/env bash
set -e

echo "🤖 Symlinking AI Agent Rules to system directories..."

# Get absolute path to the src directory
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
SRC_DIR="${REPO_DIR}/src"

# ---------------------------------------------------------
# 1. Google Gemini / Antigravity
#    Global: ~/.gemini/config/AGENTS.md + skills/
# ---------------------------------------------------------
echo "  → Gemini / Antigravity..."
mkdir -p ~/.gemini/config
ln -sf "${SRC_DIR}/AGENTS.md" ~/.gemini/config/AGENTS.md
ln -sfn "${SRC_DIR}/skills" ~/.gemini/config/skills

# ---------------------------------------------------------
# 2. OpenAI Codex CLI
#    Global: ~/.codex/AGENTS.md + skills/
# ---------------------------------------------------------
echo "  → OpenAI Codex..."
mkdir -p ~/.codex
ln -sf "${SRC_DIR}/AGENTS.md" ~/.codex/AGENTS.md
ln -sfn "${SRC_DIR}/skills" ~/.codex/skills

# ---------------------------------------------------------
# 3. Anthropic Claude Code
#    Global: ~/.claude/CLAUDE.md + skills/
#    Note: Claude uses CLAUDE.md instead of AGENTS.md
# ---------------------------------------------------------
echo "  → Claude Code..."
mkdir -p ~/.claude
ln -sf "${SRC_DIR}/AGENTS.md" ~/.claude/CLAUDE.md
ln -sfn "${SRC_DIR}/skills" ~/.claude/skills

echo "✅ All AI Agent rules have been successfully symlinked!"
echo ""
echo "Linked paths:"
echo "  Gemini:  ~/.gemini/config/AGENTS.md → ${SRC_DIR}/AGENTS.md"
echo "  Codex:   ~/.codex/AGENTS.md         → ${SRC_DIR}/AGENTS.md"
echo "  Claude:  ~/.claude/CLAUDE.md        → ${SRC_DIR}/AGENTS.md"
echo "  Skills:  All three point to          → ${SRC_DIR}/skills/"
