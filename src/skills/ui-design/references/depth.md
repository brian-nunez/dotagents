# Depth

How to make elements read as raised, inset, floating or layered: light direction, shadow elevation, two-part shadows, flat depth and overlap. Consult when styling buttons, inputs, cards, menus and modals, or when a screen looks flat or noisy.

The canonical 5-level two-part shadow scale lives in [tokens.md](tokens.md). This file explains when and why to use each level.

## Light comes from above

- Model one light source, above the screen and slightly in front. Users look slightly down at screens, so the top face of a raised element is barely visible and its bottom face is hidden.
- Decide the profile first (raised slab, recessed well), then apply only what light would do to that shape.
- Raised element: the top edge catches light, and the area just below it is shaded.
- Inset element: the lip above blocks light (shadow at the inner top), and the inner bottom edge faces up and catches light.

| Profile | Top edge | Bottom edge | Outside |
|---|---|---|---|
| Raised (button, select, card) | lighter highlight | hidden | small, sharp dark shadow below |
| Inset (well, input, checkbox, slider track) | inner dark shadow | lighter lip | none |

## Raised elements

- Add a 1px top highlight with an inset shadow (or a top border). Pick the highlight color by hand from the face's own ramp: same hue, two shades lighter (an `--action` face at 600 takes a 400 highlight).
- Use a hand-picked color, not semi-transparent white, for the highlight. White overlays wash the saturation out of the face color.
- Add a small dark shadow offset down only: `--shadow-1`, whose blur stays at a couple of pixels so the edge stays sharp (like the shadow under a window frame or wall outlet).

**Raised highlight** (named recipe):

```css
.btn-primary {
  background: var(--action);
  box-shadow:
    inset 0 1px 0 var(--primary-400),   /* top highlight: two shades lighter than the face */
    var(--shadow-1);                    /* short, sharp cast shadow */
}
```

- Before: flat blue "Create Account" button on a light grey page. After: same button, with the 1px lighter top line and `--shadow-1`. The change is subtle, but the button lifts.
- Pitfall: large blur on a button shadow. That makes it float like a dropdown and blurs its edge.

## Inset elements (wells, inputs, checkboxes)

- Add a light bottom lip: an outer shadow with positive y, no blur, white at low alpha (or a bottom border, or an inset shadow with negative y).
- Add a dark inner top shadow with a small positive y, so the lip above appears to block light. On light surfaces `--shadow-inset` alone does this.

**Inset well** (named recipe, dark panels):

```css
.well {
  background: var(--neutral-900);           /* darker than the surrounding --neutral-800 panel */
  box-shadow:
    inset 0 2px 2px hsla(0, 0%, 0%, .1),   /* lip above blocks light */
    0 2px 0 hsla(0, 0%, 100%, .15);         /* lit bottom edge */
}
```

- Apply the same pair to text inputs and checkboxes on dark panels. Then the controls on one panel read as recessed and the buttons read as raised.
- On light pages, make a well slightly darker than its surface and add a thin border: `--bg-subtle` fill, `1px solid var(--line)`, `--radius`, `--space-3` padding, optional `--shadow-inset`. Use a well to group a small block of data with its action when a white card would stand out too much.
- Mixed panel example: one dark filter sidebar holds inset controls (slider track, checkboxes) and raised controls (selects with a top highlight). The result card floats beside it with a shadow.

## Shadows as elevation

- Read a shadow as a position on the z-axis. Small offset and tight blur means just above the surface. A large offset and wide blur means close to the user.
- Elements that are closer get more attention, so give the largest shadows to the elements that must hold focus.
- Choose the z-position first, then take the matching level from [tokens.md](tokens.md). Do not tune shadows per component.
- Five levels is enough. To extend or rebuild a scale in the brief, define the smallest and the largest shadow first, then fill the middle with roughly linear steps (blur about 2-3x the y-offset).

| Level | Token | Use for |
|---|---|---|
| 1 | `--shadow-1` | buttons, chips, small raised controls |
| 2 | `--shadow-2` | cards, raised panels, featured tile, input-as-card |
| 3 | `--shadow-3` | dropdowns, menus, popovers, toasts |
| 4 | `--shadow-4` | dragged items, sticky overlays |
| 5 | `--shadow-5` | modals, dialogs |

- Button: level 1. It is noticed, but it does not dominate.
- Card: level 2. It lifts off the page without competing with overlays.
- Dropdown/user menu: level 3. With a border only, the menu blends into the page. With `--shadow-3` it floats.
- Modal: level 5. A modal with only a border or a faint shadow does not take focus. With `--shadow-5` it floats far above the dimmed page.
- Always use a vertical offset. A shadow with blur and spread but no y-offset looks like a glow, not light from above.

## Shadows with interaction

- Use shadow changes as feedback: moving up the z-axis means "picked up", and moving down means "pressed".
- Drag to sort: when the user grabs a row, raise it to level 4, make it white, make it slightly wider than the list, and show a drag handle. It pops above its neighbors, which shows that it can move.
- Pressed button: on `:active`, drop one level or remove the shadow, and darken the face slightly.

```css
.btn        { box-shadow: var(--shadow-1); transition: box-shadow .15s, transform .15s; }
.btn:active { box-shadow: none; transform: translateY(1px); }   /* one level lower */

.row.is-dragging {
  box-shadow: var(--shadow-4);
  transform: scale(1.02);
  position: relative; z-index: 10;
}
```

- Hover on clickable cards: go up one level. Keep hover and active on the same scale. Do not invent new values.

## Two-part shadows

- Combine two shadows, and give each one a job:
  - Direct light: larger and softer, with a clear y-offset and a large blur. This is the soft shadow cast behind the object.
  - Ambient occlusion: tighter and darker, with a small offset and a small blur. This is the contact shadow right under the object, where even ambient light cannot reach.
- The soft shadow can stay faint while the tight shadow keeps the edge crisp. One shadow cannot do both.
- As elevation rises, fade the ambient part. It is strong at level 1, nearly invisible at level 4, and gone at level 5.

```css
:root {
  --shadow-1: 0 1px 3px rgba(0,0,0,.12), 0 1px 2px rgba(0,0,0,.24);
  --shadow-2: 0 3px 6px rgba(0,0,0,.15), 0 2px 4px rgba(0,0,0,.12);
  --shadow-3: 0 10px 20px rgba(0,0,0,.15), 0 3px 6px rgba(0,0,0,.10);
  --shadow-4: 0 15px 25px rgba(0,0,0,.15), 0 5px 10px rgba(0,0,0,.05);
  --shadow-5: 0 20px 40px rgba(0,0,0,.2);
}
```

- At level 1 the tight shadow (.24) is darker than the soft shadow (.12). From level 2 up, the soft shadow is the stronger one.
- Keep alphas low: soft parts sit around .05–.15. In this system cards use `--shadow-2`.
- Before: a notification toast with only a soft shadow looks hazy at its edges. With only a tight shadow it looks pasted on. After: the combined shadow gives soft spread and a defined edge.

## Flat depth

- Without shadows, use lightness: lighter feels closer and darker feels further away, especially within one hue.
  - Raised: make the element lighter than its background (`--bg-surface` card on `--bg-page`).
  - Recessed: make it darker than its background (input fill slightly darker than its white card; a darker footer strip under a login card reads as behind it).
- Use solid shadows to keep a flat look: a short y-offset with zero blur.

**Flat solid offset** (named recipe):

```css
.cart-row { background: var(--bg-surface); box-shadow: 0 3px 0 var(--neutral-200); }
.btn-flat { background: var(--action); box-shadow: 0 3px 0 var(--primary-800); }  /* darker shade of the face */
```

- Example: flat social feed. Every panel is white on a light blue-grey page with no shadows, and the hierarchy of layers is still clear.

## Overlapping layers

- Overlap elements so the design has more than one plane. Use negative margins with `position: relative` so the overlapping element paints on top.
- Card across a boundary: push the card so it crosses from a hero into the next section.

```css
.hero        { padding-bottom: 96px; }
.search-card { position: relative; margin-bottom: -64px; z-index: 1; }
.next-section{ padding-top: 96px; }  /* reserve room for the overhang */
```

- Element taller than its parent: let the card overflow its band on both sides.

```css
.offer-band { padding: 48px 0; background: var(--primary-900); }
.offer-card { margin: -64px 0 -64px 0; position: relative; }
```

- Small components: let round carousel arrows hang half off the card edge (`margin-left: -24px;` / `margin-right: -24px;` on 48px buttons). Placing a card over an angled tinted shape behind it adds one more layer.
- Overlapping images: give each image an invisible border in the color of the surface behind it, so overlapping photos keep a gap and do not clash.

```css
.avatar--on-cover { margin-top: -48px; border: 4px solid var(--bg-surface); border-radius: var(--radius-full); }
.avatar-stack img { margin-left: -12px; border: 4px solid var(--bg-surface); } /* match card bg */
.avatar-stack img:first-child { margin-left: 0; }
```

- Before: a profile card where the avatar overlaps the cover photo and the follower avatars stack with no gap. The photos run into each other. After: each has a 4px border in the card color, and the layers read cleanly.
- Pitfall: an overhang with no padding reserved in the next section. The overlap then covers content. Add the overhang distance to the neighbor's padding.

## Restraint

- Borrow only the few cues that communicate depth: a highlight, a short shadow, lightness and overlap. Skip textures, glossy gradients and multi-light realism.
- Keep one light direction across the whole screen. All shadows offset down.
- Use one shadow scale. Every `box-shadow` in the file maps to a level or to a named recipe (raised highlight, inset well, flat solid offset).
- Spend elevation on purpose. If everything floats, nothing does. Most content sits at level 0–2 (buttons 1, cards 2). Only menus and overlays get 3–5.
- Prefer background contrast to borders for separating containers. Then add shadow only where elevation means something (see [finishing-touches.md](finishing-touches.md#fewer-borders)).

## Worked examples

1. **Primary button**: flat `hsl(224,76%,59%)` → `--action` face with the raised highlight: `inset 0 1px 0 var(--primary-400), var(--shadow-1)`. On `:active`, remove the outer shadow. It reads as a physical key.
2. **Upload well on a dark panel**: a flat darker rectangle → the inset well recipe (`inset 0 2px 2px hsla(0,0%,0%,.1)`, `0 2px 0 hsla(0,0%,100%,.15)`). Give the newsletter input and checkbox on the same panel the same pair. Everything interactive-inset now reads consistently.
3. **User menu dropdown**: white box with a 1px border, lost on a white page → remove the border and use `--shadow-3`. The menu floats above the header.
4. **Password modal**: faint border → `--shadow-5` over a faded page. Focus locks onto the dialog.
5. **Sortable playlist table**: the dragged row turns white, gets slightly wider than the table and gets `--shadow-4` plus a ⋮ handle. Its neighbors stay flat.
6. **Shopping cart, flat style**: bordered rows → white rows with the flat solid offset `box-shadow: 0 3px 0 var(--neutral-200)` on `--bg-page`. Depth with no blur.
7. **Travel search hero**: search card fully inside the hero → `margin-bottom: -64px` so it straddles the hero and the "Suggested trips" section. The page gains a front layer.
8. **Dashboard cards**: 1px borders on a white page → no borders, an off-white cool page (`--bg-page`) and `--shadow-2`. The cards pop out through contrast alone.

## Checks

- Every `box-shadow` value is a token from [tokens.md](tokens.md) (`--shadow-1`…`5`, `--shadow-inset`, `--shadow-image-edge`) or one of the three named recipes in this file (raised highlight, inset well, flat solid offset). Focus rings are outlines and underlines are `text-decoration` or background gradients, never box-shadows.
- Every outer shadow has a positive y-offset and no negative or horizontal offset.
- Raised controls (buttons, selects) have a top highlight or a small sharp shadow. Inputs, wells and checkboxes have an inset top shadow or a darker fill.
- Highlight colors are solid hand-picked colors, not `rgba(255,255,255,…)` overlays on colored faces.
- Shadow size grows with z-order: buttons (1) < cards (2) < dropdowns, menus, toasts (3) < dragged items (4) < modals (5).
- Two-part shadows have their tight part strongest at the lowest level, and it is absent at the top level.
- Pressed states (`:active`) use a smaller shadow than the rest state. Dragged items use a larger one.
- In flat designs, raised surfaces are lighter than their background, and recessed surfaces are darker.
- Every overlapping element has `position: relative` (or a z-index), and the neighbor reserves padding for the overhang.
- Overlapping images and avatars have a border that matches the color of the surface behind them.
- Fewer than a quarter of the visible containers carry a level-3+ shadow.
