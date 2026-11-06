# Discovery interview

How to interview the user until the design is fully understood, plus the question bank that defines "fully". Consult it for the whole of step 1 and whenever feedback reopens a settled decision.

## The method

Treat the design as a **design tree**: every decision branches into decisions that depend on it (the audience decides the personality; the personality decides type, color, and radius; the primary task decides the layout). The interview walks the whole tree.

- **Rounds.** Ask in rounds, then stop and wait for answers. Never design between rounds.
- **Frontier.** Each round draws from the questions whose prerequisites are already settled — the *frontier*. A question whose answer depends on another open question waits for a later round. When the frontier holds more than ~8 questions, ask the ~8 that unblock the most downstream decisions; the rest stay on the frontier for the next round.
- **Recommend.** Every question carries your recommended answer, grounded in what you know so far, so the user can reply "yes" to most of a round. Recommendations make the interview fast; the decisions stay the user's.
- **Facts are yours.** Anything you can look up — existing code, brand assets, a URL the user gave, files in the project, the current page's markup — look it up yourself and report it in the round's *Found* line. Leave secret stores (`.env` files, credentials, keys) unread. Ask the user only for decisions and for knowledge that lives in their head.
- **Concrete over abstract.** Offer 2–4 concrete options instead of open questions ("Which feels closer: A calm and clinical, B warm and friendly, C bold and loud?"). When personality is hard to verbalise, ask for sites they like and what they like about them.
- **Dig.** Each answer tends to open new branches. Follow them: a "dashboard for ops teams" raises density, data freshness, alert states, and screen size; a "landing page" raises the single conversion goal, proof, and the visitor's starting doubt.
- **Scale to the request.** A tweak ("restyle this card") may settle in one round of 3–5 questions; a new product surface usually needs 3–6 rounds. The bar is the same: every branch below is settled or explicitly defaulted.

## Round format

```
**Round N** — <what this round settles>

🔎 **Found:** <facts gathered from the environment since the last round, or "nothing new">

❓ **Q1 · <short title>** — <the question, with options A/B/C when useful>
➡️ Recommended: <your answer and the one-line reason>

❓ **Q2 · <short title>** — …
➡️ Recommended: …

Reply with numbers ("1 yes, 2 B, 3: …"), or "go with your recommendations".
```

Keep each round to 4–8 frontier questions (fewer when the whole request is small). Number questions continuously across rounds (Q1…Q30) so answers stay unambiguous.

## Completion criterion

Discovery is done when **every branch in the question bank is answered by the user, found in the environment, explicitly defaulted with the user's agreement, or marked n/a with a reason** (n/a = the branch cannot apply to this kind of design, e.g. drag interactions on a static pricing page). "I think I get it" is not done. When in doubt, ask one more round. The brief built from it is confirmed in the next step ([brief-template](brief-template.md)).

Whenever the remaining open branches fit in one round, add a **Defaults** block to that round listing the default you will apply to each still-open or deferred branch (from the table below), so the user can veto them in the same reply.

## Question bank

Cover every branch. Skip a question only when its answer is already known; record it as known.

### 1. Purpose and success
- What is being designed: a page, a screen, a flow, a component, a redesign of something existing?
- What should the user *do* there? Name the one primary action the screen exists for.
- How will we know the design works (signups, task completion time, fewer support tickets, "feels premium")?
- What prompted this now — a problem with an existing design, a new feature, a launch?

### 2. People
- Who uses it? Role, expertise, frequency (daily power user vs first-time visitor).
- What do they know, want, and worry about when they arrive? What is their starting doubt?
- Under what conditions: desk, phone on the go, wall display, glancing between tasks?
- Any accessibility needs beyond the baseline (older users, low vision, keyboard-only, color-blind-heavy audience)?

### 3. Content and data
- What content appears? Ask for real examples — real names, numbers, copy, images. Design with real content.
- Who supplies imagery (photos, illustrations, logos), and is it available now?
- What are the extremes: longest name, largest number, most items (0, 1, 5, 2000), missing values?
- Which information matters most, second, third? (This is the hierarchy.)
- What is user-generated vs controlled? Are there photos, avatars, logos, charts, code samples?
- Who writes the copy? May the design rewrite labels and microcopy?

### 4. Functionality and UX
- Walk the main task step by step. What happens on success, on error, on cancel?
- Which states must be designed: empty, loading, error, partial, success, first-use, permission-denied?
- Secondary and tertiary actions? Any destructive actions and how severe?
- Navigation context: where does the user come from and go next? Is the surrounding app shell given or part of the design?
- Interactions that matter to feel: hover, drag, inline editing, filters, search, multi-select?

### 5. Personality and brand
- Which three adjectives should the design feel like? Offer pairs: calm/energetic, serious/playful, premium/accessible, technical/human.
- Existing brand: logo, colors, fonts, voice? Must they be used exactly, or are they a starting point?
- Sites or apps the user admires (any industry), and what specifically they like in each.
- Sites the audience already uses (sets expectations). Direct competitors to look *different* from.
- Copy tone: formal, neutral, friendly, playful?

### 6. Visual direction (ask after personality is settled)
- Type: serif / neutral sans / rounded / geometric? One family or a pairing? Licensing constraints (free only)?
- Color: a bundled palette, a brand palette, or build one? Light or dark surfaces? Warm or cool greys?
- Corner radius set: sharp, subtle, soft, or round?
- Density: airy and spacious, or compact and information-dense?
- Depth style: flat, subtle shadows, or pronounced layering?
- Imagery: photography, illustration, icons only, none? Who supplies it?

### 7. Platform and constraints
- Target viewports: mobile-first, desktop-first, both? Smallest and largest screens to design for.
- Must it fit an existing design system or component library? Any fixed components (header, nav)?
- Technical constraints that affect the look (email client, embedded widget, print, kiosk)?
- Accessibility target: WCAG AA (default) or AAA?

### 8. Deliverable
- Output: HTML mockup (default) or a design tool the user names, if one is available in the environment?
- Fidelity goal: look and feel only, clickable flow, or both?
- Which screens and states, at which viewports, are in scope for this pass?
- Should layout directions be explored first (default: 2–3 grayscale directions), or go straight to one design?
- Where should files go (default `designs/<page-slug>/` in the current project)?

## Defaults when the user defers

| Branch | Default |
|---|---|
| Personality | neutral, professional, friendly copy |
| Type | one neutral sans with ≥ 5 weights (free), system stack fallback |
| Color | a bundled palette matching the personality; cool tinted greys |
| Radius | subtle set |
| Density | comfortable (spacious for marketing, compact only for data-heavy tools) |
| Depth | subtle two-part shadows |
| Viewports | 400px and 1280px |
| Accessibility | WCAG AA |
| States | default + empty + error for every data view |
| Deliverable | self-contained HTML in `designs/<page-slug>/` |

State every applied default in the brief.

## Checks

- Every question-bank branch is answered, found, or explicitly defaulted in the brief.
- The brief names exactly one primary action per screen.
- The brief contains real (or realistic, user-approved) sample content including at least one extreme case.
- Personality is stated as concrete levers (type, headline weight, color mood, radius, density, depth, tone), not only adjectives.
- Every n/a branch carries a reason that holds for this kind of design.
