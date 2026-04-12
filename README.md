# Storytelling Viz Skill

`storytelling-viz` is a Codex skill for building story-first Plotly visualizations from a dataset. It focuses on a single clear takeaway and produces local review artifacts such as `index.html`, `preview.html`, and concise insight bullets.

## Contents

- `SKILL.md`: skill instructions and workflow
- `agents/openai.yaml`: UI metadata for the skill
- `references/`: supporting style and Plotly guidance

## Install

Copy this folder into your Codex skills directory as:

```text
$CODEX_HOME/skills/storytelling-viz
```

Or clone this repository and place its contents at that same path.

## Use

Example prompt:

```text
Use $storytelling-viz to review my dataset, recommend a chart, wait for my confirmation, and then build a polished Plotly visualization with index.html, preview.html, and insight bullets.
```
