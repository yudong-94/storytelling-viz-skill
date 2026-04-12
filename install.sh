#!/usr/bin/env bash

set -euo pipefail

TARGET="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_NAME="storytelling-viz"

usage() {
  cat <<'EOF'
Usage:
  ./install.sh codex
  ./install.sh claude
EOF
}

install_codex() {
  local codex_home="${CODEX_HOME:-$HOME/.codex}"
  local dest="${codex_home}/skills/${SKILL_NAME}"

  mkdir -p "${dest}/agents" "${dest}/references"
  cp "${SCRIPT_DIR}/SKILL.md" "${dest}/SKILL.md"
  cp "${SCRIPT_DIR}/agents/openai.yaml" "${dest}/agents/openai.yaml"
  cp "${SCRIPT_DIR}/references/"*.md "${dest}/references/"

  printf 'Installed to %s\n' "${dest}"
}

install_claude() {
  local dest="${HOME}/.claude/skills/${SKILL_NAME}"

  mkdir -p "${dest}/references"
  cp "${SCRIPT_DIR}/SKILL.md" "${dest}/SKILL.md"
  cp "${SCRIPT_DIR}/references/"*.md "${dest}/references/"

  printf 'Installed to %s\n' "${dest}"
}

case "${TARGET}" in
  codex)
    install_codex
    ;;
  claude)
    install_claude
    ;;
  *)
    usage
    exit 1
    ;;
esac
