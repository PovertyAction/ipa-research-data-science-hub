# Hub page anatomy (house style)

The structure Hub pages follow, reconciled from the Knowledge Hub Generator
template, `CLAUDE.md`, the site maintainers' review guidance, and the
conventions observed across the existing content pages. Where the corpus is
inconsistent, this file prescribes the stronger practice rather than the
average. Ground any new page against the canonical worked examples:
`research-design/research-methods.qmd` (prose) and
`data-science/data-analysis/for-loops.qmd` (tutorial), plus the frontmatter
skeleton in `page-template.qmd` (repo root).

## Two page archetypes --- decide which one first

Almost every convention below splits along two archetypes. Pick the archetype
before drafting; it follows from the Diátaxis type and the content area.

- **A --- IPA-authored prose page** (explanation / reference, and prose how-to).
  Signature: a `## Key Takeaways` tip block near the top, prose with nested
  callouts and pipe tables, references at the end. See archetype A below.
- **B --- Carpentries-style tutorial / how-to page.** Signature: a collapsed
  *Recognition and Attribution* box, a *Learning Objectives* callout,
  step-by-step fenced code with companion `output` blocks, exercises with
  collapsible solutions, and a `## Key Points` closer. See
  `references/tutorial-pattern.md`.

Content-area → typical type and archetype:

  | Area                                                                                              | Typical Diátaxis type     | Archetype                           |
  | ------------------------------------------------------------------------------------------------- | ------------------------- | ----------------------------------- |
  | `data-science/data-analysis`, `data-science/data-visualization`, `data-science/webscraping`       | tutorial                  | B                                   |
  | `software/shell`, `software/git`, `software/python` (coding, data-processing), `*/how-to-*`       | tutorial / how-to         | B                                   |
  | `software/*` overview & `index` pages (stata, python, quarto, claude, vscode, github, virtualenv) | explanation               | A                                   |
  | `research-design` (non-how-to), `research-ethics`, `monitoring-evaluation-learning`               | explanation (+ reference) | A                                   |
  | `data-cleaning`, `data-collection`, `data-quality`, `data-security`                               | explanation / reference   | A                                   |
  | any directory `index.qmd`                                                                         | reference (link hub)      | A — see "Index landing pages" below |

## Shared frontmatter (both archetypes)

Every page needs this frontmatter. Near-universal fields: `title`, `abstract`,
`authors-ipa`, `keywords`, `license`. `contributors` is common but optional.

```yaml
---
title: "Concise, Specific Page Title"
abstract: "One to three sentences describing the page. This is the canonical page summary; keep it self-contained."
authors-ipa:
  - "[Author One](https://poverty-action.org/people/author-one)"
contributors:
  - "[Contributor Name](https://poverty-action.org/people/contributor-name)"
categories:
  - explanation    # Diátaxis type first; optional topical categories after
keywords:
  - topical term
  - another term
  - explanation   # the Diátaxis type is the last keyword
license:
  text: "CC BY-SA"
  url: https://creativecommons.org/licenses/by-sa/4.0/
---
```

Field notes:

- **`title`** --- quoted string; unique and succinct. The body never repeats it
  as a level-1 `#` heading (see "Headings" below).
- **`abstract`** --- the canonical summary; a quoted scalar or a `abstract: |`
  block both work. If source arrives with a `custom-summary-block`, move its
  text here and improve readability. `abstract` carries the summary even when no
  visible summary block appears on the page.
- **`authors-ipa`** --- spelled `authors-ipa` (plural, hyphenated), **not**
  `author-ipa`. Format each as a markdown link to the person's IPA profile
  (`https://poverty-action.org/people/<slug>`) or GitHub profile
  (`https://github.com/<handle>`) --- both are used. A person or org without a
  profile can be a plain string (`- "Jane Doe"`). Non-person contributors are
  links too (`- "[The Carpentries](https://carpentries.org/)"`).
- **`contributors`** --- support/feedback/maintenance, not main authors. Include
  only when there are real contributors; do not pad it.
- **`categories`** --- required on every content page. The **first** entry is
  the page's Diátaxis type, exactly one of
  `tutorial | how-to | reference |   explanation` (lowercase). The
  `_extensions/diataxis-badge` Lua filter and
  `assets/design-styles/title-block.html` render it as a badge above the title,
  and `how-to-guides.qmd` auto-lists every page categorized `how-to` --- so the
  value must be accurate. Optional topical categories (e.g. `Data Collection`)
  may follow the type.
- **`keywords`** --- topical terms plus the Diátaxis type as the **last**
  keyword. Prose pages use a lowercase block list; tutorial pages often use an
  inline Title-cased array (`keywords: ["Python", "Tutorial", "Data Science"]`).
  Types seen: `explanation` (most common), `reference`, `tutorial`; use the
  accurate type for the page.
- **`license`** --- the object form (`text` + `url`) is standard; `CC BY-SA`
  unless the human specifies otherwise.
- **Do not add** `format`, `format-links`, `bibliography`, `csl`,
  `number-sections`, or `image` --- these are inherited from `_quarto.yml`
  site-wide. `date` is unnecessary too: a git filter injects the last-modified
  date automatically (a few pages set `date: last-modified` explicitly, but it
  is not required).
- The `#---- Authors ----` comment banners from `page-template.qmd` are optional
  residue; `just new-page` generates them. Keep or trim.

## Archetype A --- prose page structure

After the frontmatter, in order:

1. **Optional lead image** (see "Images" below). Common on overview and section
   pages, not required.

2. **Optional summary block** --- a one-sentence restatement of the abstract, as
   the first visible text. Used mainly on software overview and `index` pages,
   not on every page. When adapting outside material, this is where the
   attribution footnote hangs (see "Credits").

   ```markdown
   :::{.custom-summary-block}
   One-sentence summary of the page.
   :::
   ```

3. **Key Takeaways** --- the near-universal opening block for prose pages. 2--4
   points (usually 3) capturing the essential ideas:

   ```markdown
   :::{.callout-tip appearance="simple"}
   ## Key Takeaways
   - First essential idea.
   - Second essential idea.
   - Third essential idea.
   :::
   ```

4. **Body sections** --- start at `##`. Introduce and define terms, then develop
   the topic. For explanation and reference pages, break detail into
   subsections; collapsible callouts keep long pages scannable:

   ```markdown
   ::: {.callout-tip collapse="true"}
   ### Concept name
   Explanation of the concept.
   :::
   ```

5. **References / Additional Resources** at the end, when the page has sources
   (see "References" below).

## Public-first callouts

The Hub is public. Keep IPA-specific content out of the main flow and inside a
callout. Rule of thumb: *if it would not apply to someone at another
organization doing similar work, it belongs in a callout.*

- `callout-note` for IPA context --- Enterprise license, internal guidelines,
  Box links, support channels, named IPA projects.
- `callout-warning` for a rule the reader must not miss (data-classification or
  data-safety rules).
- Give the callout a `##`/`###` title (`## Access at IPA`,
  `## The rule at IPA`).

```markdown
::: {.callout-note}
## Access at IPA
IPA staff are covered by the organization's Enterprise license. Sign in at
[claude.ai](https://claude.ai) with your IPA email; if not, contact
[support@poverty-action.org](mailto:support@poverty-action.org).
:::
```

## Credits and attribution

- Crediting people in `authors-ipa` (and `contributors` when applicable) is
  enough for original IPA content. Do not add a separate attribution callout or
  a contributors block in the body.

- When a **prose** page adapts outside material, record it as a single footnote,
  not a callout:

  ```markdown
  :::{.custom-summary-block}
  Summary sentence.[^source]
  :::

  [^source]: Adapted from [Source Title](https://example.com/source) by Author,
  used under the [MIT License](https://example.com/license).
  ```

- **Tutorial (archetype B) pages adapted from the Carpentries or similar keep
  the full `Recognition and Attribution` box** --- that is the house convention
  for that archetype; see `references/tutorial-pattern.md`.

## References and Additional Resources

Only when the page has real sources --- many pages (especially tutorials) have
none. **Never fabricate a reference** (see `SKILL.md`). Two possible sections:

- **`## References`** --- works cited in the page.
- **`## Additional Resources`** --- further reading not directly cited.

Use **Chicago author-date** as the house standard (matching
`research-design/research-methods.qmd`), even though some older pages use APA
--- prefer Chicago for new and revised pages:

```markdown
## References

Gugerty, Mary Kay, and Dean Karlan. 2018. *The Goldilocks Challenge: Right-Fit
Evidence for the Social Sector*. New York: Oxford University Press.

## Additional Resources

Anthropic. "Claude Code Documentation." [https://code.claude.com/docs](https://code.claude.com/docs).
```

Include only the section(s) the page needs; a page whose sources are all
dateless web docs may have only `## Additional Resources`.

## Shared formatting conventions

These apply to both archetypes.

- **Headings** start at `##` --- the body never uses a level-1 `#` heading (the
  `title` frontmatter is the page's H1). Nest with `###`/`####`.

- **Images** use site-absolute asset paths and set a width; add a photo credit
  with the year in the caption. Use the `©` glyph (not `®`):

  ```markdown
  ![Data Collection at IPA, Peru (© IPA, 2022)](/assets/images/Peru_Survey_2009.jpg){width=100% fig-align="center"}
  ```

- **Tables** are hand-written Markdown pipe tables with **bold** cell headers.
  Add a Quarto caption line and `{.striped}` directly under the table:

  ```markdown
  | **Method** | **Primary use** |
  | --- | --- |
  | ... | ... |

  : Common qualitative methods and their primary uses {.striped}
  ```

- **Code blocks** are usually static fenced blocks (```` ```python ````,
  ```` ```bash ````, ```` ```stata ````, ```` ```powershell ````), not live
  `{python}` chunks --- the site renders most code as text. Show a command and
  its result as a code block followed by a companion ```` ```output ```` block
  (the Carpentries input/output idiom; see `references/tutorial-pattern.md`).
  Use live ```` ```{python} ```` chunks only when the page genuinely renders
  computed output (e.g. plots in `data-science/data-visualization/*`); the
  `quarto` skill covers cell options.

- **`{.panel-tabset}`** presents OS-specific or tool-specific variants (Windows
  / Mac, Stata / R). Use it for exactly that.

- **Cross-references** (`@fig-`, `@tbl-`, `@sec-`) are used only where a page
  defines the matching `{#id}`; most pages do not cross-reference. Do not add
  ids unless you reference them.

- **Internal links** are relative `.qmd` paths
  (`[In-Person Surveys](in-person-surveys.qmd)`); **asset links are
  site-absolute** (`/assets/images/...`).

## Index landing pages

A directory's `index.qmd` is a **link hub**, not a prose page. Since the 2026
navigation overhaul, section landing pages follow a shared shape (worked
examples: `research-transparency/index.qmd`, `data-quality/index.qmd`):

1. A short prose intro (one or two paragraphs).
2. **`## What You Will Find Here`** --- one
   `::: {.callout-tip    appearance="simple"}` "card" per child page or theme,
   each with a `##` title, bullet links to the child `.qmd` files (a `-` dash
   and a one-line description after each link, or a blurb paragraph below the
   list).
3. **`## Getting Started`** --- a short pointer telling the reader which page to
   read first and in what order.
4. **`## Related Resources`** --- bullet links to relevant pages in other
   sections (relative paths, e.g. `../data-quality/data-anonymization.qmd`).

```markdown
## What You Will Find Here

::: {.callout-tip appearance="simple"}

## In-Person Surveys

- [In-Person Survey Guidelines](in-person-surveys.qmd) - One-line description
  of what the child page covers

:::

## Getting Started

**New to the topic?** Read [Page A](page-a.qmd) first, then follow
[Page B](page-b.qmd) when you are ready to act.

## Related Resources

- [Data Anonymization](../data-quality/data-anonymization.qmd) - Removing
  identifying information before sharing data
```

## Placeholder (under-construction) pages

Even a stub page needs minimal frontmatter --- at least `title` and `abstract`
(`abstract: "This page is under construction."`) above the placeholder image ---
so listings and navigation render it correctly.
