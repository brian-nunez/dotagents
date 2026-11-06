# HTML mockups

How to build, organise, render, and screenshot the mockups: file layout, grayscale direction sketches, high-fidelity rules, states, responsive frames, and the screenshot loop used by critique. Consult it before writing any mockup file.

## File layout

```
designs/<page-slug>/
  brief.md            # confirmed design brief + decisions log
  directions.html     # 2–3 grayscale layout directions (?direction=a|b|c)
  design.html         # the high-fidelity mockup (?state=…)
  design-v1.html      # previous iterations, kept for comparison
  screenshots/        # design-<state>-<width>.png, directions-<a|b|c>-<width>.png
```

One self-contained HTML file per artifact: inline `<style>`, inline SVG icons, no build step, no frameworks, no network dependencies except an optional web-font `<link>` (always with a system-stack fallback so the file renders offline). It opens by double-click.

Start every file from `../assets/starter.html` (relative to this file): it carries the full token set from [tokens](tokens.md) as CSS custom properties, base component classes, and the state/direction switcher.

## Mockup content

- Use the brief's real content. When it is missing, write realistic, specific content in the product's voice (real-sounding names, plausible numbers, prices with cents, dates in the product's locale). Placeholder text hides hierarchy and length problems.
- Include the extremes from the brief: one long name that wraps or truncates, one large number, a list with many items, a missing avatar.
- Images: use inline SVG shapes, gradients, or simplified illustrations with intent; label any stand-in for a photo the user must supply ("Photo: team at work, warm light"). Never stretch or distort.
- Icons: inline from `../assets/icons/` and color via `.primary` / `.secondary` fills ([imagery](imagery.md)).

## Directions (grayscale sketches)

Explore layout and hierarchy before style. Build 2–3 genuinely different directions in one `directions.html`, switchable with `?direction=a|b|c`.

- Grayscale only: the starter switches to **sketch mode** (every ramp remapped to pure grey) automatically when `DIRECTIONS` is non-empty, or with `?sketch`. No brand color, no shadows beyond one level, one font.
- Directions differ in **structure**, not polish: layout (single column vs split vs sidebar), what leads (data vs action vs story), grouping, density, navigation pattern.
- Each direction gets a one-line caption in the switcher bar: its idea and its trade-off.
- Real content and the primary action present in every direction; spacing and type still come from the scales.
- Present the screenshots side by side, recommend one, and let the user pick or combine.

Done when the user has chosen a direction (or a combination) and that choice is recorded in the brief's decisions log.

## High fidelity

Build `design.html` from the chosen direction, layering in this order — each layer is checked before the next:

1. **Structure and hierarchy** in grayscale: layout, spacing, type sizes and weights, text ladder ([hierarchy](hierarchy.md), [layout-spacing](layout-spacing.md), [typography](typography.md)).
2. **Color**: palette ramps mapped to roles, primary color on the primary action and active states only ([color](color.md), [palettes](palettes.md)).
3. **Depth**: elevation by role, raised vs inset ([depth](depth.md)).
4. **Components** treated consistently with one radius set ([components](components.md)).
5. **Imagery and finishing touches**: icons, accent borders, decorated backgrounds, empty states ([imagery](imagery.md), [finishing-touches](finishing-touches.md)).
6. **States and responsive** behaviour.

Rules:
- Every value comes from `:root` tokens. Add a token before using a new value.
- Semantic HTML (`header`, `nav`, `main`, `section`, `button`, `label`, real `<table>` for tabular data); visual size is independent of heading level.
- Interactive affordances are real: `:hover`, `:focus-visible`, `:active`, `[aria-current]`, `:disabled` styles exist for every interactive element.
- Light behaviour is welcome when the brief asks for a clickable flow: tabs that switch, a modal that opens, a selected card. Keep it to small inline `<script>` blocks; the look is the deliverable.

## States

Render every in-scope state from the same file with `?state=default|empty|loading|error|…`. List the states in the starter's `STATES` array and mark blocks with `data-when="default"` (space-separated for blocks shared by several states); the switcher hides every block whose list excludes the current state and also sets `data-state` on `<body>` for finer CSS tweaks. Directions work the same way with `DIRECTIONS` and `data-direction="a"`. Append `&clean` to hide the switcher bar for screenshots. Empty states are designed, not blank ([finishing-touches](finishing-touches.md)).

## Responsive

- Design at the brief's viewports (default 400px and 1280px). Start at the smallest width when the product is used on phones.
- Use fixed widths and `max-width` for components with an optimal size; let only the content area flex.
- Adjust per breakpoint deliberately: headline ratios shrink, tables drop secondary columns, button groups stack full-width, side-by-side groups stack.

## Screenshot loop

Critique works from pixels, not source. After every meaningful change:

1. Find a headless-capable browser in the environment (a Chromium-family browser accepts `--headless --screenshot=<out.png> --window-size=<w>,<h> --hide-scrollbars file://<abs-path>?state=<s>`; a browser-automation library allows full-page captures). Use whatever is installed; ask the user only if nothing is.
2. Capture each in-scope state at each viewport: `screenshots/design-<state>-<width>.png` (directions: `screenshots/directions-<a|b|c>-<width>.png`). Use a tall window (e.g. 1280×2400, 400×2400) or a full-page capture so nothing below the fold is missed.
3. View every screenshot yourself before showing it. Run [critique](critique.md) against it; fix failures; re-capture.
4. Present to the user: the screenshots inline, the file path to open, and a short list of the decisions made and the trade-offs to react to.

If the user prefers a design tool that is available in the environment, build there with the same tokens, structure, states, and critique loop, exporting frames as screenshots for review.

## Checks

- The file opens offline by double-click and renders with fallback fonts.
- `:root` holds every value; component rules contain no raw hex or off-scale px values.
- Every in-scope state renders via `?state=` and has its own screenshot at every target viewport.
- No placeholder text appears; at least one extreme content case is present.
- Every interactive element has visible hover, focus-visible, and active styles.
- Previous iterations are preserved as `design-vN.html`.
