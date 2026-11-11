# CARE V2 agent design skill

A Claude Code skill for designing an AI agent, or a reusable skill, with the CARE V2 (Collaborative Agent Reasoning Engineering) method. It is the short "fast lane" version: it runs CARE V2 Phases 1 to 4 in one session and batches the questions for each phase instead of asking them one at a time.

CARE V2 designs the environment before the behavior and writes the prompt last. The skill keeps four layers separate:

| Layer | Owns |
|---|---|
| Context | knowledge the agent looks up when it needs it |
| Tools | execution, validation and runtime guidance |
| Reasoning | how the agent decides across context and tools |
| Guardrails | safety, refusals and escalation |

## What it does

1. Scope. Eight questions about purpose, users, tasks, the current workflow, pain points, which decisions stay with people, and what success looks like.
2. Environment. The systems and data that exist, the context files the agent needs and when it should read them, the tools (if any), and the output format.
3. Reasoning and guardrails. How the agent breaks down tasks, when it asks versus acts, how it picks tools, when it hands off to a person, and what it must never do.
4. Prompt synthesis. The final agent prompt, the reasons behind the design choices, and a traceability matrix that ties every clause of the prompt to an earlier answer.

You confirm each phase's output before the next one starts. Anything you don't know yet is marked `TBD` instead of filled in. If you ask for a skill instead of an agent, Phase 4 writes a `SKILL.md`.

Phase 5 of CARE V2 (benchmarking) is not part of this skill.

## Install

You need [Claude Code](https://code.claude.com).

```
git clone https://github.com/nidhi23aug/care-agent-design-skill.git
cd care-agent-design-skill
./install.sh
```

This copies the skill to `~/.claude/skills/agent-design-care-v2/`. To install by hand, copy `skills/agent-design-care-v2/` into `~/.claude/skills/`. For Claude.ai or Cowork, upload the `agent-design-care-v2` folder as a skill.

## Use it

Ask in plain words, for example:

- "Design an agent that helps scientists find the right NASA dataset for a research question."
- "I need a skill that turns meeting notes into action items. Spec it out with CARE."
- "Turn this idea into an agent: ..."

The skill mentions a `prompt-architect` skill for prompt patterns. That skill isn't included here; without it, Claude uses the prompt patterns it already knows.

## License

MIT
