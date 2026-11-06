# Imagery

Photos, text over images, icon sizing, screenshots, favicons, user-uploaded media, empty-state illustrations and the bundled two-tone icon set. Consult when a design uses any image or icon, or when a hero, a feature section or a media grid looks cheap or illegible.

## Use good photos

- Photo quality decides how premium a design feels. Identical UI with a dim, badly framed phone photo looks cheap. With a bright, well-lit, composed photo it looks high-end.
- Sources for the shipped product, in order: commissioned professional photos for specific needs, then high-quality licensed or free stock photography for generic needs.
- In mockups, use the user's own photos whenever they supply them (saved next to the HTML file and referenced by relative path, so the mockup still opens offline).
- Without supplied photos, use an intentional, labelled stand-in: an inline SVG illustration, a brand gradient, or a simplified drawing of the subject, captioned with what the real photo must show ("Photo: bright, composed living room, warm light"). Size and crop it exactly as the real photo will be, and test text-over-image treatments against its darkest and lightest areas. Never use grey placeholder boxes or hotlinked images ([html-mockups](html-mockups.md#mockup-content)).
- Pick photos whose palette sits near the brand hues, or colorize them (below).
- Pitfall: busy, high-dynamic-range photos (bright windows, white shirts next to dark walls) behind text. Choose calmer photos or reduce their dynamics.

## Text over images

- The problem is the image, not the text color. Photos have very light and very dark areas, so no single text color works everywhere. White text disappears on the bright areas and dark text disappears on the dark areas. Reduce the image's dynamics so contrast is consistent everywhere.

| Technique | Values | Use when |
|---|---|---|
| Dark overlay | `hsla(0, 0%, 0%, .55)` over the photo, white text | Fast, robust. Darkens the whole image. |
| Light overlay | `hsla(0, 0%, 100%, .6–.75)`, dark text | Light, airy brand. |
| Lower contrast + raise brightness | contrast −70%, brightness +40%, dark text | You want a pale, hazy photo behind dark text. |
| Colorize | lower contrast → desaturate → solid fill `--primary-900` with `multiply` | Tie the image to the brand hue. White text. |
| Text glow | `text-shadow: 0 0 50px hsla(0, 0%, 0%, .4)` | Keep more of the photo's dynamics. Combine with a milder contrast cut. |

```css
/* overlay */
.hero { position: relative; background: url(hero.jpg) center / cover; } /* user-supplied file, or a gradient stand-in */
.hero::before { content: ""; position: absolute; inset: 0; background: hsla(0, 0%, 0%, .55); }
.hero > * { position: relative; }

/* lower contrast + brightness (dark text on top) */
.hero-img { filter: contrast(30%) brightness(140%); }

/* colorize: flatten + desaturate the photo, then multiply a brand fill over it */
.hero-colorized { position: relative; isolation: isolate; }
.hero-colorized img { filter: grayscale(100%) contrast(70%); }
.hero-colorized::after { content: ""; position: absolute; inset: 0; background: var(--primary-900); mix-blend-mode: multiply; }

/* soft glow: zero offset, large blur */
.hero h1 { text-shadow: 0 0 50px hsla(0, 0%, 0%, .4); }
```

- A colorize fill that is darker than the CTA lets a same-hue brand button still pop on top.
- Keep the CTA button fully saturated and outside the overlay layer.
- Make the glow read as a halo with no visible offset. With an offset, it reads as a cheap drop shadow.
- Check contrast at the worst spot (the brightest pixel behind the white text). See [accessibility.md](accessibility.md).

## Intended size of icons

- Icons drawn for 16–24px look chunky and have too little detail at 3–4x. Use icons at their native size.
- To fill a larger slot (feature sections, empty states), enclose the native-size icon in a shape with a background color.

```css
.icon-badge {
  width: 48px; height: 48px; border-radius: var(--radius-full);
  display: grid; place-items: center;
  background: var(--primary-100);      /* pale tint */
}
.icon-badge svg { width: 24px; height: 24px; }
```

- Vary the tint per feature (pale green circle with a green icon, lavender with purple, peach with orange). This adds color without illustrations.
- When an icon really must be large (48px+ hero art), use or draw a version designed for that size: more detail, finer proportions, separate parts.
- Bitmaps: never display a raster logo or icon above its pixel size. Use SVG, or export at 2x.
- Before: a feature strip with dark glyphs scaled up to ~40px looks heavy next to the text. After: 24px glyphs in 48px pastel circles, tinted the same hue as their circles.

## Screenshots

- A full desktop screenshot shrunk by about 70% turns 16px UI text into about 4px mush. Use one of these instead:
  1. Capture a smaller viewport (tablet/mobile layout) and give it plenty of room. Let it bleed off the panel edge instead of shrinking it.
  2. Crop a specific area at full size, optionally in a circular "lens" mask that bleeds off the panel.
  3. Draw a simplified UI illustration: keep the chrome (header bar, sidebar, colored dots, buttons) and replace text with grey bars.

```css
.shot { width: 100%; max-width: 768px; border-radius: var(--radius-lg); box-shadow: var(--shadow-2); }
.shot-crop { width: 384px; height: 384px; border-radius: var(--radius-full); overflow: hidden; }
.shot-crop img { width: 900px; transform: translate(-220px, -140px); } /* intrinsic full scale, cropped */
.ui-line { height: 8px; border-radius: var(--radius-full); background: var(--neutral-100); }
```

- Screenshot text in a mockup should be at least 12px in the rendered result. Otherwise switch to option 2 or 3.

## Favicons and small marks

- A logo drawn at 128px turns to mush at 16px. Redraw a simplified version for the target size: fewer details, thicker strokes, larger shapes filling more of the square.
- Provide separate assets per size (16, 32, 180, 512). Do not let the browser downscale one master image.
- Example: an 8-spoke rounded asterisk app icon → a bolder 6-spoke version with thicker strokes for the favicon. It stays crisp and recognizable.

## User-uploaded content

- Control the shape and size. Put uploads in fixed-ratio containers and crop with `cover`. Intrinsic aspect ratios make card heights ragged and titles misaligned.

```css
.card-media { aspect-ratio: 16 / 9; overflow: hidden; background: var(--bg-subtle); }
.card-media img { width: 100%; height: 100%; object-fit: cover; object-position: center; }
/* or as a background image */
.card-media--bg { background: url(upload.jpg) center / cover no-repeat; }
```

- Prevent background bleed. A photo with a white background on a white UI loses its shape. Define the edge with an inner shadow or a semi-transparent inner border. Avoid a solid border.

| Option | Value | Effect |
|---|---|---|
| Avoid | `border: 2px solid hsl(212,12%,72%)` | Heavy grey ring that clashes with colorful photos |
| Inner shadow | `box-shadow: var(--shadow-inset)` | Defines the edge on light photos, nearly invisible on colorful ones, slight inset look |
| Inner hairline (default) | `var(--shadow-image-edge)` (`inset 0 0 0 1px rgba(0,0,0,.1)`) | Neutral 1px edge with no inset look |

- An inset `box-shadow` does not paint over an `<img>`. Put it on a wrapper with `::after`, or apply it to an element that uses the image as its background.

```css
.avatar { position: relative; width: 40px; height: 40px; border-radius: var(--radius-full); overflow: hidden; }
.avatar::after { content: ""; position: absolute; inset: 0; border-radius: inherit;
  box-shadow: var(--shadow-image-edge); }
```

- Give avatars and media a neutral tinted fallback fill and initials or a silhouette, so missing uploads still hold their shape.

## Illustrations for empty states

- Make the empty state a designed screen: an illustration or a large icon in a tinted circle, a one-line benefit message and an emphasized primary CTA.
- Use the brand hue for the illustration (light tint for the circle, darker shade for the figure), and use the same hue for the CTA.
- Large, very low-contrast line illustrations bleeding off one edge work as decoration behind a left-aligned heading and CTA.
- See [finishing-touches.md](finishing-touches.md#empty-states) for hiding supporting UI.

## Bundled two-tone icon set

- `assets/icons/` in the skill directory (`../assets/icons/` relative to this file) holds 200 SVG icons, `viewBox="0 0 24 24"`, named `icon-<name>.svg`. A license file sits next to them.
- Each icon has paths with class `primary` (the base shape, usually given the light tint) and `secondary` (the detail, usually given the dark shade). Color comes from CSS `fill`. The files have no fill attributes.
- 11 icons have only a `.secondary` path: add, at, attach, cheveron-down, cheveron-up, cheveron-selection, close, dots-horizontal, dots-vertical, menu, remove. Color that path as the main glyph (the label or icon color), not as a dark detail.
- To find an icon, list the directory and filter by keyword:

```bash
ls <skill-dir>/assets/icons | grep -i -E 'user|person'   # list assets/icons/ in the skill directory
```

- Use exact filenames. A few are spelled unusually: `cheveron-*`, `dupicate`, `sort-decending`.

### Inline and color

- Inline the SVG markup (copy the file contents) so CSS can reach `.primary` and `.secondary`. `<img src>` cannot be styled.

```html
<span class="icon icon--brand" aria-hidden="true">
  <svg viewBox="0 0 24 24"><path class="primary" d="…"/><path class="secondary" d="…"/></svg>
</span>
```

```css
.icon svg { width: 24px; height: 24px; display: block; }
/* brand pair: light tint + dark shade of one hue */
.icon--brand .primary   { fill: var(--primary-300); }
.icon--brand .secondary { fill: var(--primary-700); }
/* neutral UI pair */
.icon--grey .primary    { fill: var(--neutral-200); }
.icon--grey .secondary  { fill: var(--neutral-600); }
/* on dark surfaces: invert roles */
.icon--on-dark .primary   { fill: hsla(0, 0%, 100%, .3); }
.icon--on-dark .secondary { fill: #fff; }
```

- Take the pair from the active palette ramp (`300`/`700`, or `200`/`800` for stronger contrast). See [palettes.md](palettes.md).
- Status icons use the semantic ramps (`--success-*`, `--danger-*`, `--warning-*`, `--info-*`) with the same tint/shade logic.

### Sizing

- Native: 24px. Good at 16–24px. At 16px, prefer icons with simple silhouettes.
- For 32–64px slots, enclose a 24px icon in a tinted circle or rounded square (`48px`, `--radius-full` or `--radius`) rather than scaling it up.
- Align inline icons to the text's first line, with an 8px gap (`--space-2`) for 16–24px icons and 4px (`--space-1`) for small icons inline with small text.

### Available names (by category)

| Category | Icons |
|---|---|
| Actions / editing | add, add-circle, add-square, remove, remove-circle, remove-square, close, close-circle, close-square, check, edit, trash, dupicate, refresh, search, zoom-in, zoom-out, print, send, attach, link, external-window, launch, text-cursor, tune, cog |
| Arrows / chevrons / ordering | arrow-thick-{up,down,left,right}-circle, arrow-thin-{up,down,left,right}-circle, cheveron-up, cheveron-down, cheveron-up-circle, cheveron-down-circle, cheveron-left-circle, cheveron-right-circle, cheveron-selection, arrows-merge, arrows-split, order-horizontal, order-vertical, sort-ascending, sort-decending, dots-horizontal, dots-vertical, menu |
| Status / feedback | information, help, important, notification, notification-off, announcement, flag, star, heart, thumbs-up, thumbs-down, mood-happy, mood-neutral, mood-sad, trophy, certificate, target, click-target, bolt |
| Security / access | lock, lock-open, key, security, security-check, security-important, identification, view-visible, view-hidden, door-enter, door-exit |
| People | user, user-add, user-remove, user-check, user-circle, user-couple, user-group, chat, chat-group, chat-group-alt |
| Communication | mail, inbox-check, inbox-download, inbox-upload, inbox-full, at, phone-incoming-call, phone-outgoing-call, phone-ring, microphone, translate |
| Files / content | document, document-add, document-remove, document-notes, folder, folder-add, folder-remove, archive, collection, book-open, book-closed, library, news, survey, photo, film, layers, code |
| Commerce / money | shopping-bag, shopping-basket, shopping-cart, store, money, wallet, credit-card, currency-dollar, currency-euro, receipt, discount, tag, ticket, package, box, deliver, calculator |
| Data / dashboards | chart, pie-chart, trending-up, trending-down, dashboard, presentation, presentation-play, scale, widget-add, application, interface, puzzle, history |
| Time / calendar | calendar, calendar-add, calendar-remove, calendar-date, time, hour-glass |
| Media / playback | play, pause, stop, fast-forward, fast-rewind, volume-up, volume-down, volume-mute, headphones, videocam, camera |
| Devices / tech | desktop, monitor, device-smartphone, device-tablet, server, hard-drive, cloud-upload, cloud-download, clouds, wifi, wifi-off, battery-full, battery-half, bug |
| Places / travel | home, office, factory, globe, map, location-pin, pin, compass, airplane, sign, umbrella, buoy |
| Misc objects | asterisk, brick, light, paint, swatch, thermostat-full, thermostat-half, work |

## Worked examples

1. **Rental listing card**: a dim phone photo of a bed with a door edge in frame → a bright, composed, professionally lit room photo. The UI is untouched, and the card's perceived quality jumps. In a mockup without supplied photos, a labelled illustration stand-in at the same crop keeps the card honest until the real photo arrives.
2. **Meeting-room SaaS hero**: a white headline lost over a bright window → `hsla(0,0%,0%,.55)` overlay. Alternatively, contrast −70%/brightness +40% with a dark navy headline, colorize with a `--primary-900` multiply fill, or keep the photo and add `text-shadow: 0 0 50px hsla(0,0%,0%,.4)`.
3. **Finance features strip**: dark glyphs scaled to fill the space → 24px two-tone icons in 48px pastel circles, each with its own hue (green scale, purple trend-up, orange user-group).
4. **To-do app features section**: a full desktop screenshot shrunk until unreadable → a tablet-layout screenshot shown large and cropped at the panel edge, or a circular full-scale crop of the task list, or a simplified drawing with grey text bars.
5. **App favicon**: a detailed 8-spoke gradient asterisk shrunk to 16px → a redrawn bolder 6-spoke mark at 16px.
6. **Recipe grid**: uploads at native ratios produce ragged cards → `aspect-ratio: 16/9` containers with `object-fit: cover`. The titles and ratings line up across rows.
7. **Chat contact list**: a white-background avatar dissolves into the white list → `--shadow-image-edge` hairline. A grey 2px border would clash with colorful photos.

## Checks

- Every photo slot shows a user-supplied image or an intentional, labelled stand-in (illustration, gradient, simplified drawing) at the final crop; no grey placeholder boxes appear.
- Text over a photo uses an overlay, reduced contrast, a colorize fill or a 0-offset glow, and passes contrast at its worst spot.
- Every icon renders at 16–24px, or sits inside a tinted shape when the slot is larger.
- No raster image displays above its intrinsic pixel size.
- Screenshot text renders at 12px or larger, or the screenshot is cropped or simplified.
- Every image loads from inline SVG/CSS or a local relative path; the mockup renders offline with no hotlinked images.
- Every user-uploaded image sits in a fixed-ratio container with `object-fit: cover` or `background-size: cover`.
- Avatars and thumbnails on matching backgrounds have an inner shadow or a 10%-black inner hairline, not a solid grey border.
- Bundled icons are inlined SVG, with `.primary` and `.secondary` fills from one hue (tint and shade) or the grey pair.
- Icon filenames referenced in the HTML exist in the skill's `assets/icons/` (exact spelling).
- Empty states show an illustration or an enclosed icon plus a single emphasized CTA.
