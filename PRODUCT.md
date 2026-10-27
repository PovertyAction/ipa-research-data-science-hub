# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users

- **Primary:** Innovations for Poverty Action (IPA) staff doing research and
  data work. This includes research associates, field and project managers, data
  and MEL staff, and principal investigators in IPA country offices and global
  teams. They come to the Hub to do a task correctly: follow an IPA protocol,
  set up a tool, design a study, or check a data-quality step.
- **Secondary:** external researchers, partners, and other evaluators. The site
  is public and they are welcome, but content and navigation decisions favor IPA
  staff.
- Readers are technically minded. Many read English as a second language.

## Product Purpose

The IPA Knowledge Hub (data.poverty-action.org) is IPA's central, public
documentation site for research design, MEL, research ethics and IRB, data
quality, data security, data collection, data cleaning, data science, research
transparency, and software tools. It replaces scattered internal documents with
one maintained source. Success means staff find clear, actionable guidance
quickly and apply IPA standards consistently across projects and countries.

## Positioning

- **IPA's own protocols.** It publishes IPA's official research protocols and
  data-quality and data-security standards, which general sources such as J-PAL
  or the DIME Wiki cannot speak for.
- **Practical tool guides.** Hands-on guides (shell, Git, GitHub, VS Code,
  Python, Stata, Quarto, Claude) are tied to IPA workflows.
- **AI-readable documentation.** `llms.txt` output and an MCP connection
  (`connect-ai.qmd`) let AI agents answer questions from Hub content.
- **Diátaxis structure.** Every page is a tutorial, how-to guide, reference, or
  explanation, and the site shows that type to readers.

## Operating Context

- Readers mostly use office laptops with desktop browsers on adequate
  connections. Mobile is occasional, not primary.
- Content is written by Global Research and Data Science (GRDS) and other IPA
  contributors in `.qmd` files, reviewed through GitHub pull requests, and
  checked with Vale (writing style) and Panache (Markdown formatting).
- Pages carry authors, contributors, last-modified dates (from git), and a CC
  BY-SA license.
- Contact for feedback: researchsupport@poverty-action.org.

## Capabilities and Constraints

- Built with Quarto as a static website. Theming uses Bootstrap (Litera) plus
  brand files in `assets/design-styles/` (`light-brand.yml`, `dark-brand.yml`).
  The site has light and dark modes that follow the user's system preference.
- Per-section sidebars, a navbar topic menu, site search, and a how-to listing
  page generated from `categories: how-to`.
- Diátaxis type comes from `categories:` and is rendered as a badge by
  `_extensions/diataxis-badge`.
- Also produces `llms.txt` output; PDF output (Typst) is linked per page.
- Uses Google Analytics with anonymized IP and an implied cookie-consent banner.
- The site is public. Only Public or Internal-classified content may appear.
  Confidential data (PII, participant data, embargoed findings) never belongs on
  the Hub.
- Terminology: MEL (monitoring, evaluation, and learning), IRB, GRDS, RFE
  (Right-Fit Evidence), high-frequency checks, backchecks.

## Brand Commitments

- IPA brand identity: the official logos in `assets/logos/` and the brand
  palette and fonts set in the brand yml files. Apply the IPA brand guidelines.
- Voice: plain, direct, accessible English for readers who use it as a second
  language. Style is enforced by the Vale rules in `styles/`.

## Evidence on Hand

- Real content: IPA research protocols (`data-quality/`, `data-security/`,
  `research-ethics/`), software guides (`software/`), and team pages (`teams/`).
- Field photography in `assets/images/`.
- No testimonials, usage metrics, or adoption statistics are on hand. Do not
  invent them.

## Product Principles

1. IPA staff doing real work come first. Optimize for finding and applying the
   right guidance, not for impressing visitors.
2. Clarity over cleverness. Plain language and predictable structure for readers
   who use English as a second language.
3. Authority through accuracy. Protocols and standards must read as official,
   current, and attributable (authors, dates, license).
4. One page, one Diátaxis type. Keep tutorials, how-to guides, reference, and
   explanation distinct.
5. Readable by people and machines. Content structure should serve both human
   readers and AI agents.

## Accessibility & Inclusion

- Plain-language writing for readers who use English as a second language is a
  standing requirement.
- Undecided: a formal WCAG conformance target (WCAG 2.2 AA is the recommended
  default).
