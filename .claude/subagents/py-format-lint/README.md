# Python Format & Lint Subagent

Automatically format and lint Python code using ruff through the project's just commands.

## Purpose

This subagent ensures Python code quality by:

- Formatting code with ruff (Black-compatible)
- Auto-fixing linting issues (imports, style, simple bugs)
- Reporting issues requiring manual intervention
- Providing guidance on how to fix remaining issues

## Usage

This subagent is designed to be invoked proactively by Claude Code whenever Python code is written or modified.

### Automatic Invocation

Claude Code should automatically use this subagent:

- After creating new Python files
- After modifying existing Python files
- When linting errors are detected
- Before committing changes

### Manual Invocation

You can also invoke this subagent manually when needed.

## What It Does

1. Runs `just fmt-python` to format all Python code
2. Runs `just lint-python` to check and auto-fix linting issues
3. Reports any remaining issues with guidance on how to fix them
4. Categorizes issues by severity (F > E > D > W > SIM)

## Project Configuration

This project uses ruff with the following key settings:

- Line length: 88 characters
- Target: Python 3.12+
- Selected rules: F, E, W, I, D, UP, SIM
- Some docstring rules disabled: D105, D100, D104, D203, D213
- Auto-fix enabled by default

## Common Issues

The most common remaining issues after auto-fixing:

1. **D400/D415**: Docstrings should end with periods
2. **D401**: Docstrings should use imperative mood
3. **D103**: Missing docstrings in public functions
4. **F841**: Unused local variables
5. **SIM102**: Nested if statements can be simplified

See SUBAGENT.md for detailed guidance on fixing these issues.

## Integration

This subagent integrates with:

- **just fmt-python** - Python formatting command
- **just lint-python** - Python linting command
- **uv** - Python environment and package manager
- **ruff** - Fast Python linter and formatter
- **pre-commit** - Git pre-commit hooks

## Files Affected

The subagent will process Python files in:

- `src/` - Main source code
- `.claude/skills/*/scripts/` - Skill helper scripts
- `.claude/subagents/*/` - Subagent Python files
- `tests/` - Test files

## Benefits

- **Consistent code style** across the entire project
- **Automatic fixing** of common issues
- **Faster development** by catching issues early
- **Better code quality** through enforced standards
- **Reduced cognitive load** by automating formatting and linting
