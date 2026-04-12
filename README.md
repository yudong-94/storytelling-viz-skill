# Storytelling Viz Skill

`storytelling-viz` is an agent skill for building story-first Plotly visualizations from a dataset. It focuses on a single clear takeaway and produces local review artifacts such as `index.html`, `preview.html`, and concise insight bullets.

The skill content is kept in the open `SKILL.md` format so the same core instructions can be installed into both Codex and Claude Code. Codex-specific UI metadata lives in `agents/openai.yaml`.

## Contents

- `SKILL.md`: canonical skill instructions
- `agents/openai.yaml`: Codex UI metadata
- `references/`: supporting style and Plotly guidance
- `install.sh`: installer for Codex or Claude Code

## Install

Download or clone the repo, then run one of:

```bash
./install.sh codex
./install.sh claude
```

Targets:

- `codex`: installs to `$CODEX_HOME/skills/storytelling-viz` or `~/.codex/skills/storytelling-viz`
- `claude`: installs to `~/.claude/skills/storytelling-viz`

If you prefer manual installation, copy this repo's files into the corresponding skills directory for the target tool.

## Use

Codex example:

```text
Use $storytelling-viz to review my dataset, recommend a chart, wait for my confirmation, and then build a polished Plotly visualization with index.html, preview.html, and insight bullets.
```

Claude Code example:

```text
/storytelling-viz path/to/data.csv
```
