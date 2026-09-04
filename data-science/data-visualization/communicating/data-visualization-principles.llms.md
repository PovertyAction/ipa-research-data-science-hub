Explanation

# Data Visualization Principles

The design principles behind clear charts, including decluttering, how human perception works, Tufte’s data-ink rule, and responsible color, so that visuals are understood at a glance and never mislead. For building these charts in code, see the Python lessons in this section.

------------------------------------------------------------------------

## Authors

- Yuri M. Leomo
- Daniela López
- [Ana Gabriela Tamayo](https://poverty-action.org/people/ana-tamayo-alatriste)

## Contributors

- [Kelly Montaño](https://poverty-action.org/people/kelly-montano)

## Last Modified

- September 4, 2026

## License

- [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)

> **TIP:**
>
> - **Clarity comes from removing clutter, not adding decoration.** Most charts improve when unnecessary elements are deleted.
> - **Effective charts are designed around human perception.** Position, length, and a single highlight color communicate more than legends or three-dimensional effects.
> - **A chart is an argument.** Honest axes, clear labels, and color-blind-friendly palettes keep that argument fair.

## What makes a visualization effective

An effective chart is not the most elaborate one. It is the one that allows the reader to reach the correct conclusion with the least effort. Every element either supports that goal or works against it; no ink on the page is neutral. Three ideas underlie almost every rule that follows:

- **Reduce the reader’s effort.**
- **Work with human perception rather than against it.**
- **Never distort what the data show.**

## Decluttering

Anything that carries no information should be removed: gridlines, heavy borders, background shading, redundant labels, and decorative icons. Tufte (2001) called these elements “chart junk,” marks that cost the reader attention and return nothing in exchange.

> **TIP:**
>
> - Remove gridlines, or fade them to a light gray so they recede.
> - Delete chart borders and background fills.
> - Replace the legend with direct labels on lines or bars where possible.
> - Round numbers to the precision the reader actually needs.
>
> The test for any element: if removing it costs the reader no information, it should be left out.

## Working with human perception

A chart is not read pixel by pixel. The visual system groups and prioritizes automatically, and two well-established sets of principles describe how.

**Gestalt grouping.** The eye reads items that are close together (proximity), that share a color or shape (similarity), or that sit inside a common boundary (enclosure) as belonging to the same group. Related elements should therefore be placed together, a single category should carry a single color, and the portion of the chart meant to be read as a unit should be visually enclosed.

**Preattentive attributes.** A small set of properties, including hue, size, orientation, shape, and saturation, are processed within a fraction of a second, before conscious attention. A single number set in bold red within a table of black numbers is located instantly. These cues should be reserved for the one element that most deserves attention; when everything is emphasized, nothing is.

## Visual and typographic hierarchy

Not every element on a page deserves equal weight. A strong design signals what matters most before the reader has to search for it.

**Visual hierarchy** uses size, position, and contrast so the most important element, such as a headline figure, is seen first.

**Typographic hierarchy** does the same with type: a large heading reads as primary, subheadings as secondary, and body text as detail.

**White space** separates groups and gives the eye a path to follow, rather than a wall of clutter.

A short annotation can reinforce this, pointing to what matters most in a complex figure.

> **NOTE:**
>
> Tufte’s (2001) measure of efficiency is the **data-ink ratio**, the proportion of a chart’s ink that represents data. The guidance follows directly from it: show the data, maximize data-ink, erase non-data and redundant ink, and then revise. Bars, points, and lines should dominate the figure; axes and labels should remain quiet; everything else should be removed.

## Common problems and how to correct them

A handful of recurring flaws account for most weak charts. The examples below are drawn from widely taught before-and-after cases (Schwabish 2014).

- **Truncated axes.** Because bars encode length, their baseline must sit at zero, or differences will be exaggerated. Line charts, which encode position, allow more flexibility, but any non-zero baseline should be stated.
- **Unnecessary three-dimensional effects.** Depth on bars and pies carries no data and distorts the values the reader is asked to compare. Two-dimensional data should stay in two dimensions.
- **Spaghetti plots.** When too many lines obscure the trend, the solution is small multiples, or highlighting a single line while graying out the rest.
- **Jargon and dense labels.** Abbreviations that are clear to the analyst are often opaque to the audience. Labels should be direct, and the title should state the point.

> **WARNING:**
>
> Truncated axes, cherry-picked ranges, combined chart types, and inconsistent scales can all make data appear to say something they do not. Clarity and honesty are the same standard; a chart that misleads has failed, however attractive it may be.

## Using color responsibly

Color is a tool for directing attention and encoding meaning, not a decorative one. The scheme should match the data:

| Scheme | Use for… | How |
|----|----|----|
| Qualitative | Unordered categories | Distinct hues, ideally six or seven max |
| Sequential | Values from low to high | A single hue, light to dark |
| Diverging | Data with a meaningful midpoint | Two hues meeting at a neutral center |

A practical discipline is to begin with every element in gray and add color only where it carries meaning, which keeps the palette purposeful.

> **NOTE:**
>
> About 1 in 12 people has a color-vision deficiency, and documents are frequently printed in grayscale. Red-green should not be the only distinction between categories; blue-orange or blue-red pairings are safer. The palette should remain legible without color, and figures should include clear titles, axis labels, and alternative text. Useful tools include [ColorBrewer](https://colorbrewer2.org/), [Viz Palette](https://projects.susielu.com/viz-palette), and [Adobe Color](https://color.adobe.com/). The Python lesson on labels, scales, and customization demonstrates how to apply color-blind-safe palettes in code.

## Bringing the principles together

The workflow is short and repeatable:

1.  Define the single point.
2.  Choose a form that shows it.
3.  Remove everything that carries no information.
4.  Use one preattentive cue to guide the eye.
5.  Confirm that axes and colors are honest and accessible.

Revision then does the rest, since the first draft of a chart is rarely the clearest. For guidance on which chart fits a given message, see [Choosing the Right Chart](../../../data-science/data-visualization/communicating/choosing-the-right-chart.llms.md).

> **TIP:**
>
> In monitoring and evaluation trainings with government partners, IPA teams have found that the highest-impact edits are subtractive. A cluttered dashboard chart, with a truncated axis, a distracting legend, and three competing colors, was redrawn as a single-series bar chart with a zero baseline, direct labels, and one highlight color on the bar that mattered. The data did not change, but partners could then identify the underperforming site in seconds.

## References

Knaflic, Cole Nussbaumer. 2015. *Storytelling with Data: A Data Visualization Guide for Business Professionals*. Hoboken, NJ: Wiley. https://www.storytellingwithdata.com/.

Schwabish, Jonathan A. 2014. “An Economist’s Guide to Visualizing Data.” *Journal of Economic Perspectives* 28 (1): 209–34. https://doi.org/10.1257/jep.28.1.209.

Tufte, Edward R. 2001. *The Visual Display of Quantitative Information*. 2nd ed. Cheshire, CT: Graphics Press.

United Nations Economic Commission for Europe. 2009. *Making Data Meaningful, Part 2: A Guide to Presenting Statistics*. Geneva: UNECE. https://unece.org/statistics/documents/2009/01/making-data-meaningful.

## Additional Resources

Brewer, Cynthia A. *ColorBrewer 2.0: Color Advice for Cartography*. <https://colorbrewer2.org/>.

Lu, Susie. *Viz Palette*. <https://projects.susielu.com/viz-palette>.

Back to top
