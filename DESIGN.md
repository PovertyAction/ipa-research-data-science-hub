---
name: IPA Knowledge Hub
description: Research, data science, and MEL guidance for IPA staff, in a calm
  library voice with precise working detail.
colors:
  ipa-green: "#49ac57"
  canopy-green: "#155240"
  field-green: "#35874e"
  meadow-green: "#3f9953"
  institutional-navy: "#2b4085"
  signal-orange: "#f26529"
  ember-orange: "#c23f18"
  ember-orange-deep: "#942e11"
  rust-orange: "#c8420a"
  oxblood: "#730000"
  brick: "#a53718"
  mist-teal: "#ceecee"
  periwinkle: "#a0a9ea"
  apricot: "#fc9757"
  lavender: "#be9ffa"
  charcoal-ink: "#414042"
  graphite: "#545555"
  slate-muted: "#6a737b"
  pewter: "#5b5b5e"
  stone: "#c9c9c8"
  rule-grey: "#dee2e6"
  paper-grey: "#f1f2f2"
  paper-white: "#ffffff"
  reading-room-black: "#151515"
  ash-white: "#f8f8f8"
typography:
  display:
    fontFamily: "Gelasio, Georgia, serif"
    fontSize: "clamp(1.9rem, 1.2rem + 3vw, 2.5rem)"
    fontWeight: 700
    lineHeight: 1.2
  headline:
    fontFamily: "Gelasio, Georgia, serif"
    fontSize: "34px"
    fontWeight: 700
    lineHeight: 1.2
  title:
    fontFamily: "Gelasio, Georgia, serif"
    fontSize: "28px"
    fontWeight: 700
    lineHeight: 1.2
  subtitle:
    fontFamily: "Gelasio, Georgia, serif"
    fontSize: "24.65px"
    fontWeight: 600
    lineHeight: 1.2
  body:
    fontFamily: "Arimo, Arial, sans-serif"
    fontSize: "18.7px"
    fontWeight: 400
    lineHeight: 1.5
  nav:
    fontFamily: "Arimo, Arial, sans-serif"
    fontSize: "16.36px"
    fontWeight: 700
    lineHeight: 1.5
  caption:
    fontFamily: "Arimo, Arial, sans-serif"
    fontSize: "15.3px"
    fontWeight: 400
    lineHeight: 1.5
  label:
    fontFamily: "Arimo, Arial, sans-serif"
    fontSize: "0.72rem"
    fontWeight: 700
    lineHeight: 1
    letterSpacing: "0.06em"
  code:
    fontFamily: "Fira Code, monospace"
    fontSize: "16.36px"
    fontWeight: 400
    lineHeight: 1.5
rounded:
  sm: "0.25rem"
  md: "0.5rem"
  lg: "0.75rem"
  pill: "999px"
spacing:
  block-inline-sm: "30px"
  block-inline-md: "50px"
  container-max: "1100px"
  sidebar: "250px"
  body: "900px"
  margin: "300px"
components:
  button-hero:
    backgroundColor: "{colors.paper-white}"
    textColor: "{colors.canopy-green}"
    typography: "{typography.nav}"
    rounded: "{rounded.pill}"
    padding: "8.5px 17px"
  button-hero-hover:
    backgroundColor: "{colors.mist-teal}"
    textColor: "{colors.canopy-green}"
  button-action:
    backgroundColor: "{colors.ember-orange}"
    textColor: "{colors.paper-white}"
    rounded: "{rounded.pill}"
    padding: "8.5px 17px"
  button-action-hover:
    backgroundColor: "{colors.ember-orange-deep}"
    textColor: "{colors.paper-white}"
  badge-diataxis:
    typography: "{typography.label}"
    rounded: "{rounded.pill}"
    padding: "0.35em 0.75em"
  badge-tutorial:
    textColor: "{colors.canopy-green}"
  badge-how-to:
    textColor: "{colors.brick}"
  badge-reference:
    textColor: "{colors.institutional-navy}"
  badge-explanation:
    textColor: "{colors.pewter}"
  callout:
    rounded: "{rounded.md}"
  cookie-notice:
    backgroundColor: "{colors.canopy-green}"
    textColor: "{colors.paper-white}"
    rounded: "{rounded.lg}"
    padding: "0.75rem 0.75rem 0.75rem 1.1rem"
  cookie-notice-button:
    backgroundColor: "{colors.paper-white}"
    textColor: "{colors.canopy-green}"
    rounded: "{rounded.pill}"
    padding: "0.35rem 1rem"
---

# Design System: IPA Knowledge Hub

## Overview

**Creative North Star: "The Research Library"**

The Hub reads like a well-run research library: quiet rooms, clear shelving, and
labels that tell you exactly where you are. Serif headings give each page the
authority of a published protocol; a plain sans-serif body and generous line
height keep long technical guidance easy to read for staff who use English as a
second language. The mood is precise, technical, and efficient. Nothing on the
page is decorative for its own sake; every color, border, and badge tells the
reader something (what kind of page this is, what kind of note this is, what the
main action is).

Density follows the Quarto docs layout: a section sidebar on the left, a single
reading column in the middle, and a table of contents with authorship metadata
in the right margin. Brand color is concentrated in a few confident places: the
homepage hero band, the action buttons, the page-type badge, and the cookie
notice. Everything else sits on paper white (light) or reading-room black
(dark), and both themes are first-class.

**Key Characteristics:**

- Serif headings (Gelasio bold), sans-serif body (Arimo), monospace only for
  code (Fira Code); all three self-hosted.
- Color marks meaning: Diátaxis page type, callout kind, primary action, brand
  moment.
- Soft-edged, confident components: pill buttons and badges, hairline-bordered
  callouts with a faint tint.
- Flat pages; shadows only on layers that float above the page.
- Light and dark themes share one token vocabulary (`--brand-*`, `--hub-*`).

## Colors

A restrained institutional palette: deep IPA greens and navy carry the brand,
warm oranges mark action and caution, and neutral greys do the structural work.

All palette colors are defined once in `assets/design-styles/light-brand.yml`
and `dark-brand.yml`; Quarto exposes them as `var(--brand-<name>)` (for example
`--brand-dark-green` for Canopy Green). Theme-dependent values are
`--hub-focus-color`, `--hub-rule-color`, and `--hub-secondary-text`, set in
`light-theme.scss` and `dark-theme.scss`.

### Primary

- **IPA Field Green** (`ipa-green`): the brand green. Tip callouts and Tutorial
  badges in dark mode, the tool-tab selection border, and the green in the logo.
  Too light for text on white (about 2.9:1), so in light mode it never carries
  text.
- **Canopy Green** (`canopy-green`): the deep brand green and the Hub's
  signature surface. Hero band (gradient to Meadow Green), cookie notice
  background, hero button text, Tutorial badge in light mode.
- **Meadow Green** (`meadow-green`): only the light end of the light-mode hero
  gradient, chosen instead of IPA Field Green so white headings keep 3:1.
- **Field Green** (`field-green`): Tip callout color in light mode.

### Secondary

- **Institutional Navy** (`institutional-navy`): body links and the focus ring
  in light mode, Note callouts, Reference badges.
- **Periwinkle** (`periwinkle`): Navy's dark-mode counterpart for Note callouts
  and Reference badges.

### Tertiary

- **Signal Orange** (`signal-orange`): links and the focus ring in dark mode;
  Important callouts in dark mode.
- **Ember Orange** (`ember-orange`) and **Ember Orange Deep**
  (`ember-orange-deep`): the homepage action buttons and their hover. Ember is
  Signal Orange darkened until white text reaches 5.2:1.
- **Rust Orange** (`rust-orange`): Warning and Caution callouts in light mode.
- **Apricot** (`apricot`): Warning and Caution callouts and How-to badges in
  dark mode.
- **Oxblood** (`oxblood`): Important callouts in light mode.
- **Brick** (`brick`): How-to badge in light mode (contrast-tuned, not a palette
  color).
- **Lavender** (`lavender`): inline code in dark mode.

### Neutral

- **Paper White** (`paper-white`) and **Reading-Room Black**
  (`reading-room-black`): page backgrounds, light and dark.
- **Charcoal Ink** (`charcoal-ink`) and **Ash White** (`ash-white`): body text,
  light and dark.
- **Graphite** (`graphite`): homepage secondary paragraphs (light);
  `--hub-secondary-text`.
- **Slate Muted** (`slate-muted`): muted text and figure captions (light; a
  lightened variant in dark mode).
- **Pewter** (`pewter`): Explanation badge in light mode.
- **Stone** (`stone`): hairline borders on illustrations and tool tabs;
  Explanation badge in dark mode.
- **Rule Grey** (`rule-grey`): dividers (header border, homepage band);
  `--hub-rule-color` in light mode.
- **Paper Grey** (`paper-grey`) and **Mist Teal** (`mist-teal`): dropdown menus
  and their hover; Mist Teal is also the hover for white buttons.

### Named Rules

**The Meaning-Only Color Rule.** Color appears only where it carries meaning:
page type, callout kind, primary action, or a brand moment (hero, cookie
notice). Running text and surfaces stay neutral.

**The One Source Rule.** Never hard-code a palette hex in CSS. Use
`var(--brand-*)` for palette colors and `var(--hub-*)` for values that differ by
theme; any remaining hex value needs a comment saying why.

**The Checked Pair Rule.** Every color pairing is checked in both themes: text
at 4.5:1 or more, icons and focus rings at 3:1 or more. When a brand color
fails, use a darker or lighter palette step (Meadow Green, Ember Orange), not a
new color.

## Typography

**Display Font:** Gelasio (with Georgia, serif) **Body Font:** Arimo (with
Arial, sans-serif) **Label/Mono Font:** Fira Code (with monospace)

**Character:** A bookish transitional serif for headings over a neutral, highly
legible grotesque for reading and interface text: the published protocol's
authority with a working document's clarity.

### Hierarchy

- **Display** (Gelasio 700, `clamp(1.9rem, 1.2rem + 3vw, 2.5rem)`, 1.2): the
  homepage hero title only; two lines on a phone.
- **Headline** (Gelasio 700, 34px, 1.2): page titles (`h1`).
- **Title** (Gelasio 700, 28px, 1.2): section headings (`h2`).
- **Subtitle** (Gelasio 600, 24.65px, 1.2): subsections (`h3`) and homepage
  topic cards.
- **Body** (Arimo 400, 18.7px, 1.5): running text and abstracts. The reading
  column is about 690px wide (about 75 characters per line) on a laptop.
- **Nav** (Arimo 700, 16.36px): navbar links. Sidebar links are Arimo 400 at
  15.7px; TOC links Arimo 400 at 14.9px.
- **Caption** (Arimo 400, 15.3px): figure captions, centered and italic.
- **Label** (Arimo 700, 0.72rem, 0.06em tracking, uppercase): the Diátaxis
  page-type badge only.
- **Code** (Fira Code 400, inline 500, 16.36px): code blocks and inline code,
  ligatures off.

### Named Rules

**The Three Voices Rule.** Gelasio is for headings, Arimo for everything a
reader reads or clicks, Fira Code only for code. Never set body text, buttons,
or labels in the serif, and never use monospace as decoration.

**The Reading Measure Rule.** Keep running text in the 900px body column (about
65--75 characters per line). Wide content (tables, code output) scrolls inside
its own box instead of widening the column.

## Layout

The site uses Quarto's docs grid: a 250px section sidebar, a 900px body column,
and a 300px right margin for the table of contents and page metadata (authors,
contributors, last modified, license). Each topic section has its own sidebar;
the homepage and a few standalone pages have none.

The homepage uses a custom layout: a full-width hero band, a grey action band,
and a two-column grid of topic cards (single column below 800px). Its content
blocks have 30px side margins, 50px from 900px, and center at a maximum of
1100px from 1200px.

Responsive behavior:

- Below 1200px the navbar collapses to the menu button with a centered logo (the
  full set of links needs about 1200px).
- Below 992px the section sidebar moves behind a toggle.
- Below 768px the table of contents leaves the margin.
- Tables are wrapped so they scroll horizontally on narrow screens; long URLs
  wrap; images and videos never exceed the column.
- On touch screens, sidebar, TOC, and footer links get extra vertical padding
  (about 37--41px tall).

## Elevation & Depth

The system is flat. Pages, cards, and callouts sit on the page with no shadow;
depth comes from tonal tints (callouts, the homepage grey band) and hairline
borders. Shadows are reserved for layers that float above content.

### Shadow Vocabulary

- **Menu lift** (`box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15)`; 0.5 alpha in dark
  mode): navbar dropdown menus.
- **Floating notice** (`box-shadow: 0 6px 20px rgba(0, 0, 0, 0.22)`): the cookie
  notice.

### Named Rules

**The Flat Page Rule.** Anything that is part of the page is flat. Only elements
that float over the page (menus, the cookie notice) cast a shadow.

## Shapes

Soft-edged and confident. Interactive and labeling elements are pills (buttons,
the Diátaxis badge, cookie-notice buttons); containers use rounded corners
(callouts 0.5rem, the cookie notice 0.75rem); small utility surfaces (inline
code, the skip link) use 0.25rem. Borders are hairlines (1px) in the element's
own meaning color at partial opacity, or Stone/Rule Grey for neutral frames.

**The No-Stripe Rule.** No thick colored border on one side of a box. Callouts
use a full 1px border plus a faint tint, never Quarto's default 5px left stripe.

## Components

### Buttons

Confident pills with a single clear job.

- **Shape:** fully rounded (`{rounded.pill}`), minimum width 165px on the
  homepage.
- **Hero button:** Paper White with Canopy Green text on the green hero band;
  hover turns Mist Teal.
- **Action button:** Ember Orange with white text on the grey band; hover
  deepens to Ember Orange Deep.
- **Focus:** every control shows a 2px outline in `--hub-focus-color`
  (Institutional Navy light, Signal Orange dark) with a 2px offset; on green
  surfaces the outline turns white.

### Diátaxis badge

The page-type label above every content page title (Tutorial, How-to guide,
Reference, Explanation), set by the page's `categories`.

- **Style:** transparent pill with a 1.5px border in the text color; Label
  typography.
- **Colors:** Tutorial Canopy Green / IPA Field Green, How-to Brick / Apricot,
  Reference Institutional Navy / Periwinkle, Explanation Pewter / Stone (light /
  dark), each at 4.5:1 or more.

### Callouts

Quarto callouts (Note, Tip, Warning, Important, Caution) restyled in
`callouts.scss`.

- **Corner Style:** `{rounded.md}`.
- **Border:** 1px in the callout's color at 35% opacity (45% in dark mode).
- **Background:** the callout's color at 3.5% opacity (6% in dark mode).
- **Icon and header:** the callout's color, at 3:1 or more against the page.

### Cookie notice

A slim floating box, not a banner: one sentence and two buttons.

- **Desktop:** bottom-left, maximum 32rem wide, Canopy Green with white text,
  `{rounded.lg}`, Floating notice shadow.
- **Phone:** a full-width bar 0.5rem from the edges with two equal 44px buttons.
- **Buttons:** OK is a white pill with Canopy Green text; Decline is a
  transparent pill with a white border.

### Navigation

- **Navbar:** white (dark surface in dark mode), Arimo bold links, a 1px Rule
  Grey bottom border from 1200px; collapses to the menu button below 1200px.
- **Sidebar:** Arimo regular links; the current page in Institutional Navy.
- **Table of contents:** labelled "In this resource" (a label, not a heading),
  followed by authorship metadata; a skip link ("Skip to main content") is the
  first focusable element on every page.

### Media

- Screen recordings are short MP4 videos written as ordinary Markdown images;
  they loop without sound while in view, pause when they leave it, and stay
  still for readers who ask for reduced motion.
- Images are capped at about 1600px wide, load only as the reader scrolls near
  them (except the first), and always have alt text (a figure's caption is
  reused when no `fig-alt` is set).

## Do's and Don'ts

### Do:

- **Do** use `var(--brand-*)` and `var(--hub-*)` for every color in custom CSS.
- **Do** check new color pairings in both light and dark mode (text 4.5:1, icons
  and focus rings 3:1).
- **Do** give every content page exactly one Diátaxis category so it gets its
  badge.
- **Do** use pills for actions and labels, and 0.5rem corners for containers.
- **Do** keep running text in the body column and let wide tables and code
  scroll inside their own box.
- **Do** write screen recordings as `![alt text](file.mp4)` and give every image
  alt text.

### Don't:

- **Don't** hard-code palette hex values in CSS.
- **Don't** add thick colored side borders (stripes) to callouts, cards, or
  alerts.
- **Don't** set body text, buttons, or labels in Gelasio, or use Fira Code for
  anything but code.
- **Don't** put text in IPA Field Green on a white background (about 2.9:1).
- **Don't** add shadows to elements that are part of the page.
- **Don't** add new fonts or load fonts from Google; the three brand fonts are
  self-hosted in `assets/fonts/`.
