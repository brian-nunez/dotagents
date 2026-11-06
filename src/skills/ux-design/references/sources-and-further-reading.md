# Sources and further reading

Consult this for provenance, a worked example, optional source assets, or a primary reference for a specific UX/accessibility question. The other references contain original distilled guidance; this skill does not depend on access to the purchased package.

## Refactoring UI package

The reviewed local package is `/home/brian/Downloads/RefactoringUI`. Treat it as an optional source, not a required installed dependency. If it is absent, continue with the skill's references. If an exact example is needed, read the relevant source using the appropriate document or media workflow.

### Book: Refactoring UI v1.0.2.pdf

| Topic and printed/PDF pages | Skill reference |
| --- | --- |
| Feature-first design, iteration, personality, constrained choices: 7-28 | discovery-interview.md, visual-direction.md, tools-and-prototypes.md |
| Hierarchy, labels, weight/contrast, action priority: 30-54 | hierarchy-and-layout.md, typography-and-content.md, forms-and-actions.md |
| Space, sizing, content widths, grids, independent scaling: 56-86 | hierarchy-and-layout.md, responsive-design.md |
| Type roles/scales, fonts, measure, alignment, leading, links: 88-117 | typography-and-content.md |
| Palettes, shade families, hue/lightness, neutrals, contrast: 119-148 | color-and-surfaces.md, accessibility.md |
| Light, elevation, two-part shadows, flat depth, overlap: 150-172 | color-and-surfaces.md |
| Photos, overlays, intended sizes, uploads: 174-190 | imagery-and-icons.md |
| Existing-element character, accents, backgrounds, empty states, separators, alternative components: 192-214 | visual-direction.md, information-and-flows.md, hierarchy-and-layout.md |
| Study unexpected decisions and reconstruct interfaces to develop judgment: 216-218 | visual-direction.md, design-review.md |

### Worked videos

- **Designing Content v1.0.1.mp4:** reading width and leading, 01:11-03:02; proximity, 04:34-05:32; quotation and attribution, 06:05-07:32; font substitution and retuning, 07:34-08:52; signup emphasis, 08:52-09:57; responsive composition, 11:02-11:41.
- **Designing a Complex Form.mp4:** grouping and appropriate input widths, 01:15-02:44; action hierarchy, 03:52-05:13; selection cards, 05:13-06:27; payment-method ownership, 06:27-07:47; whole-form action scope, 08:23-09:17; mobile price comparison, 10:06-10:35.
- **Designing a Dashboard.mp4:** moving emphasis to overview values, 00:20-03:40; meaningful invoice groups and restrained status badges, 05:40-07:55; table scanning and consolidation, 08:20-10:40; mobile information priorities, 14:15-16:50.

Video review used full automatic transcripts and visual samples throughout the timelines, with additional detail inspection for key findings. Treat timestamps as navigation aids, not guarantees of frame-exact boundaries or flawless transcription.

### Supporting assets

- **Component Gallery v1.1.0.pdf / .sketch:** 86 exported pages/artboards of alternative components and compositions. The Sketch contains no reusable symbols. Use it for reference and editing ideas, not as a production behavior system.
- **Font Recommendations v1.0.1.pdf:** 69 pages comparing fonts in headline, article, and application contexts. Verify availability and terms independently before obtaining or using a font; this reference does not redistribute font files.
- **Color Palettes v1.1.0.pdf / .sketch:** 152 pages/artboards with 24 palettes and a swatch appendix. **Color Palettes JSON v1.1.0.zip** includes those 24 palette files and a 300-entry master swatch dictionary. Import caveats belong in [color-and-surfaces.md](color-and-surfaces.md).
- **Icons v1.0.2.zip:** 200 exported 24px SVGs, a Sketch source, demo, CSS examples, README, and supplied license. Apply the license's conditions when using assets; the skill bundles none of them. Use [imagery-and-icons.md](imagery-and-icons.md) for optical and semantic decisions.

## Corrections and interpretation

- The book's page 142 approximately-18px large-text boundary is inaccurate. Use the verified thresholds in [accessibility.md](accessibility.md).
- The dashboard's final mobile table uses yellow/red dots without textual status distinctions around 16:40. Preserve redundant meaning rather than copying that treatment.
- Recommendations to customize browser controls, tint neutrals, or associate particular typefaces with trust are contextual choices, not universal requirements.
- "Labels are a last resort" concerns redundant display labels, explicitly not removing accessible form labels. Keep labels that support comparison or scanning.
- "Grids are overrated" argues for content-appropriate sizing; it does not prohibit grids. "Use fewer borders" still permits separators that explain grouping or action scope.
- The worked examples' assumptions about user priorities are hypotheses. Attractive before/after results do not establish task success or production accessibility.

## Primary sources beyond the package

Consult only what the current decision needs; these links are not an assignment to load full manuals for every design.

- [GOV.UK: Learning about users and their needs](https://www.gov.uk/service-manual/user-research/start-by-learning-user-needs): distinguish user outcomes from interface mechanisms; separate evidence from stakeholder assumptions; revisit needs as evidence changes.
- [W3C: WCAG 2.2 quick reference](https://www.w3.org/WAI/WCAG22/quickref/): verify applicable accessibility criteria and their exceptions. A short design checklist is not a complete conformance assessment.
- [W3C: Understanding Contrast (Minimum)](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html): text contrast, large-text definition, and threshold interpretation.
- [W3C: Understanding Use of Color](https://www.w3.org/WAI/WCAG22/Understanding/use-of-color.html): preserve meaning beyond hue alone.
- [W3C WAI: Forms Tutorial](https://www.w3.org/WAI/tutorials/forms/): labeling, grouping, instructions, validation, and feedback.
- [W3C WAI: ARIA Authoring Practices, Read Me First](https://www.w3.org/WAI/ARIA/apg/practices/read-me-first/): semantic roles require corresponding behavior; custom patterns need appropriate interoperability testing.

External pages can change. Reopen the primary guidance when an exact requirement, exception, or unfamiliar interaction determines a consequential design decision. Preserve the distinction between normative requirements, informative guidance, and this skill's design heuristics.
