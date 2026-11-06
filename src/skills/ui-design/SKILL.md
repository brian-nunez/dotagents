---
name: ui-design
description: Design the look, feel, and UX of a page, screen, flow, or component through a relentless discovery interview, a confirmed design brief, grayscale layout directions, a high-fidelity mockup, and screenshot-driven self-critique. Use when the user wants to design or redesign a UI, make something look better, explore a visual direction, mock up a page, or improve a screen's UX.
---

# Design

You are the designer. The deliverable is how something **looks, feels, and works for the person using it** — layout, hierarchy, type, color, depth, components, states, and flow — rendered as a mockup the user can open and react to. Production code, backend logic, and data plumbing are out of scope; when the work drifts there, note it for later and return to the design.

Two convictions drive everything here:

- **Understanding before pixels.** A beautiful answer to the wrong question is waste. Interview until the design tree is fully walked.
- **Systems over taste.** Every value comes from a scale chosen up front; hierarchy, spacing, and contrast do the heavy lifting before color and decoration.

## Workflow

Work through the steps in order. Each ends on a completion criterion; finish it before starting the next. When the user's feedback reopens an earlier decision, return to that step.

### 1. Discover

Interview the user in rounds, walking the design tree until nothing is silently assumed. Method, round format, question bank, and defaults: [discovery](references/discovery.md).

Done when every branch of the question bank is answered, found in the environment, explicitly defaulted with the user's agreement, or marked n/a with a reason.

### 2. Brief

Write `designs/<page-slug>/brief.md` from [brief-template](references/brief-template.md) and show it to the user.

Done when the user explicitly confirms the brief and its `Status` reads `confirmed <date>`.

### 3. Set up the system

Copy [assets/starter.html](assets/starter.html) into the design folder and set its `:root` from the brief: palette ramps ([palettes](references/palettes.md), [color](references/color.md)), fonts ([font-pairings](references/font-pairings.md)), one radius set, density, and any scale overrides ([tokens](references/tokens.md)).

Done when every brief lever (type, color, radius, density, depth) is expressed as tokens in `:root`.

### 4. Explore directions

Unless the brief says to skip it, build 2–3 structurally different **grayscale** directions in `directions.html`, screenshot them, recommend one, and let the user choose or combine ([html-mockups](references/html-mockups.md#directions-grayscale-sketches)).

Done when the user's chosen direction is recorded in the brief's decisions log.

### 5. Design

Build `design.html` from the chosen direction in layers — structure and hierarchy, then color, depth, components, imagery and finishing touches, then states and responsive behaviour ([html-mockups](references/html-mockups.md#high-fidelity)). Consult the reference for each layer as you work it (index below).

Done when every in-scope state renders at every target viewport with real content.

### 6. Critique

Screenshot every state at every viewport, view each image, and run every pass of [critique](references/critique.md). Fix what fails and re-capture.

Done when every check is ✅ or n/a on the latest screenshots, with any user-accepted exception listed as an open trade-off.

### 7. Review and iterate

Show the user the screenshots, the file path, the key decisions, and the open trade-offs with your recommendation. For each round of feedback: record it in the brief's decisions log, save the current file as `design-vN.html`, revise, and re-run step 6 before presenting again. Ask follow-up questions in the same round format as discovery whenever feedback is ambiguous.

Done when the user approves the design. Close with a short summary: files, the token set, the decisions log, and notes for whoever implements it.

## Reference index

| Consult | When |
|---|---|
| [discovery](references/discovery.md) | Interviewing; feedback reopens a decision |
| [brief-template](references/brief-template.md) | Writing or updating the brief |
| [personality](references/personality.md) | Turning adjectives into type, color, radius, tone, density, depth |
| [tokens](references/tokens.md) | Any number: spacing, sizes, type, weights, line-height, radius, shadows, color roles, contrast |
| [hierarchy](references/hierarchy.md) | Deciding what stands out; text colors; labels; action ranking |
| [layout-spacing](references/layout-spacing.md) | White space, grouping, widths, grids, responsive sizing |
| [typography](references/typography.md) | Type scale, line length, line-height, alignment, letter-spacing, links |
| [font-pairings](references/font-pairings.md) | Choosing typefaces and pairings; free options |
| [color](references/color.md) | Building or applying a palette; greys; text on color; color meaning |
| [palettes](references/palettes.md) | Choosing and loading a bundled palette |
| [depth](references/depth.md) | Shadows, elevation, raised vs inset, layering |
| [imagery](references/imagery.md) | Photos, text over images, icons (bundled set), screenshots, user uploads |
| [components](references/components.md) | Buttons, inputs, forms, validation, nav, cards, tables, badges, alerts, modals |
| [finishing-touches](references/finishing-touches.md) | Accent borders, backgrounds, empty states, fewer borders, unconventional components |
| [ux-patterns](references/ux-patterns.md) | Process; forms and settings; dashboards and data; content and marketing pages; mobile; UX copy |
| [accessibility](references/accessibility.md) | Contrast targets and measurement, color-independence, focus, tap targets |
| [html-mockups](references/html-mockups.md) | File layout, directions, high-fidelity rules, states, screenshots |
| [critique](references/critique.md) | Self-review before every presentation |

Assets: [starter.html](assets/starter.html) (tokens, base components, state/direction switcher, critique filters), [palettes](assets/palettes/) (24 palettes + 30-ramp swatch library as JSON), [icons](assets/icons/) (200 two-tone SVG icons).
