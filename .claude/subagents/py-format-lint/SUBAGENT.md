---
name: py-format-lint
description: Automatically format and lint Python code using ruff. This subagent enforces code quality by running formatting and auto-fixing linting issues. Use this after writing or modifying Python files, or when you encounter linting errors that need to be fixed.
---

# Python Format & Lint Subagent

This subagent automatically formats and lints Python code using ruff, ensuring consistent code quality across the project.

## When to Use This Subagent

Use this subagent in the following scenarios:

1. **After writing new Python code** - Format and lint newly created Python files
2. **After modifying existing Python code** - Ensure modifications maintain code quality
3. **When linting errors are detected** - Automatically fix auto-fixable issues
4. **Before committing changes** - Validate all Python code passes quality checks
5. **During code reviews** - Ensure code meets project standards

## What This Subagent Does

This subagent will:

1. **Format Python code** using `just fmt-python` (runs `uv run ruff format`)
2. **Auto-fix linting issues** using `just lint-python` (runs `uv run ruff check --fix`)
3. **Report remaining issues** that require manual intervention
4. **Provide specific guidance** on how to fix any remaining linting errors

## Task Instructions

When this subagent is invoked, follow these steps:

### Step 1: Identify Target Files

Determine which Python files need formatting and linting:

- If specific files are mentioned, work on those files
- If no files are specified, format and lint all Python files in the project
- Check the `src/` directory and any other Python code locations

### Step 2: Format Python Code

Run the formatting command:

```bash
just fmt-python
```

This runs `uv run ruff format` which will:

- Format all Python files according to the project's ruff configuration
- Fix indentation, line length, quote styles, etc.
- Apply Black-compatible formatting

### Step 3: Auto-Fix Linting Issues

Run the linting command with auto-fix:

```bash
just lint-python
```

This runs `uv run ruff check` which will:

- Check for all configured linting rules (F, E, W, I, D, UP, SIM)
- Automatically fix issues where possible (imports, simple style issues, etc.)
- Report issues that require manual intervention

### Step 4: Report Results

After running the commands:

1. **Count fixed issues** - Report how many issues were auto-fixed
2. **List remaining issues** - Show any linting errors that need manual fixes
3. **Provide guidance** - For each remaining issue, explain:
   - What the issue is
   - Why it matters
   - How to fix it (with code examples if helpful)
4. **Suggest next steps** - If issues remain, suggest whether they should be fixed or ignored

### Step 5: Handle Manual Fixes (if needed)

For issues that can't be auto-fixed:

1. **Prioritize by severity**:
   - F (Pyflakes) - Errors, undefined names, unused imports (HIGH)
   - E (pycodestyle) - PEP 8 violations (MEDIUM)
   - D (docstrings) - Missing or malformed docstrings (LOW)
   - W (warnings) - Style warnings (LOW)
   - SIM (simplify) - Code simplification suggestions (LOW)

2. **Fix high-priority issues** - Address undefined names, errors, unused imports

3. **Consider ignoring low-priority issues** - For existing code, docstring issues can often be added later

## Configuration

This project uses the following ruff configuration (from `pyproject.toml`):

```toml
[tool.ruff]
line-length = 88
fix = true
target-version = "py312"

[tool.ruff.lint]
select = ["F", "E", "W", "I", "D", "UP", "SIM"]
ignore = [
    "W191", "E111", "E114", "E117", "D206", "D300", "E501",
    "D105", "D100", "D104", "SIM110", "TRY003",
    "D205", "D203", "D213"
]
```

Key points:

- Line length: 88 characters
- Auto-fix enabled by default
- Docstring rules are partially disabled (D105, D100, D104, D203, D213)
- Some docstring errors (D400, D401, D415) are NOT disabled and must be fixed

## Common Issues and Fixes

### D400/D415: First line should end with a period

**Issue**: Docstrings must end with proper punctuation

**Fix**:

```python
# Before
def my_function():
    """Does something"""
    pass

# After
def my_function():
    """Does something."""
    pass
```

### D401: First line should be in imperative mood

**Issue**: Docstrings should use imperative mood (command form)

**Fix**:

```python
# Before
def validate():
    """Validates the data."""
    pass

# After
def validate():
    """Validate the data."""
    pass
```

### D103: Missing docstring in public function

**Issue**: Public functions need docstrings

**Fix**:

```python
# Before
def main():
    pass

# After
def main():
    """Run the main program."""
    pass
```

### F841: Local variable assigned but never used

**Issue**: Variable is defined but not used

**Fix**:

```python
# Before
result = expensive_function()
return True

# After
_ = expensive_function()  # Or remove if not needed
return True
```

### SIM102: Use a single if statement instead of nested if

**Issue**: Nested if statements can be combined

**Fix**:

```python
# Before
if condition1:
    if condition2:
        do_something()

# After
if condition1 and condition2:
    do_something()
```

## Example Output

When reporting results, structure your output like this:

```markdown
✓ Formatted X Python files
✓ Auto-fixed Y linting issues

Remaining issues requiring manual intervention:

src/app.py:
  - Line 45 (D400): First line should end with a period
    Current: """Does something"""
    Fix: Add period at the end of the docstring

  - Line 89 (F841): Local variable 'result' is assigned to but never used
    Fix: Remove the variable or use it in the return statement

All critical issues (F, E) have been resolved.
Remaining issues are documentation-related (D) and can be addressed incrementally.
```

## Integration with Development Workflow

This subagent integrates with the project's existing tools:

- **just fmt-python** - Wraps `uv run ruff format`
- **just lint-python** - Wraps `uv run ruff check`
- **just fmt-all** - Runs Python, SQL, and markdown formatting
- **just pre-commit-run** - Runs all pre-commit hooks including ruff

## Notes

- This subagent uses the project's existing just commands for consistency
- All changes are made in-place (files are modified directly)
- Review changes after running to ensure they're correct
- For large numbers of docstring issues in existing code, consider running with `--add-noqa` to defer fixes
- The project configuration has `fix = true` by default, so `ruff check` will auto-fix when possible
