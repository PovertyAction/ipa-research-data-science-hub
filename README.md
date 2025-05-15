# IPA Research and Data Science Hub

Welcome to IPA's Research and Data Science Hub! This repository hosts and centralizes our organization's research and data-oriented resources.

> [!NOTE]
> This repository is still work in progress. We are actively developing and updating the contents and site functionalities. Please reach out to GRDS at [researchsupport@poverty-action.org](researchsupport@poverty-action.org) if you have any questions/feedback for the hub.

## Table of contents

* [Repository structure](#repository-structure)
* [Setup](#setup)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)

## Repository structure

### Branching strategy

* The `main` branch is the live and most up-to-date version of the Hub, publicly available to all IPA staff and external users.
* Use `release` branches for new content that will be published/released in the short term. It can also include potential topics and ideas worth discussing (both from GRDS and non-GRDS contributors).
* Use `update` branches to update/modify content that is already published in the Hub.
* Use `feature` branches for modifications to the hub's infrastructure and scaffolding (e.g., the site's theme, layout, navigation, hierarchy, content blocks, prototypes, etc.).
* Use `hotfix` branches for critical/time sensitive issues affecting the live version of the Hub. These must be prioritized, fixed, and merged into the `main` branch ASAP.
* Use `bugfix` branches for less urgent fixes that must be resolved, but are not as time-sensitive to be considered hotfixes.

## Setup

### Software requirements

Development relies on the following software

* `winget` (Windows) or `homebrew` (MacOS/Linux) or `snap` (Linux) for package management and installation
* `git` for source control management
* `just` for running common command line patterns
* `uv` for installing Python and managing virtual environments
* `R` for code using R for statistical analysis and data visualization
* `Stata` for code using Stata for statistical analysis and data visualization
* `vale` for checking writing style and grammar
* `Quarto` for rendering the website
* `pre-commit` for running pre-commit hooks to ensure code quality and consistency of the codebase

This repository uses a `Justfile` for collecting common command line actions that we run
to set up the computing environment and build the assets of the handbook. Note that you
should also have Git installed

To get started, make sure you have `Just` installed on your computer by running the
following from the command line:

| Platform  | Commands                                                                                  |
| --------- | ----------------------------------------------------------------------------------------- |
| Windows   | `winget install Casey.Just` |
| Mac/Linux | `brew install just`                                                |

This will make sure that you have the latest version of `Just`.

* We use `Just` in order to make it easier for all IPA users to be productive with data
  and technology systems. The goal of using a `Justfile` is to help make the end goal of
  the user easier to achieve without needing to know or remember all of the technical
  details of how we get to that goal.
* We use `uv` to help ease use of Python. `uv` provides a global system for creating and
  building computing environments for Python.
* We also recommend using in Integrated Development Environment (IDE).
  Preferred options are `VS Code` or `Positron`.
* We use `vale` to check writing style and grammar. `vale` is a command line tool that
  checks your writing style and grammar against a set of rules. It is used to ensure that
  the content in the Hub is consistent and easy to read.
* We use `Quarto` to render the website. `Quarto` is a command line tool that allows you
  to render documents and websites from Markdown, Jupyter Notebooks, and other formats.
  It is used to generate the HTML files that are served by the Hub.
* We use `pre-commit` to run pre-commit hooks to ensure code quality and consistency of
  the codebase. `pre-commit` is a framework for managing and maintaining multi-language
  pre-commit hooks. It is used to ensure that the code in the Hub is consistent and
  follows best practices.

### Installation

As a shortcut, if you already have `Just` installed, you can run the following to
install required software and build a python virtual environment that is used to build
the handbook pages:

```bash
just get-started
```

This `Just` target will install the required software and build a Python virtual environment.

Note: you may need to restart your terminal and IDE after running the command above to activate
the installed software.

If working in a Linux environment, you may need to follow installation instructions for Quarto
[here](https://quarto.org/docs/get-started/).

For Stata, you will need to obtain the Stata installation files along with an active license.

We also recommend installing the following optional extensions in VS Code (or Positron):

* [Quarto](https://marketplace.visualstudio.com/items?itemName=quarto.quarto)
* [vscode-markdownlint](https://marketplace.visualstudio.com/items?itemName=davidanson.vscode-markdownlint)
* [charliermarsh.ruff](https://marketplace.visualstudio.com/items?itemName=charliermarsh.ruff)
* [bierner.markdown-preview-github-styles](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-preview-github-styles)
* [chrischinchilla.vale-vscode](https://marketplace.visualstudio.com/items?itemName=chrischinchilla.vale-vscode)
* [posit.air-vscode](https://marketplace.visualstudio.com/items?itemName=posit.air-vscode)
* [tamasfe.even-better-toml](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)

### Rendering the Hub locally

To preview the Hub locally, you can run the following command:

```bash
just preview-docs
```

This is a `Just` target for `quarto preview` that will build the site and start a local server.

To fully build/render the Hub locally, you can run the following command:

```bash
just build-docs
```

This is a `Just` target for `quarto render` that will build the site and generate the HTML files.

## Contributing

We welcome contributions from all IPA staff members! Please read our Contributing Guidelines (link) for more details on our code of conduct and development process. Follow these steps if you want to contribute using GitHub:

1. Fork the repository
2. Create a new branch

    ```bash
    git checkout -b feature/amazing-addition
    ```

3. Draft your changes
4. Commit your changes, adding a message describing your contribution to the Hub

    ```bash
    git commit -m 'Add amazing feature'
    ```

5. Push to the branch

    ```bash
    git push origin feature/amazing-addition
    ```

6. Open a Pull Request

### "Edit this page"

[TODO]

### Report an issue

[TODO]

### Submit a contribution

[TODO]

## Style Guide

[TODO]

## License

The IPA Research and Data Science Hub is licensed under a [CC-BY license](./LICENSE.txt).

## Contact

The IPA Research and Data Science Hub is maintained by the Global Research and Data Science (GRDS) team. For questions, feedback, or suggestions, please reach out to us at [researchsupport@poverty-action.org](researchsupport@poverty-action.org).
