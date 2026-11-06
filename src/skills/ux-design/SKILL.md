---
name: ux-design
description: Design a page or user experience through an adaptive discovery interview, an agreed brief, and iterative visual or interactive mockups in a design tool or isolated HTML. Use for visual direction, page composition, UX flows, and interface redesign; production feature implementation and system architecture are outside this skill.
---

# UX Design

Help Brian discover what the experience needs to do, establish its visual character, and review a tangible design. The output is a design artifact with enough simulated behavior to evaluate its UX.

## Scope and working agreement

- Work on appearance, content hierarchy, navigation, interaction design, responsive composition, and relevant states.
- Use local HTML/CSS/JS or an available design tool. Simulate behavior with fictional data; identify simulations and any unimplemented interactions.
- Keep artifacts separate from production application code. Production services, schemas, authentication, integrations, dependency changes, and deployment require a separately authorized task.
- Respect existing brand and component conventions unless Brian authorizes exploring alternatives. Preserve his existing work.
- Follow the host environment's tool, skill, browser, file, and external-write rules. A design request does not authorize publication, messages, or changes to a shared design document.

## 1. Understand the experience

Read [discovery-interview.md](references/discovery-interview.md) at the start of a new brief or when the problem changes materially.

Start from the conversation and supplied artifacts. Identify what is already known before asking questions. Use small rounds, usually one to three focused questions, and adapt the next round to the answers. Ask for concrete tasks and examples before asking for decorative preferences.

Keep asking while an unresolved answer could materially change the page's purpose, primary task, information structure, interaction, or visual direction. Do not decide that an arbitrary number of rounds is enough. Do not repeat answered questions or demand precision on choices Brian has delegated.

Distinguish facts, Brian's preferences, assumptions, and hypotheses about end users. Interviewing Brian does not establish that a design has been tested with its intended users.

**Discovery is ready when you can explain:**

- Who uses the page, under what circumstances, and what they need to accomplish.
- The primary task, its entry point and successful outcome, and the important supporting tasks.
- The content and realistic examples needed to evaluate the design.
- The meaningful states and constraints, including device use and existing brand or UI requirements.
- The desired character, known dislikes, and how the design will be judged.
- What remains uncertain, and whether it is resolved, delegated, or explicitly part of the design exploration.

Summarize these as a short design brief, including scope, proposed artifact/tool, and observable success criteria. Ask Brian to confirm or correct it before creating the design. Wait for his response. An already approved brief or an explicit instruction to proceed using stated assumptions satisfies this gate; do not request the same approval again.

## 2. Shape the experience and visual direction

Read [information-and-flows.md](references/information-and-flows.md) and [visual-direction.md](references/visual-direction.md) after the brief is confirmed.

Start with the actual task and content. Outline the primary flow, meaningful groups, action scope, and necessary states before committing to the application shell. For an existing design, identify specific friction and preserve what works.

If visual direction is unresolved, offer a small set of meaningfully different directions, describing their suitability and tradeoffs. Produce comparative sketches only when useful and authorized by the brief. If the direction is already clear, develop it directly.

Choose a constrained initial vocabulary for type, spacing, surfaces, color roles, controls, and elevation. Refine it in context; a token list is not a substitute for a page. Use fidelity that answers the next uncertain design question. Move to a polished design once structure and direction are sound.

## 3. Create the reviewable artifact

Read [tools-and-prototypes.md](references/tools-and-prototypes.md) before selecting or writing the artifact. Tool choice follows Brian's preference, available capabilities, and the questions the design must answer.

Read the references that match the content before designing the corresponding parts:

| Design problem | Reference |
| --- | --- |
| Priority, grouping, density, sizing, and composition | [hierarchy-and-layout.md](references/hierarchy-and-layout.md) |
| Text, reading, meaningful copy, and type roles | [typography-and-content.md](references/typography-and-content.md) |
| Color roles, neutrals, surfaces, and depth | [color-and-surfaces.md](references/color-and-surfaces.md) |
| Photos, icons, screenshots, and unpredictable images | [imagery-and-icons.md](references/imagery-and-icons.md) |
| Inputs, selection, validation, and action ownership | [forms-and-actions.md](references/forms-and-actions.md) |
| Tables, metrics, filters, and data comparisons | [data-heavy-interfaces.md](references/data-heavy-interfaces.md) |
| Narrow layouts, content reorganization, and input methods | [responsive-design.md](references/responsive-design.md) |

For each page, use the hierarchy, typography, and color references where those decisions are not already settled by the existing system. Use the responsive reference for multiviewport designs. Read [accessibility.md](references/accessibility.md) for every design before finalizing its visual or interaction choices.

Use credible example content and deliberately include a difficult case. Implement or represent the primary path and states needed by the brief. Make controls do something meaningful within the simulation, or clearly identify their limit. Keep decorative details subordinate to task clarity.

## 4. Inspect, discuss, and iterate

Read [design-review.md](references/design-review.md) before presenting the first artifact and during substantive revisions.

Inspect the rendered artifact using permitted tools. Check the actual layout and interactions, not just the source code. For static designs, inspect the available frames and identify behavior that has not been exercised. If rendering or interaction inspection is unavailable, disclose that limitation instead of claiming verification.

Evaluate against the agreed task and success criteria. Fix demonstrable problems before presenting. Show or link the artifact using the host's supported presentation mechanism. Explain the few decisions that affect the experience and ask focused feedback questions about the remaining uncertainty.

Translate feedback into a design hypothesis and revise the relevant decisions. Reopen discovery only if new information materially changes the brief. Continue within the approved scope without requesting approval for each ordinary visual refinement.

## Completion and handoff

A design is ready for review when the agreed task, relevant states, visual direction, and target layouts are represented, and the artifact has been inspected to the extent supported by its format. It is accepted only when Brian accepts it or explicitly delegates that judgment. When feedback is pending, say "ready for review" rather than claiming acceptance.

Deliver:

- The editable design or local artifact and its entry point.
- A short explanation of the meaningful UX and visual decisions.
- What interactions and states are simulated, what was inspected, and material unresolved questions.
- Implementation-relevant design notes only where needed to preserve intent; keep production engineering separate.

For provenance, optional local Refactoring UI assets, worked-example locations, and authoritative further reading, consult [sources-and-further-reading.md](references/sources-and-further-reading.md). The original package is optional; the skill must work without it.
