# IPA Typst Template

This is a custom Typst template for the IPA Research & Data Science Hub. It provides consistent branding and formatting for PDF documents generated from Quarto markdown files.

## Features

- **Branded header**: Features the IPA logo and site title
- **Typography**: Georgia Regular for headings, Arial Bold for secondary titles, Arial Regular for body text
- **Professional formatting**: Consistent margins, spacing, and typography
- **License footer**: Includes proper attribution and CC BY 4.0 licensing
- **Automatic metadata**: Supports title, authors, date, abstract, and keywords
- **Page numbering**: Professional footer with page numbers

## Usage

### Using the Extension

To use this template, specify the IPA Typst format in your document's YAML front matter:

```yaml
---
title: "Your Document Title"
author: "Author Name"
date: last-modified
format: ipa-typst-typst
abstract: "Optional abstract for your document"
keywords: ["keyword1", "keyword2"]
---
```

Then render with:

```bash
quarto render your-document.qmd --to ipa-typst-typst
```

### Alternative Usage

You can also use the extension directly in the format specification:

```yaml
---
title: "Your Document Title"
format:
  ipa-typst-typst: default
---
```

## Template Files

- `_extension.yml`: Extension configuration
- `typst-template.typ`: Main template function with IPA branding and fonts
- `typst-show.typ`: Interface between Quarto and Typst template

## Dependencies

- Quarto 1.4.0 or higher
- Typst support in Quarto
- IPA logo file at `assets/logos/ipa-logo-full.jpg`

## Font Notes

The template uses a professional typography scheme:

**Primary Typefaces:**

- **Georgia Regular**: Used for all headings (H1, H2, H3)
- **Arial Bold**: Used for secondary titles (document title)
- **Arial Regular**: Used for body text, labels, footnotes, and captions

**Fallback Fonts:**

- For Georgia: Times New Roman, serif
- For Arial: Liberation Sans, Helvetica, sans-serif

The template gracefully falls back to commonly available system fonts when the primary fonts are not available.
