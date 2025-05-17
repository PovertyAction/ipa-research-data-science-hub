# Contributing to the IPA Research and Data Science Hub

Thank you for your interest in contributing to the IPA Research and Data Science Hub! This document provides guidelines and instructions for contributing to the project.

## Table of Contents

* [Code of Conduct](#code-of-conduct)
* [How Can I Contribute?](#how-can-i-contribute)
* [Development Workflow](#development-workflow)
* [Writing Content in Quarto](#writing-content-in-quarto)
* [Markdown Style Guide](#markdown-style-guide)
* [Code Quality Tools](#code-quality-tools)
* [Pull Request Process](#pull-request-process)
* [Getting Help](#getting-help)

## Code of Conduct

We expect all contributors to follow professional standards of communication and respect the time and efforts of others. Be considerate, respectful, and collaborative in your approach.

## How Can I Contribute?

There are several ways you can contribute to the Hub:

1. **Add new content**: Create new guides, tutorials, or documentation
2. **Update existing content**: Improve or expand existing documentation
3. **Fix typos or errors**: Help us maintain high-quality content
4. **Suggest improvements**: Open issues for content or features you'd like to see
5. **Enhance functionality**: Contribute to the technical infrastructure of the Hub

## Development Workflow

### Branching Strategy

* Use `release/*` branches for new content
* Use `update/*` branches to modify existing content
* Use `feature/*` branches for technical infrastructure modifications
* Use `hotfix/*` branches for critical issues
* Use `bugfix/*` branches for non-urgent fixes

### Setting Up Your Development Environment

1. **Clone the repository**

   ```bash
   git clone https://github.com/PovertyAction/ipa-research-data-science-hub.git
   cd ipa-research-data-science-hub
   ```

2. **Install dependencies**

   ```bash
   just get-started
   ```

   This will install all required software and create a Python virtual environment.
   Note that you may need to install `Just` if you don't have it already.

### Making Changes

1. **Create a new branch**

   ```bash
   git checkout -b branch-type/descriptive-name
   ```

   Replace `branch-type` with one of: `release`, `update`, `feature`, `hotfix`, or `bugfix`.

2. **Make your changes**

3. **Test your changes**

   Preview the site locally:

   ```bash
   just preview-docs
   ```

4. **Format and lint your changes**

   ```bash
   just fmt-all
   ```

5. **Commit your changes**

   ```bash
   git add .
   git commit -m "Brief description of changes"
   ```

6. **Push your changes**

   ```bash
   git push -u origin branch-type/descriptive-name
   ```

7. **Open a Pull Request**

   Go to the repository on GitHub and open a pull request.

## Writing Content in Quarto

The IPA Research and Data Science Hub uses [Quarto](https://quarto.org/) for content creation and site generation. Quarto is an open-source scientific and technical publishing system built on Pandoc.

### File Structure

* Content is organized by topic area in directories
* Each directory should have an `index.qmd` file
* Use consistent naming conventions for files: lowercase, hyphenated names (e.g., `data-collection.qmd`)

### Quarto Basics

* Content is written in Markdown with Quarto extensions
* Quarto files use the `.qmd` extension
* Each file should begin with YAML frontmatter defining metadata

Example YAML frontmatter:

```yaml
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
---
```

### Special Features

Quarto supports many advanced features:

#### Callout Blocks

Use callout blocks to highlight important information:

```markdown
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

```markdown
See @sec-methodology for more details.

## Methodology {#sec-methodology}
```

#### Code Blocks with Execution

Include executable code (Python, R, etc.) with output:

````markdown
```{python}
import numpy as np
data = np.random.randn(100)
print(f"Mean: {data.mean():.2f}")
```
````

#### Tabsets

Group content into tabs:

```markdown
::: {.panel-tabset}
## Tab 1
Content for the first tab

## Tab 2
Content for the second tab
:::
```

See the [Quarto documentation](https://quarto.org/docs/guide/) for more features.

## Markdown Style Guide

We use markdownlint with custom rules to ensure consistent formatting. See our [Markdown Style Guide](docs/MARKDOWN_STYLE.md) for detailed guidelines.

Key points:

* Use ATX-style headings with a space after the `#` (e.g., `## Heading 2`)
* Use asterisks (`*`) for unordered lists, not dashes
* Include blank lines before and after headings, lists, and code blocks
* Provide alt text for all images for accessibility
* Use fenced code blocks with language specification

## Code Quality Tools

### Pre-commit Hooks

We use pre-commit hooks to ensure code quality. These run automatically when you commit changes.

Install pre-commit hooks:

```bash
pre-commit install
```

### Markdownlint

We use markdownlint-cli to ensure consistent markdown formatting:

```bash
# Lint and fix all markdown files
just fmt-markdown

# Lint and fix a specific file
just fmt-md path/to/file.qmd

# Check without fixing
just fmt-check-markdown
```

The markdownlint configuration is defined in `.markdownlint.yaml`, which is used by both VS Code and the command-line tool.

### Vale

We use Vale to check writing style and grammar:

```bash
# Run Vale on all content
vale .
```

## Pull Request Process

1. **Create a descriptive PR title**
2. **Fill out the PR template** with details about your changes
3. **Link to any related issues**
4. **Request reviews** from appropriate team members
5. **Address review feedback**
6. **Pass all automated checks**
7. **Wait for approval** before merging

## Getting Help

If you need assistance or have questions about contributing:

* Open an issue on GitHub
* Contact the GRDS team at [researchsupport@poverty-action.org](mailto:researchsupport@poverty-action.org)

Thank you for contributing to the IPA Research and Data Science Hub!
