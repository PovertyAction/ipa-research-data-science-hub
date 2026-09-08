# Tutorial / how-to pattern (archetype B)

The Carpentries-derived structure used across the site's hands-on pages ---
`data-science/data-analysis/*`, `data-science/data-visualization/*`,
`data-science/webscraping/*`, `software/shell/*`, `software/git/*`,
`software/python/{coding,data-processing}`, and `*/how-to-*`. Use it when the
page teaches by doing (tutorial) or walks a competent reader through a concrete
task (how-to). The canonical example is
`data-science/data-analysis/for-loops.qmd`.

For frontmatter and shared formatting (headings, code blocks, tables, images),
see `references/page-anatomy.md` --- this file covers only what is distinct to
the archetype.

## Page skeleton

In order, after the frontmatter:

1. **Recognition and Attribution** --- a collapsed `callout-note` crediting the
   source material. Required whenever the page adapts the Carpentries or another
   licensed source; it replaces the prose page's attribution footnote.

   ```markdown
   :::{.callout-note collapse="true" title="Recognition and Attribution"}

   This page is adapted from the [Software Carpentry lesson](https://example.org/lesson),
   Copyright (c) [The Carpentries](https://carpentries.org/). The original material
   is licensed under the [Creative Commons Attribution 4.0 International License
   (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

   **Changes made:** Content has been modified and expanded by Innovations for
   Poverty Action (IPA) to include IPA-specific examples and context.

   **Original citation:**
   Author, et al. (YEAR). *Title*. Publisher/DOI.
   :::
   ```

2. **Learning Objectives** --- a `callout-note` with a `## Learning Objectives`
   title and a bullet list of what the reader will be able to do. These usually
   mirror the `abstract`.

   ```markdown
   ::: {.callout-note}

   ## Learning Objectives

   - Explain what for loops are normally used for.
   - Trace the execution of a simple loop and state the variable values each iteration.
   - Write for loops that use the accumulator pattern.
   :::
   ```

3. **Body sections** --- full-sentence `##` headings that restate the learning
   point, not noun-phrase headings.
   (`## A for loop is made up of a collection, a    loop variable, and a body`,
   not `## For loop structure`.) Each section interleaves short explanation with
   the input/output code idiom below.

4. **Exercises** --- a `callout-note` titled `## Exercise: <name>`, containing a
   collapsible `callout-tip` solution:

   ```markdown
   ::: {.callout-note}

   ## Exercise: Classifying Errors

   Is an indentation error a syntax error or a runtime error?

   ::: {.callout-tip collapse="true"}

   ## Solution

   An IndentationError is a syntax error. Programs with syntax errors cannot start.
   :::
   :::
   ```

5. **Key Points** --- the closer: a `callout-important` titled `## Key Points`
   summarizing the takeaways as a bullet list. Every archetype-B page ends here
   (in place of the prose page's References section).

   ```markdown
   ::: {.callout-important}

   ## Key Points

   - A for loop executes commands once for each value in a collection.
   - A for loop is made up of a collection, a loop variable, and a body.
   - Indentation is always meaningful in Python.
   :::
   ```

## Code: the input/output idiom

Show commands and their results as a static code block followed by a companion
`output` block --- do not use live `{python}` chunks unless the page genuinely
renders computed output (e.g. plots). The command block's language is the tool
(`python`, `bash`, `stata`, `powershell`); the result block is always `output`
(or `error` for an expected error):

````markdown
```python
for number in [2, 3, 5]:
    print(number)
```

```output
2
3
5
```
````

For CLI/how-to pages, the command block is `bash` (git, shell) or `powershell`,
followed by its `output` block. Reference commands, flags, and variable names
inline with backticks (`` `git branch` ``, `` `--force` ``).

## Notes

- A how-to page named `how-to-*` is still authored in this archetype (Learning
  Objectives + Key Points), even though its Diátaxis intent is "how-to" --- keep
  the how-to focus (directions toward a goal, not a teaching lesson) while using
  this structure.
- Public-first still applies: IPA-specific context goes in a `callout-note` (see
  `references/page-anatomy.md`).
