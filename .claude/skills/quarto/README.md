# Quarto Document Generation Skill

This skill enables Claude to create professional Quarto markdown documents for analysis and reporting with HTML or Typst output formats.

## What This Skill Does

The Quarto skill provides:

- Templates for analysis reports, formal documents, and dual-format outputs
- Configuration guidance for HTML and Typst formats
- Code chunk integration for Python, R, Stata, and other languages
- Document rendering and troubleshooting support
- YAML validation and best practices

## When to Use

Invoke this skill when you need to:

- Create new Quarto markdown (.qmd) documents
- Set up HTML or Typst output formats
- Configure document rendering options
- Integrate analysis code from Python, R, or other languages
- Structure reports or analysis documentation
- Debug Quarto rendering or YAML issues
- Set up Quarto projects with multiple documents

## Skill Contents

### SKILL.md

Main skill instructions covering:

- Quarto document structure and YAML configuration
- HTML and Typst output format options
- Code chunk integration and cell options
- Document rendering workflows
- Cross-references and special features
- Troubleshooting common issues

### Templates (`assets/`)

Four ready-to-use templates:

- **template_html.qmd**: HTML analysis document with interactive features
- **template_typst.qmd**: Typst document for PDF-quality output
- **template_dual.qmd**: Document configured for both HTML and Typst
- **template_report.qmd**: Formal report structure with executive summary

Also includes:

- **_quarto.yml**: Example project configuration file

### Scripts (`scripts/`)

Three utility scripts:

- **create_quarto.py**: Generate new Quarto documents from templates
- **render_all.py**: Batch render multiple documents
- **validate_yaml.py**: Check YAML front matter syntax

### References (`references/`)

- **quarto_quick_reference.md**: Comprehensive quick reference for Quarto syntax, commands, and features

## Installation

The skill is already installed in your project at:

```text
.claude/skills/quarto/
```

## Requirements

- Quarto CLI installed (<https://quarto.org/docs/get-started/>)
- Python 3.8+ (for scripts)
- Python packages for code execution (pandas, matplotlib, etc.)
- Optional: R, Stata, or other kernels for respective code chunks

## Usage

### Activating the Skill

To activate the skill, type:

```text
/quarto
```

Or mention Quarto-related tasks in your conversation, and Claude may automatically activate the skill when appropriate.

### Creating Documents

#### Using the Script

Generate a new document from a template:

```bash
# HTML analysis document
uv run python .claude/skills/quarto/scripts/create_quarto.py \
  --output analysis/report.qmd \
  --title "Q4 Analysis" \
  --author "Your Name" \
  --format html

# Typst document for print
uv run python .claude/skills/quarto/scripts/create_quarto.py \
  --output docs/technical.qmd \
  --title "Technical Report" \
  --format typst

# Dual-format document
uv run python .claude/skills/quarto/scripts/create_quarto.py \
  --output reports/summary.qmd \
  --title "Summary Report" \
  --format dual

# Formal report
uv run python .claude/skills/quarto/scripts/create_quarto.py \
  --output formal/annual.qmd \
  --title "Annual Report" \
  --subtitle "FY 2024" \
  --format report
```

#### Ask Claude

Simply describe what you need:

```text
User: Create an HTML analysis document for my data exploration
User: Set up a Typst report with proper formatting for print
User: I need a document that renders to both HTML and PDF
```

### Rendering Documents

Render a document:

```bash
# Default format
quarto render document.qmd

# Specific format
quarto render document.qmd --to html
quarto render document.qmd --to typst

# All formats
quarto render document.qmd --to all

# Preview with live reload
quarto preview document.qmd
```

Batch render multiple documents:

```bash
uv run python .claude/skills/quarto/scripts/render_all.py \
  --pattern "reports/*.qmd" \
  --format html
```

### Validating YAML

Check YAML syntax before rendering:

```bash
# Single file
uv run python .claude/skills/quarto/scripts/validate_yaml.py document.qmd

# Multiple files
uv run python .claude/skills/quarto/scripts/validate_yaml.py \
  --pattern "*.qmd" \
  --verbose
```

## Examples

### Example 1: Creating an Analysis Report

```text
User: I need to create an HTML report for my sales data analysis with Python code

Claude: [Uses quarto skill to create HTML template with appropriate YAML configuration
and Python code chunks for data loading, visualization, and analysis]
```

### Example 2: Setting Up Typst Document

```text
User: Create a formal Typst document for our research paper

Claude: [Uses quarto skill to generate Typst template with academic formatting,
proper margins, and bibliography configuration]
```

### Example 3: Troubleshooting Rendering

```text
User: My Quarto document won't render, I'm getting YAML errors

Claude: [Uses quarto skill references to identify YAML syntax issues and suggest fixes,
then validates the corrected YAML]
```

## Output Formats

### HTML

Best for:

- Interactive web reports
- Documents with collapsible code
- Shareable analysis with embedded visualizations
- Documentation websites

Key features:

- Table of contents
- Code folding and tools
- Multiple themes
- Responsive design
- Self-contained or with external resources

### Typst

Best for:

- PDF-quality typeset documents
- Academic papers and formal reports
- Print-ready materials
- Professional documentation

Key features:

- High-quality typography
- Precise page layout
- Custom fonts and margins
- Fast rendering
- Modern LaTeX alternative

## File Structure

Recommended project organization:

```text
project/
├── .claude/
│   └── skills/
│       └── quarto/              # This skill
├── analysis/                     # Analysis documents
│   ├── 01_exploration.qmd
│   └── 02_modeling.qmd
├── reports/                      # Final reports
│   ├── summary.qmd
│   └── technical.qmd
├── _quarto.yml                   # Project configuration
├── references.bib                # Bibliography
└── data/                         # Data files
```

## Customization

### Modify Templates

Edit template files in `assets/` to match your organization's standards:

- Add custom headers/footers
- Include institutional branding
- Set default themes and styles
- Pre-configure common code chunks

### Adjust Scripts

Customize the Python scripts in `scripts/`:

- Add new template types
- Modify validation rules
- Extend batch rendering options
- Add project-specific workflows

### Update References

Expand `references/quarto_quick_reference.md` with:

- Domain-specific examples
- Common code patterns for your work
- Organization-specific conventions
- Additional troubleshooting tips

## Troubleshooting

### "quarto: command not found"

Install Quarto from <https://quarto.org/docs/get-started/>

### YAML Syntax Errors

- Use spaces (not tabs) for indentation
- Ensure colons have space after them: `key: value`
- Quote strings with special characters
- Check bracket/brace matching

Run validation:

```bash
uv run python .claude/skills/quarto/scripts/validate_yaml.py document.qmd --verbose
```

### Code Execution Failures

- Verify required packages are installed
- Check code chunk syntax (triple backticks + language)
- Ensure kernels are available (jupyter for Python)
- Use `#| error: true` to continue on errors

### Typst Output Issues

- Ensure Quarto 1.4+ is installed
- Check font availability for custom fonts
- Use `keep-typ: true` to debug intermediate files

### Preview Not Working

```bash
# Check Quarto installation
quarto check

# Try different port
quarto preview document.qmd --port 8080
```

## Best Practices

1. **Start with Templates**: Use provided templates as starting points
2. **Validate Early**: Check YAML before adding content
3. **Test Incrementally**: Render frequently during development
4. **Use Project Config**: Set common options in `_quarto.yml`
5. **Version Control**: Commit `.qmd` files, not rendered outputs
6. **Cache Expensive Code**: Use `cache: true` for long computations
7. **Relative Paths**: Keep documents portable with relative file paths
8. **Meaningful Labels**: Use descriptive labels for cross-references

## Resources

- **Quarto Documentation**: <https://quarto.org/docs/>
- **HTML Format Guide**: <https://quarto.org/docs/output-formats/html-basics.html>
- **Typst Format Guide**: <https://quarto.org/docs/output-formats/typst.html>
- **Authoring Guide**: <https://quarto.org/docs/authoring/>
- **Gallery**: <https://quarto.org/docs/gallery/>

## Contributing

To improve this skill:

1. Add new templates to `assets/`
2. Create additional utility scripts in `scripts/`
3. Expand the quick reference in `references/`
4. Update SKILL.md with new patterns or troubleshooting tips
5. Share your customizations with the team

## Version History

- v1.0 (2025-11-05): Initial creation with HTML and Typst templates, utility scripts, and comprehensive documentation
