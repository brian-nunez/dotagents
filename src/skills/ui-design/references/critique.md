# Critique

The self-review procedure run on screenshots before anything is shown to the user, and again after every revision. It orders the review into passes; each pass applies the **Checks** list at the end of the reference files it names, which stay the single source of truth for each rule.

## How to critique

- Work from **screenshots**, not source. Capture per [html-mockups](html-mockups.md#screenshot-loop), view every image, and judge what is visible. Open the source only to confirm values (tokens, contrast pairs) or to fix.
- Review as a skeptic: assume something is wrong and hunt for it. A design that "looks fine" has usually not been looked at closely.
- Run every pass in order; earlier passes (hierarchy, spacing) dominate the result, so fixing them often resolves later failures.
- Record each check as ✅ pass or ❌ fail with evidence (where, what value). Fix every ❌ within scope, re-capture, and re-run the affected passes.

## Pass 0 — the squint tests

Run these first; they catch the problems that matter most.

| Test | How | Pass when |
|---|---|---|
| Blur | Screenshot with `?filter=blur` | The primary element and primary action are still the most prominent blobs; groups read as distinct masses. |
| Grayscale | Screenshot with `?filter=gray` | Hierarchy is unchanged without color; nothing important relied on hue alone. |
| Five-second | Look at the default screenshot for five seconds, then describe it | You can state what the page is, what matters most, and what to do next — matching the brief. |
| Real-content | Read every string | No placeholder text; extremes (long name, big number, empty list) render without breaking the layout. |
| Consistency | Compare same-role elements across the page | Every button, card, input, badge and heading of the same role looks identical. |

## Passes

1. **Hierarchy and personality** — Checks in [hierarchy](hierarchy.md), [personality](personality.md).
2. **Layout and spacing** — Checks in [layout-spacing](layout-spacing.md), [tokens](tokens.md).
3. **Typography** — Checks in [typography](typography.md), [font-pairings](font-pairings.md).
4. **Color** — Checks in [color](color.md), [palettes](palettes.md).
5. **Depth** — Checks in [depth](depth.md).
6. **Components** — Checks in [components](components.md).
7. **Imagery and finishing touches** — Checks in [imagery](imagery.md), [finishing-touches](finishing-touches.md).
8. **UX and content** — Checks in [ux-patterns](ux-patterns.md), plus: every brief requirement (primary action, states, content hierarchy) is visible.
9. **Accessibility** — Checks in [accessibility](accessibility.md); measure contrast with its snippet rather than estimating.
10. **Build hygiene** — Checks in [html-mockups](html-mockups.md).

Skip a check only when it cannot apply (no tables → table checks are n/a) and mark it n/a.

## Report format

Keep the full pass/fail log for yourself; show the user only what helps them react:

```
**Critique — <file> (<states> × <viewports>)**
Fixed this round: <n> issues — e.g. "secondary text on the blue band was grey → hue-matched tint (6.1:1)".
Open trade-offs for you:
- <decision with options and your recommendation>
Known limits: <anything not verifiable, e.g. font license, real photography pending>
```

## Completion criterion

Critique is done when **every check in every pass is ✅ or n/a on the latest screenshots of every in-scope state at every target viewport**, and any check left ❌ by an explicit user decision is listed under "Open trade-offs". A revision of any kind restarts critique for the affected passes.
