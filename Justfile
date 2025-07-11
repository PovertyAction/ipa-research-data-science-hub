# Set the shell to use
# set shell := ["nu", "-c"]
# Set shell for Windows

set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

# Set path to virtual environment's python

venv_dir := ".venv"
python := venv_dir + if os_family() == "windows" { "/Scripts/python.exe" } else { "/bin/python3" }

# Display system information
system-info:
    @echo "CPU architecture: {{ arch() }}"
    @echo "Operating system type: {{ os_family() }}"
    @echo "Operating system: {{ os() }}"

# Clean venv
clean:
    rm -rf .venv

# Setup environment
get-started: pre-install venv

# Update project software versions in requirements
update-reqs:
    uv lock
    uv run pre-commit autoupdate

# create virtual environment
venv:
    uv sync
    uv tool install pre-commit
    uv run pre-commit install

# sync R environment, requires that R, RScript are in PATH
renv:
    RScript -e 'renv::restore()'

# Activate interactive python
ipython:
    uv run ipython

# Activate interactive R
ir:
    uv run radian

# launch jupyter lab
lab:
    uv run jupyter lab

# Preview the handbook
preview-docs:
    quarto preview

# Build the handbook
build-docs:
    quarto render

# Lint python code
lint-py:
    uv run ruff check

# Format python code
fmt-python:
    uv run ruff format

# Format a single python file, "f"
fmt-py f:
    uv run ruff format {{ f }}

# Lint sql scripts
lint-sql:
    uv run sqlmesh format

# Report vale errors for a file
vale-errors f:
    vale --filter='.Level in ["error"]' {{ f }}

# Report vale warnings for a file
vale-warnings f:
    vale --filter='.Level in ["warning"]' {{ f }}

# Report vale suggestions for a file
vale-suggestions f:
    vale --filter='.Level in ["suggestion"]' {{ f }}

# Report vale errors, warnings, and suggestions for a file
vale-file f:
    vale {{ f }}

# Report all vale errors in repository
vale-errors-all:
    vale --filter='.Level in ["error"]' --glob='*.qmd' .

# Report all vale errors in repository
vale-warnings-all:
    vale --filter='.Level in ["warning"]' --glob='*.qmd' .

# Format all markdown and config files
fmt-markdown:
    markdownlint --config .markdownlint.yaml "**/*.qmd" --fix

# Format a single markdown file, "f"
fmt-md f:
    markdownlint --config .markdownlint.yaml {{ f }} --fix

# Check format of all markdown files
fmt-check-markdown:
    markdownlint --config .markdownlint.yaml "**/*.qmd" "**/*.md"

fmt-all: lint-py fmt-python lint-sql fmt-markdown

# Create a new page from template (Linux and MacOS)
new-page dest:
    cp ./page-template.qmd {{ dest }}
    echo "Created new page at {{ dest }}"
    echo "Remember to add {{ dest }} to _quarto.yml"

# Create a git commit message using AI (requires claude command line tool)
gcauto:
    git commit -m "$(claude -p "Look at the staged git changes and create a summarizing git commit title. Only respond with the title and no affirmation.")"

# Run pre-commit hooks
pre-commit-run:
    pre-commit run

[windows]
pre-install:
    winget install Casey.Just astral-sh.uv GitHub.cli Posit.Quarto errata-ai.Vale OpenJS.NodeJS
    winget install --id=RProject.R -e
    npm install -g markdownlint-cli

[linux]
pre-install:
    brew install just uv gh vale r --force-bottle
    sudo apt update && sudo apt upgrade && sudo apt install -y nodejs npm
    npm install -g markdownlint-cli

[macos]
pre-install:
    brew install just uv gh vale r markdownlint-cli
    brew install --cask quarto
