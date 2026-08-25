# Quality-control checklist

Run this before handing back any Hub page created or modified. It replicates the
quality control the Knowledge Hub Generator applies. Work top to bottom; fix
what fails before finishing. Items marked **(prose)** or **(tutorial)** apply
only to that archetype --- see `references/page-anatomy.md` and
`references/tutorial-pattern.md`.

## Automated checks (always run)

Both are required by `CLAUDE.md` on every page created or modified:

- [ ] `just fmt-md <file>` --- markdown formatting. Run first; it auto-fixes
  many issues (including bullet-marker consistency).
- [ ] `just vale-file <file>` --- writing-style checks. Resolve reported errors;
  advisory suggestions (passive voice, acronyms) may remain if they match
  the style of existing Hub pages.
- [ ] Page renders cleanly --- `quarto render <file>` (or `just preview-docs`)
  with no errors.

## Frontmatter

- [ ] Near-universal fields present: `title`, `abstract`, `authors-ipa`,
  `keywords`, `license`. `contributors` present only if there are real
  contributors to credit.
- [ ] Field is spelled `authors-ipa` (not `author-ipa`). Author/contributor
  entries link to an IPA profile or GitHub profile where the person has one;
  plain strings are fine when they do not.
- [ ] `abstract` is self-contained prose and carries the page summary. If the
  source had a `custom-summary-block`, its text was moved into `abstract`.
- [ ] `keywords` ends with the accurate Diátaxis type (`tutorial` /
  `how-to guide` / `reference` / `explanation`).
- [ ] `license` is `CC BY-SA` (object form) unless the human specified
  otherwise.
- [ ] No inherited fields added by hand: `format`, `format-links`,
  `bibliography`, `csl`, `number-sections`, `image`, `date` (these come from
  `_quarto.yml` or the git-dates filter).

## Structure

- [ ] Headings start at `##`; the body has no level-1 `#` heading.
- [ ] Filename is lowercase-hyphenated; the directory has an `index.qmd`.
- [ ] **(prose)** A `:::{.callout-tip appearance="simple"}` Key Takeaways block
  near the top, 2--4 points. A `custom-summary-block` is optional (used
  mainly on overview/index pages).
- [ ] **(prose)** Body sections match the Diátaxis type; long pages use
  collapsible callouts for concepts.
- [ ] **(tutorial)** Opens with a collapsed `Recognition and Attribution` box
  (when adapted) and a `## Learning Objectives` callout; closes with a
  `## Key Points` `callout-important`. Section headings are full sentences
  that restate the point.
- [ ] **(index)** Landing pages are link hubs --- one
  `:::{.callout-tip appearance="simple"}` card per child page, not prose.

## Content and voice

- [ ] **Public audience first** --- every IPA-specific detail (Enterprise
  license, internal guidelines, Box links, support channels, named IPA
  projects) is in a `callout-note` or `callout-warning`, not the main flow.
- [ ] **Point, do not duplicate** --- install steps and tool-maintained details
  link to the canonical source rather than reproducing it.
- [ ] **Recommended path only** --- no unnecessary alternatives, and no
  negative-space writing (no describing what the page does not cover).
- [ ] Accessible, straightforward language; tone and idiom match the archetype.
- [ ] Internal links use relative `.qmd` paths; asset links are site-absolute
  (`/assets/...`).

## Formatting

- [ ] Images use a site-absolute `/assets/images/...` path, set a width, and
  carry a caption with a photo credit and year using the `©` glyph (not
  `®`).
- [ ] Tables are pipe tables with **bold** header cells and a
  `: caption {.striped}` line beneath.
- [ ] **(tutorial)** Code uses static fenced blocks with the input/output idiom
  (a command block followed by a companion ```` ```output ```` block). Live
  ```` ```{python} ```` chunks appear only where the page renders computed
  output.
- [ ] Cross-reference ids (`{#fig-…}`, `{#tbl-…}`) exist only where the page
  actually references them.

## Diátaxis fit

- [ ] The page does one job. A tutorial teaches through guided doing; a how-to
  guide directs a competent reader toward a goal; reference states neutral
  facts; explanation gives context and the *why*. It does not mix modes.

## References and credits

- [ ] References only if the page has real sources (many tutorial pages have
  none). When present, `## References` (cited works) and/or
  `## Additional Resources` (further reading) in **Chicago author-date**
  format.
- [ ] **No fabricated references** --- every entry appears in the supplied
  material or has a real, verifiable URL. Flag any unsourced claim to the
  human.
- [ ] Credits: original IPA content is credited via `authors-ipa` (and
  `contributors` if applicable) only --- no body attribution block. A
  **prose** page adapting outside material uses a single footnote; a
  **tutorial** page keeps the `Recognition and Attribution` box.

## Navigation

- [ ] New pages are added to `_quarto.yml` navigation in the right section.

## Sensitive-data guard

- [ ] No PII, confidential, or highly confidential material in the page --- no
  real participant/staff names used as data, internal-only paths, embargoed
  findings, or content restricted by NDA. If the source material contains
  any, do **not** copy it into the public page; strip it and flag it to the
  human.
