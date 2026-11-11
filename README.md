# CARE Lightweight

A lightweight Claude Code skill for designing an AI agent, or a reusable skill, with the CARE V2 (Collaborative Agent Reasoning Engineering) method.

## Credit

This skill is based on [NASA-IMPACT/AKD-CARE](https://github.com/NASA-IMPACT/AKD-CARE), which documents the full CARE methodology and its artifacts phase by phase. I used that repo to build this shorter version. It keeps the CARE phases and their order, cuts the process down, and asks easier questions in a few batches so you can design an agent in one sitting. For the complete method, including Phase 5 benchmarking, use the AKD-CARE repo.

## How it works

CARE designs the environment before the behavior and writes the prompt last. The skill keeps four layers separate:

| Layer | Owns |
|---|---|
| Context | knowledge the agent looks up when it needs it |
| Tools | execution, validation and runtime guidance |
| Reasoning | how the agent decides across context and tools |
| Guardrails | safety, refusals and escalation |

It runs CARE Phases 1 to 4 in one session:

1. Scope. Eight short questions about purpose, users, tasks, the current workflow, pain points, which decisions stay with people, and what success looks like.
2. Environment. The systems and data that exist, the context files the agent needs and when it should read them, the tools (if any), and the output format.
3. Reasoning and guardrails. How the agent breaks down tasks, when it asks versus acts, how it picks tools, when it hands off to a person, and what it must never do.
4. Prompt synthesis. The final agent prompt, the reasons behind the design choices, and a traceability matrix that ties every clause of the prompt to an earlier answer.

You confirm each phase's output before the next one starts. Anything you don't know yet is marked `TBD` instead of filled in. If you ask for a skill instead of an agent, Phase 4 writes a `SKILL.md`.

## Install

You need [Claude Code](https://code.claude.com).

```
git clone https://github.com/nidhi23aug/CARE-lightweight.git
cd CARE-lightweight
./install.sh
```

This copies the skill to `~/.claude/skills/care-lightweight/`. To install by hand, copy `skills/care-lightweight/` into `~/.claude/skills/`. For Claude.ai or Cowork, upload the `care-lightweight` folder as a skill.

## Use it

Ask in plain words, for example:

- "Design an agent that helps scientists find the right NASA dataset for a research question."
- "I need a skill that turns meeting notes into action items. Spec it out with CARE."
- "Turn this idea into an agent: ..."

The skill mentions a `prompt-architect` skill for prompt patterns and AKD guardrail tools (GraniteGuardianTool, RiskAgent). Neither is included here. Without them, Claude uses the prompt patterns it already knows, and you list your own guardrails in Phase 3.

## License

MIT for this skill. The CARE methodology itself comes from [NASA-IMPACT/AKD-CARE](https://github.com/NASA-IMPACT/AKD-CARE); see that repo for its terms.
