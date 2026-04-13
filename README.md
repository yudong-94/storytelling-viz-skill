# Storytelling Viz Skill

`storytelling-viz` is a reusable agent skill for turning a dataset into one polished, story-first Plotly visualization.

It is designed for the common case where someone has a file or source table and wants:

- one clear chart, not a dashboard
- one defensible takeaway, not a bundle of weak observations
- stakeholder-facing copy and layout
- local review artifacts before publishing anywhere

The skill is intentionally portable. The main instructions live in the open `SKILL.md` format so the same core workflow can be installed in both Codex and Claude Code. Tool-specific metadata stays outside that file.

## Primary Use Case

Use this skill when you want an agent to:

1. inspect a dataset and verify the source
2. recommend one default chart plus one fallback
3. wait for confirmation before building
4. produce a self-contained visualization package with:
   - `index.html`
   - `preview.html`
   - `source-data.ext` when a local file was provided
5. run rendered QA and report actual caveats

This is best for:

- analyst-to-stakeholder charts
- one-off story visualizations
- visual explainers embedded later into other surfaces
- example galleries for chart-generation skills

It is not intended for:

- full dashboard apps
- website publishing flows
- markdown post generation
- repo-specific CMS integration

## What The Skill Produces

By default, the output is a self-contained folder like:

```text
viz/project-name/
  index.html
  preview.html
  source-data.csv
```

The wrapper `preview.html` carries the main editorial takeaway. The embedded `index.html` uses a shorter functional title and compact chart-specific framing.

## Repo Layout

- `SKILL.md`: canonical shared instructions for Codex and Claude Code
- `agents/openai.yaml`: Codex-specific metadata
- `references/style-guide.md`: style and framing guidance
- `references/plotly-patterns.md`: implementation patterns
- `viz-example/`: publishable example outputs built with the skill
- `install.sh`: simple installer for Codex or Claude Code

## Compatibility

This repo is structured so `SKILL.md` stays portable:

- Claude Code can use `SKILL.md` directly.
- Codex can use `SKILL.md` plus `agents/openai.yaml`.
- The references folder is shared by both.

If you change the core workflow, update `SKILL.md` first. If you change Codex-specific presentation or discovery metadata, update `agents/openai.yaml`.

## Install

Clone the repo, then run one of:

```bash
./install.sh codex
./install.sh claude
```

Install targets:

- `codex`: `$CODEX_HOME/skills/storytelling-viz` or `~/.codex/skills/storytelling-viz`
- `claude`: `~/.claude/skills/storytelling-viz`

Manual install also works: copy `SKILL.md` and `references/` into the target skill directory, and include `agents/openai.yaml` for Codex.

## Typical Prompts

Codex:

```text
Use $storytelling-viz to inspect this dataset, recommend the best chart and one fallback, wait for my confirmation, then build a stakeholder-facing Plotly visualization with index.html and preview.html.
```

Claude Code:

```text
Use storytelling-viz on this CSV. Review the dataset and source, recommend one chart and one fallback, wait for my confirmation, then build the final visualization package.
```

## Workflow Expectations

The skill is opinionated about process:

- it requires a real source citation before finalizing a chart
- it does not skip chart confirmation when multiple valid directions exist
- it prefers structural simplification over annotation-heavy fixes
- it expects rendered visual QA, not just code completion

## Examples

The current example gallery lives in [`viz-example/`](/Users/hzdy1994/Documents/GitHub/storytelling-viz-skill/viz-example). It includes ranking, cohort, timeline, scatter, and bump-chart cases such as:

- `jobs-held-by-age-sex`
- `marriage-by-age-education`
- `state-migration-net-balance-2023`
- `japan-prefecture-bump-top6`

Each example folder includes:

- `preview.html`: stakeholder-facing review wrapper
- `index.html`: the actual embedded chart artifact
- `preview-desktop.png`: a static desktop thumbnail for quick scanning on GitHub

The PNGs are thumbnails only. The HTML files are the canonical examples and the actual outputs this skill is meant to produce.

These examples are useful both as usage references and as regression checks for changes to the skill instructions.

## Featured Examples

These examples show the range of the skill across timeline, ranking, cohort, and bump-chart storytelling formats.

### Kilauea Eruption Timeline

[![Kilauea eruption timeline thumbnail](/viz-example/kilauea-eruption-timeline/preview-desktop.png)](/viz-example/kilauea-eruption-timeline)

### State Migration Net Balance 2023

[![State migration net balance thumbnail](/viz-example/state-migration-net-balance-2023/preview-desktop.png)](/viz-example/state-migration-net-balance-2023)

### Top 6 Japan Prefecture Destinations by US Visitors

[![Japan prefecture bump chart thumbnail](/viz-example/japan-prefecture-bump-top6/preview-desktop.png)](/viz-example/japan-prefecture-bump-top6)

### Marriage Rate By Age And Education

[![Marriage by age and education thumbnail](/viz-example/marriage-by-age-education/preview-desktop.png)](/viz-example/marriage-by-age-education)

