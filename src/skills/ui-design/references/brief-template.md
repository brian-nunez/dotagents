# Design brief template

The document that closes discovery and anchors every later step. Write it to `designs/<page-slug>/brief.md`, show it to the user, and get explicit confirmation before sketching. Update it whenever feedback changes a decision, so it always reflects the current design.

```markdown
# <Page / screen name> — design brief

Status: draft | confirmed <YYYY-MM-DD>

## Goal
- What: <page, screen, flow, component; new or redesign>
- Prompted by: <problem, feature, launch>
- Primary action: <the one thing the user should do>
- Success looks like: <measurable or felt outcome>

## People
- Who: <role, expertise, frequency>
- Context: <device, environment, mindset, starting doubt>
- Sites they already use: <sets expectations>
- Accessibility: <target (AA default) + specific needs>

## Content
- Hierarchy: 1. <most important> 2. <…> 3. <…>
- Real sample content: <names, numbers, copy, images — or where it lives>
- Extremes: <long names, 0 / 1 / many items, missing values>
- Imagery supplied by: <user | stand-ins labelled for later | none needed>
- Copy ownership: <may the design rewrite labels and microcopy?>

## UX
- Main flow: <steps, success, error, cancel>
- Actions: primary <…> · secondary <…> · tertiary <…> · destructive <… + confirmation | n/a>
- Interactions that matter: <toggles, tabs, hover, drag, inline edit | n/a>
- States in scope: <default, empty, loading, error, … — each with a one-line description>
- Context: <where the user comes from / goes next; shell given or designed>

## Personality
- Adjectives: <three>
- Levers:
  - Type: <families and roles; headline weight; mono face if code appears>
  - Color: <palette (bundled number or brand), mood, grey temperature, light/dark surfaces>
  - Radius set: <sharp | subtle | soft | round>
  - Density: <compact | comfortable | airy>
  - Depth: <flat | subtle | layered>
  - Imagery style: <photo | illustration | icons | none>
  - Copy tone: <formal | neutral | friendly | playful> + one sample line
- Admired references: <site — what to borrow>
- Differentiate from: <competitors — levers that must differ>

## Constraints
- Viewports: <smallest and largest, e.g. 400px and 1280px>
- Fixed elements / existing system: <…>
- Technical: <…>

## Deliverable
- Medium: <HTML (default) | a design tool the user named>
- Fidelity: <look & feel | clickable flow | both>
- Directions first: <yes, N directions | no>
- Files: designs/<page-slug>/

## Defaults applied
- <branch>: <default> (user agreed)

## Not applicable
- <branch>: <reason>

## Decisions log
- <YYYY-MM-DD> — <decision made or changed and why>
```

## Checks

- Every section is filled, or the branch is listed under "Not applicable" with a reason.
- Personality is expressed as levers with concrete values, including headline weight and a sample copy line.
- "Defaults applied" lists every branch the user deferred.
- `Status` reads `confirmed <date>` before sketches begin.
