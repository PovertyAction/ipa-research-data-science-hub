# Quarto and Markdown Style Guide

This document explains the markdown linting rules used in this repository and provides guidance on writing well-formatted Quarto documents.

## Table of Contents

- [Quarto and Markdown Style Guide](#quarto-and-markdown-style-guide)
    - [Table of Contents](#table-of-contents)
    - [Introduction](#introduction)
    - [Basic Markdown Rules](#basic-markdown-rules)
        - [Headings](#headings)
        - [Lists](#lists)
        - [Code Blocks](#code-blocks)
    - [Quarto-Specific Rules](#quarto-specific-rules)
        - [Callout Blocks](#callout-blocks)
        - [Div and Span Elements](#div-and-span-elements)
        - [Diagrams](#diagrams)
        - [Cross-References](#cross-references)
    - [Accessibility Requirements](#accessibility-requirements)
        - [Image Alt Text](#image-alt-text)
        - [Footnotes](#footnotes)
    - [Common Issues and Solutions](#common-issues-and-solutions)
        - [Unordered List Style](#unordered-list-style)
        - [Multiple Consecutive Blank Lines](#multiple-consecutive-blank-lines)
        - [Inline HTML](#inline-html)
    - [Using the Linter](#using-the-linter)
        - [Command Line](#command-line)
        - [VS Code Integration](#vs-code-integration)
        - [Pre-commit Hook](#pre-commit-hook)

## Introduction

We use markdownlint with custom rules to ensure consistent formatting across all Quarto and Markdown files. This helps maintain readability, accessibility, and a professional appearance throughout the documentation.

## Basic Markdown Rules

### Headings

- Leave blank lines before and after headings
- Use ATX-style headings with a space after the `#` characters
- Only one top-level (H1) heading per document
- Don't skip heading levels (e.g., H1 to H3)

```markdown
# Heading 1

Text here.

## Heading 2

More text here.
```

### Lists

- Use asterisks (`*`) for unordered lists (not dashes)
- Use proper indentation (4 spaces) for nested lists
- Leave a blank line before and after lists

```markdown
* Item 1
* Item 2
    * Nested item 2.1
    * Nested item 2.2
* Item 3
```

### Code Blocks

- Use fenced code blocks with backticks (```)
- Specify a language for syntax highlighting
- Allowed languages include: bash, r, python, yaml, json, html, css, javascript, markdown, sql, text, mermaid, dot, graphviz, stata

```markdown
    ```{python}
    def example_function():
        return "Hello, world!"
    ```
```

## Quarto-Specific Rules

### Callout Blocks

Quarto supports special callout blocks for notes, tips, warnings, etc.

```markdown
::: {.callout-note}
This is a note callout.
:::

::: {.callout-tip title="Custom Title"}
This tip has a custom title.
:::

::: {.callout-warning collapse="true"}
This warning is collapsible.
:::
```

Rules enforced:

- Callout blocks must have proper opening and closing syntax (`::: {...}` and `:::`)
- Valid callout types: note, tip, warning, caution, important
- Collapsible callouts must use `collapse="true"` or `collapse="false"`
- Callout appearance must be one of: default, simple, minimal
- Callout blocks should have a title (either in the attributes or as the first heading)

### Div and Span Elements

Div elements use triple colons for multi-line content:

```markdown
::: {#special-div .special-class custom-attr="value"}
Content goes here.
:::
```

Span elements use bracket-brace syntax for inline content:

```markdown
This is [special content]{.special-class #special-id key="value"}.
```

### Diagrams

Quarto supports Mermaid and Graphviz diagrams:

```markdown
    ```{mermaid}
    flowchart LR
    A[Start] --> B{Decision}
    B -->|Yes| C[Result 1]
    B -->|No| D[Result 2]
    ```
```

### Cross-References

Quarto enables cross-referencing figures, tables, sections, etc.:

```markdown
See @fig-example for an illustration.

![Example figure](image.png){#fig-example}
```

Supported reference types: fig, tbl, sec, eq, thm, lem, cor, prp, cnj, def, exm, exr, rem, lst

## Accessibility Requirements

### Image Alt Text

All images must include alternative text for accessibility. You can provide alt text in two ways:

```markdown
![Descriptive alt text](image.png)

![](image.png){fig-alt="Descriptive alt text"}
```

Rules enforced:

- All images must have alternative text
- Alt text should be descriptive (not generic terms like "image" or "chart")
- HTML `<img>` tags must include alt attributes

### Footnotes

Footnotes should be properly formatted:

```markdown
Here's a statement with a footnote.[^1]

[^1]: This is the footnote content.
```

## Common Issues and Solutions

### Unordered List Style

All unordered lists should use asterisks (`*`), not dashes (`-`):

```markdown
* This is correct
* Another item

- This is incorrect
- Another item
```

### Multiple Consecutive Blank Lines

Avoid multiple blank lines in a row:

```markdown
This is followed by one blank line.

This is correct.

This has two blank lines after it.


This is incorrect.
```

### Inline HTML

Inline HTML is allowed when necessary, but prefer Markdown syntax when possible.

## Using the Linter

We use [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli) to lint and format Markdown files.

### Command Line

```bash
# Format all markdown files
just fmt-markdown

# Format a specific file
just fmt-md path/to/file.qmd

# Check format without fixing
just fmt-check-markdown
```

### VS Code Integration

VS Code will automatically lint markdown files if you install the recommended extensions. You'll see warnings and errors highlighted in your editor.

To set up VS Code with markdownlint:

1. Install the [markdownlint extension](https://marketplace.visualstudio.com/items?itemName=davidanson.vscode-markdownlint)
2. The extension will automatically use the repository's `.markdownlint.yaml` configuration

### Pre-commit Hook

A pre-commit hook will run markdownlint-cli automatically when you commit changes, ensuring all files are properly formatted.

The pre-commit hook is configured in `.pre-commit-config.yaml` and uses the configuration from `.markdownlint.yaml`.
