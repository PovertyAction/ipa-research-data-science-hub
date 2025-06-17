# Custom Markdownlint Rules for Quarto

This document provides technical details about the custom markdownlint rules implemented for Quarto documents in this repository.

## Rule Files

The custom rules are defined in three JavaScript files:

1. **custom-quarto-rules.js**: Core rules for Quarto callout blocks
2. **additional-quarto-rules.js**: Rules for Quarto div/span, code blocks, diagrams, cross-references, and footnotes
3. **quarto-image-rules.js**: Specialized rules for image alt text accessibility

## Rules in Detail

### Callout Block Rules

#### quarto-callout-blocks

Validates that Quarto callout blocks follow proper syntax:

- Checks for properly formed callout blocks using pattern `::: {.callout-type}`
- Ensures callout blocks are properly closed with `:::`
- Validates that callout types are one of: note, tip, warning, caution, important
- Reports errors for unclosed callout blocks or closing markers without opening blocks

#### quarto-callout-title

Ensures Quarto callout blocks have properly formatted titles:

- Checks that callout blocks have either a `title` attribute or a heading as the first element
- Flags callout blocks without any type of title

#### quarto-collapsible-callout

Checks that collapsible Quarto callouts have proper syntax:

- Validates the `collapse` attribute has valid values (`"true"` or `"false"`)
- Reports errors for invalid collapse attribute values

#### quarto-callout-appearance

Checks that Quarto callout appearance attribute has valid values:

- Validates the `appearance` attribute is one of: default, simple, minimal
- Reports errors for invalid appearance values

#### quarto-callout-crossref

Validates that Quarto callout cross-references use correct syntax:

- Checks cross-references using the `@` syntax point to valid callout IDs
- Ensures cross-references to callouts include the proper prefix (note-, tip-, etc.)

### Additional Quarto Rules

#### quarto-div-span

Validates that Quarto div and span syntax is properly formed:

- Checks div blocks follow the pattern `::: {attributes} ... :::`
- Validates span syntax follows the pattern `[content]{attributes}`
- Reports errors for unclosed divs or empty span content

#### quarto-code-block

Ensures Quarto code blocks with attributes use correct syntax:

- Validates code blocks with attributes using ````{language}`
- Checks that code cells specify a language
- Validates cell options using the `#|` prefix have proper key-value format
- Reports errors for unclosed code blocks

#### quarto-diagram

Validates Quarto diagram blocks (Mermaid, Graphviz):

- Checks diagram blocks for proper syntax
- Supports Mermaid, Dot, and Graphviz diagram types
- Reports errors for unclosed diagram blocks

#### quarto-cross-reference

Validates Quarto cross-references:

- Checks all cross-references using the `@` syntax point to valid labels
- Validates reference types (fig, tbl, sec, eq, etc.)
- Reports references to non-existent labels

#### quarto-footnote

Validates Quarto footnote syntax:

- Checks footnote references `[^label]` have corresponding definitions `[^label]:`
- Validates inline footnotes `^[content]` have content
- Reports references to undefined footnotes

### Image Accessibility Rules

#### quarto-image-alt-text

Ensures images in Quarto documents have alternative text:

- Checks standard markdown image syntax `![alt](url)`
- Validates Quarto figure syntax with attributes `![alt](url){attributes}`
- Inspects HTML img tags for alt attributes
- Reports missing alt text or generic placeholder text
- Supports Quarto's `fig-alt` attribute for alternative text

## Using Custom Rules

These rules are enabled in the `.markdownlint.yaml` configuration file, which is used by:

- VS Code extensions for editor integration
- The markdownlint-cli tool for command line use and pre-commit hooks

The rules are used by the markdownlint-cli tool when running:

```bash
markdownlint --config .markdownlint.yaml "**/*.qmd" "**/*.md"
```

## Extending the Rules

To add new custom rules:

1. Create a new JavaScript file following the markdownlint rule module pattern
2. Export rule object(s) with `names`, `description`, and `function` properties
3. Add the file to the `customRules` list in `.markdownlint.yaml`
4. Enable the rule by adding its name to the configuration in the file
