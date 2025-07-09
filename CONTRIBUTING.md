# Contributing to the IPA Research and Data Science Hub

2025-07-09

Thank you for your interest in contributing to the IPA Research and Data
Science Hub! This document provides guidelines and instructions for
contributing to the project.

## Code of Conduct

We expect all contributors to follow professional standards of
communication and respect the time and efforts of others. Be
considerate, respectful, and collaborative in your approach.

## How can you contribute?

There are several ways you can contribute to the Research and Data
Science Hub:

1.  **Add new content**: Create new guides, tutorials, or documentation
2.  **Update existing content**: Improve or expand existing
    documentation
3.  **Fix typos or errors**: Help maintain high-quality content
4.  **Suggest improvements**: Open issues for content or features you’d
    like to see
5.  **Enhance functionality**: Contribute to the technical
    infrastructure of the Hub

You can contribute through any of the following methods:

- Edit pages directly in the [GitHub
  Repository](https://github.com/PovertyAction/ipa-research-data-science-hub),
  requires a GitHub account
- Open an issue on GitHub to suggest changes or report problems, [Report
  an
  issue](https://github.com/PovertyAction/ipa-research-data-science-hub/issues/new)
- Email the[IPA Global Research and Data Science
  team](mailto:researchsupport@poverty-action.org) if you have content
  you would like to contribute but are not comfortable using GitHub.
  GRDS can help you convert your content into the appropriate format and
  add it to the Hub.
- If you are an IPA staff member, you can also contact the GRDS team on
  the `IPA - Colab - Research` group on Microsoft Teams by tagging
  `@researchsupport` in a message.

The goal is to create a comprehensive resource for researchers and data
scientists working in international development. Your contributions are
invaluable in achieving that goal. Any contribution, no matter how
small, helps improve the Hub for everyone.

## Editing Process

The IPA Global Research and Data Science team reviews any content you
add or modify before publication on the Hub. This ensures that all
content meets quality standards and aligns with the Hub’s goals.

- The team uses IPA writing guidelines to ensure that all content is
  clear, concise, and accessible.
- Automated tools check for formatting, style, spelling, and grammar
  issues.

Before publication, a site administrator conducts a final review to
ensure new content meets standards and is ready for publication. After
approval, the content gets merged into the main branch on GitHub and
automatically published on the Hub.

## Git Development Workflow

If you want to contribute code or content, this project uses Git for
version control and collaboration. Here’s a quick overview of the
workflow:

### Branching Strategy

- Use `release/*` branches for new content
- Use `update/*` branches to modify existing content
- Use `feature/*` branches for technical infrastructure modifications
- Use `hotfix/*` branches for critical issues
- Use `bugfix/*` branches for non-urgent fixes

### Setting Up Your Development Environment

Clone the repository

``` bash
git clone https://github.com/PovertyAction/ipa-research-data-science-hub.git
cd ipa-research-data-science-hub
```

Install dependencies using this helpful `Just` command:

``` bash
just get-started
```

This will install all required software and create a Python virtual
environment. Note that you may need to install `Just` if you don’t have
it already.

``` bash
# For Windows users
winget install Casey.Just

# For macOS/Linux users
brew install just
```

Some of the documents require that you have Python, R, or Stata
available on your computer. Use the `_environment.required` file as a
template to create your own `_environment.local` file. This file should
contain any local environment variables you need, such as:

``` bash
# Path to the Python interpreter for Quarto
QUARTO_PYTHON=".venv\Scripts\python.exe"  # For Windows users
QUARTO_PYTHON=.venv/bin/python # For macOS/Linux users

# Path to the R interpreter for Quarto
QUARTO_R="C:\Program Files\R\R-4.5.1" # For Windows users
QUARTO_R=/home/linuxbrew/.linuxbrew/bin/R # For macOS/Linux users
```

### Making Changes

1.  **Create a branch**

    ``` bash
    git checkout -b branch-type/descriptive-name
    ```

    Replace `branch-type` with one of: `release`, `update`, `feature`,
    `hotfix`, or `bugfix`.

2.  **Make your changes to a document**

3.  **Test your changes**

    Preview the site locally:

    ``` bash
    just preview-docs
    ```

4.  **Check that files adhere to writing guidelines**

    ``` bash
    just vale-file path/to/file.qmd
    ```

5.  **Format and lint your changes**

    ``` bash
    just fmt-md path/to/file.qmd
    ```

6.  **Commit your changes**

    ``` bash
    git add .
    git commit -m "Brief description of changes"
    ```

7.  **Push your changes**

    ``` bash
    git push -u origin branch-type/descriptive-name
    ```

8.  **Open a Pull Request**

    Go to the repository on GitHub and open a pull request.

## Writing Content in Quarto

The IPA Research and Data Science Hub uses [Quarto](https://quarto.org/)
for content creation and site generation. Quarto is an open source
scientific and technical publishing system built on Pandoc.

See [Quarto guide](./software/quarto/index.qmd) for more details on how
to use Quarto.

### File Structure

- Content gets organized by topic area in directories
- Each directory should have an `index.qmd` file
- Use consistent naming conventions for files: lowercase, hyphenated
  names such as `data-collection.qmd`

### Quarto Basics

- Content uses Markdown with Quarto extensions
- Quarto files use the `.qmd` extension
- Each file should begin with YAML frontmatter defining metadata

Example YAML frontmatter:

``` yaml
---
title: "My New Page"
description: "Description of the page content"
date: last-modified


#------------------------------------------------------------------
# Authors
#------------------------------------------------------------------
# Authors are the main creators of the site's content, credited
# for their work and responsible for its core development,
# including writing and editing.
#------------------------------------------------------------------
authors-ipa:
   - "Author 1"
   - "Author 2"
   - "Author 3"

#------------------------------------------------------------------
# Contributors
#------------------------------------------------------------------
# Contributors provide support, such as feedback or supplementary
# materials for the site. They can also be responsible for
# updating/maintaining the site.
#------------------------------------------------------------------
contributors:
   - "Contributor 1"
   - "Contributor 2"
   - "Contributor 3"

keywords: ["keyword1", "keyword2", "keyword3"]
license: "CC BY"
---
```

### Special Features

Quarto supports many advanced features:

#### Callout Blocks

Use callout blocks to highlight important information:

``` markdown
::: {.callout-note}
This is a note callout.
:::

::: {.callout-tip title="Pro Tip"}
This is a tip with a custom title.
:::

::: {.callout-warning}
This is a warning callout.
:::

::: {.callout-important}
This is an important callout.
:::

::: {.callout-caution}
This is a caution callout.
:::
```

#### Cross-References

Create cross-references to other sections, figures, or tables:

``` markdown
See @sec-methodology for more details.

## Methodology {#sec-methodology}
```

#### Tabsets

Group content into tabs:

``` markdown
::: {.panel-tabset}
## Tab 1
Content for the first tab

## Tab 2
Content for the second tab
:::
```

See the [Quarto documentation](https://quarto.org/docs/guide/) for more
features.

## Markdown Style Guide

This project follows a specific Markdown style guide to ensure
consistency and readability across all content. Please adhere to the
following guidelines when writing or editing content:

Key points:

- Use [ATX-style
  headings](https://google.github.io/styleguide/docguide/style.html#atx-style-headings)
  with a space after the `#` such as `## Heading 2`
- Use asterisks (`*`) for unordered lists, not dashes
- Include blank lines before and after headings, lists, and code blocks
- Provide alt text for all images for accessibility
- Use fenced code blocks with language specification

## Code Quality Tools

### Pre-commit Hooks

This project uses pre-commit hooks to ensure code quality. These run
automatically when you commit changes.

Install pre-commit hooks:

``` bash
pre-commit install
```

### Markdownlint

This project uses markdownlint-cli to ensure consistent markdown
formatting:

``` bash
# Lint and fix all markdown files
just fmt-markdown

# Lint and fix a specific file
just fmt-md path/to/file.qmd

# Check without fixing
just fmt-check-markdown
```

The markdownlint configuration is defined in `.markdownlint.yaml`, which
is used by both VS Code and the command-line tool.

### Vale

This project uses Vale to check writing style and grammar:

``` bash
# Run Vale on all content
vale .

# Run Vale on a specific file
vale path/to/file.qmd
```

There are also several shortcuts for running Vale on specific
directories or files:

``` bash
# Report errors for an individual file:
just vale-errors path/to/file.qmd

# Report warnings for an individual file:
just vale-warnings path/to/file.qmd

# Report suggestions for an individual file:
just vale-suggestions path/to/file.qmd

# Report errors, warnings, and suggestion for an individual file:
just vale-file path/to/file.qmd

# Report all errors in Quarto Markdown files within the repository:
just vale-errors-all

# Report all warnings in Quarto Markdown files within the repository:
just vale-warnings-all
```

## Pull Request Process

1.  **Create a descriptive PR title**
2.  **Fill out the PR template** with details about your changes
3.  **Link to any related issues**
4.  **Request reviews** from appropriate team members
5.  **Address review feedback**
6.  **Pass all automated checks**
7.  **Wait for approval** before merging (only the IPA Global Research
    and Data Science site administrators can merge PRs to the `main`
    branch.)

## Getting Help

If you need assistance or have questions about contributing:

- Open an [issue on
  GitHub](https://github.com/PovertyAction/ipa-research-data-science-hub/issues/new)
- Contact the GRDS team at <researchsupport@poverty-action.org> or
  `@researchsupport` on Microsoft Teams.

Thank you for contributing to the IPA Research and Data Science Hub!
