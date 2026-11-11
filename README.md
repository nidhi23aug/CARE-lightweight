# CARE Lightweight

The CARE approach, made lightweight, for designing new agents or new skills. It is a Claude Code skill that walks you through CARE V2 (Collaborative Agent Reasoning Engineering) in one short session.

## Credit

This skill is based on [NASA-IMPACT/AKD-CARE](https://github.com/NASA-IMPACT/AKD-CARE), which documents the full CARE methodology and its artifacts phase by phase. I used that repo to build this shorter version. It keeps the CARE phases and their order, cuts the process down, and asks easier questions in a few batches so you can design an agent in one sitting. For the complete method, including Phase 5 benchmarking, use the AKD-CARE repo.

## How much shorter it is

The original CARE process in AKD-CARE is built for enterprise science work. Subject matter experts, developers and a helper agent work through five stage-gated phases. The helper asks one question at a time, each sub-phase produces its own artifact, and SMEs and developers sign off at every gate before the next phase starts. Phase 5 then builds benchmark query sets, scoring rubrics and baselines.

CARE Lightweight keeps Phases 1 to 4 and their order, and changes how you get through them:

| | Original CARE | CARE Lightweight |
|---|---|---|
| Who takes part | SMEs, developers and a helper agent | you and Claude |
| How questions are asked | one at a time | a few short batches per phase |
| Phases | 1 to 5, including benchmarking | 1 to 4 |
| Sign-off | joint SME and developer approval at each stage gate | you confirm each phase's output |
| Artifacts | a separate document per sub-phase | one artifact per phase, plus the final prompt |
| Rough time | several hours of working sessions, often spread over days or weeks | about 15 to 20 minutes |

The times are estimates. Neither repo measures them. For CARE Lightweight, the estimate assumes you already know the answers about your users, data and tools: a few minutes for the eight scoping questions, five to eight minutes for the environment questions, a few minutes for reasoning and guardrails, and a couple of minutes to review the final prompt. A simple skill with no tools can take closer to 10 minutes. An agent with many tools or data sources, or one where you need to look things up, can take 30 minutes or more. The original process takes longer mostly because several people have to answer and approve each stage.

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

## Citation

CARE is described in this NASA technical memorandum. If you use CARE, please cite it:

> Ramachandran, R., Jha, N., & Ramasubramanian, M. (2026). *Collaborative Agent Reasoning Engineering (CARE): A Structured Three-Party Design Methodology for Systematically Engineering AI Agents with SMEs, Developers, and Helper Agents* (Technical Memorandum). National Aeronautics and Space Administration. <https://doi.org/10.64631/TAXQ7736>

## License

This skill is MIT licensed. [NASA-IMPACT/AKD-CARE](https://github.com/NASA-IMPACT/AKD-CARE) is licensed under Apache 2.0.
