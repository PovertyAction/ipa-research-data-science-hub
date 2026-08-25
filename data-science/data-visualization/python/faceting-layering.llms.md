Tutorial

# Faceting and Layering

Create small multiples (faceted plots) to compare across categories. Layer multiple marks to build rich visualizations. Combine techniques for comprehensive data stories.

------------------------------------------------------------------------

## Authors

- [Ishmail Baako](https://poverty-action.org/people/ishmail-baako)
- [Niall Keleher](https://poverty-action.org/people/niall-keleher)

## Contributors

- [The Carpentries](https://carpentries.org/)

## Last Modified

- August 25, 2026

## License

- [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)

> **NOTE:**
>
> - Create faceted plots (small multiples) with `.facet()`
> - Understand when to use faceting vs. color/aesthetics
> - Layer multiple marks to create rich visualizations
> - Combine faceting and layering for complex displays
> - Design effective multi-panel figures for research

## The Power of Small Multiples

**Small multiples** (also called faceting or trellis plots) show the same visualization repeated across different subsets of data. Edward Tufte, the data visualization expert, called them “the best design solution” for comparing categories.

Why are they so effective?

- **Same scale**: Easy to compare across panels
- **Reduced clutter**: Each panel is simpler than cramming everything into one plot
- **Pattern detection**: Similarities and differences become obvious
- **Scalability**: Works with many categories

## Setting Up

``` python
import seaborn as sns
import seaborn.objects as so
import pandas as pd
import numpy as np

# Load data
penguins = sns.load_dataset("penguins").dropna()
tips = sns.load_dataset("tips")
```

## Basic Faceting with .facet()

The `.facet()` method creates small multiples:

``` python
# Compare across species - three separate panels
(
    so.Plot(penguins, x="bill_length_mm", y="bill_depth_mm")
    .add(so.Dot())
    .facet(col="species")
    .label(
        title="Bill Dimensions Across Penguin Species",
        x="Bill Length (mm)",
        y="Bill Depth (mm)"
    )
)
```

This creates three side-by-side plots, one for each species.

### Faceting by Rows

``` python
# Stack panels vertically
(
    so.Plot(penguins, x="bill_length_mm", y="bill_depth_mm")
    .add(so.Dot())
    .facet(row="species")
    .label(
        title="Bill Dimensions Across Penguin Species",
        x="Bill Length (mm)",
        y="Bill Depth (mm)"
    )
)
```

### Two-Dimensional Faceting

Create a grid of panels:

``` python
# Facet by both species (columns) and sex (rows)
(
    so.Plot(penguins, x="flipper_length_mm", y="body_mass_g")
    .add(so.Dot())
    .facet(col="species", row="sex")
    .label(
        title="Penguin Body Measurements by Species and Sex",
        x="Flipper Length (mm)",
        y="Body Mass (g)"
    )
)
```

This creates a 2×3 grid showing all combinations of sex and species.

## Faceting vs. Color: When to Use Each

You can encode a variable either with **color** or with **facets**. How do you choose?

### Use Color When

- You have 2-5 categories
- You want to see overlap and direct comparison
- Space is limited
- Categories are the main story

``` python
# Using color - good for seeing overlap
(
    so.Plot(penguins, x="bill_length_mm", y="bill_depth_mm", color="species")
    .add(so.Dot())
    .label(title="Bill Dimensions (Color by Species)")
)
```

### Use Facets When

- You have many categories (\>5)
- Plots are too cluttered with color
- You want to see patterns within each category clearly
- You’re comparing distributions

``` python
# Using facets - clearer for each category
(
    so.Plot(penguins, x="bill_length_mm", y="bill_depth_mm")
    .facet(col="species")
    .add(so.Dot())
    .label(title="Bill Dimensions (Faceted by Species)")
)
```

### Why Not Both?

You can combine faceting and color for even more dimensions:

``` python
# Facet by species, color by sex
(
    so.Plot(penguins, x="flipper_length_mm", y="body_mass_g", color="sex")
    .facet(col="species")
    .add(so.Dot())
    .label(
        title="Body Measurements: Species (panels) and Sex (colors)",
        x="Flipper Length (mm)",
        y="Body Mass (g)",
        color="Sex"
    )
)
```

## Research Example: Multi-Site Comparison

Imagine comparing program outcomes across different implementation sites:

``` python
# Create multi-site program data
np.random.seed(42)
sites = ['Site A', 'Site B', 'Site C', 'Site D']
n_per_site = 50

site_data = pd.DataFrame({
    'site': np.repeat(sites, n_per_site),
    'baseline_score': np.concatenate([
        np.random.normal(50, 10, n_per_site),
        np.random.normal(48, 12, n_per_site),
        np.random.normal(52, 8, n_per_site),
        np.random.normal(49, 11, n_per_site)
    ]),
    'endline_score': np.concatenate([
        np.random.normal(65, 10, n_per_site),  # Good improvement
        np.random.normal(55, 12, n_per_site),  # Modest improvement
        np.random.normal(70, 8, n_per_site),   # Great improvement
        np.random.normal(58, 11, n_per_site)   # Modest improvement
    ]),
    'group': np.tile(['Treatment', 'Control'], n_per_site * 2)
})

# Visualize impact across sites
(
    so.Plot(site_data, x="baseline_score", y="endline_score", color="group")
    .facet(col="site")
    .add(so.Dot(alpha=0.5))
    .add(so.Line(), so.PolyFit(order=1))  # Add trend line
    .label(
        title="Program Impact Across Implementation Sites",
        x="Baseline Score",
        y="Endline Score",
        color="Group"
    )
)
```

Each panel shows one site, making it easy to compare program effectiveness across locations.

## Layering Multiple Marks

We’ve seen simple layering before, but let’s explore more complex combinations:

### Dots + Lines

Show both data and trend:

``` python
# Create time series data
months = pd.date_range('2023-01', periods=12, freq='M')
monthly_data = pd.DataFrame({
    'month': months,
    'value': [45, 48, 52, 55, 58, 62, 65, 68, 71, 74, 77, 80]
})

(
    so.Plot(monthly_data, x="month", y="value")
    .add(so.Line(linewidth=2, color="steelblue"))
    .add(so.Dot(pointsize=8, color="steelblue"))
    .label(
        title="Monthly Program Enrollment Trend",
        x="Month",
        y="Number of Participants"
    )
)
```

### Bars + Error Bars

Show summaries with uncertainty:

``` python
# Summary data with confidence intervals
summary_data = pd.DataFrame({
    'category': ['Group A', 'Group B', 'Group C'],
    'mean': [75, 82, 68],
    'lower': [70, 78, 63],
    'upper': [80, 86, 73]
})

(
    so.Plot(summary_data, x="category")
    .add(so.Bar(alpha=0.7, color="steelblue"), y="mean")
    .add(so.Dash(width=0.5), ymin="lower", ymax="upper")
    .label(
        title="Mean Scores with 95% Confidence Intervals",
        x="Group",
        y="Score"
    )
)
```

### Scatter + Statistical Fit

Raw data with regression line:

``` python
(
    so.Plot(penguins, x="flipper_length_mm", y="body_mass_g")
    .add(so.Dot(alpha=0.5, color="gray"))
    .add(so.Line(color="red"), so.PolyFit(order=1))
    .label(
        title="Flipper Length vs Body Mass (with Linear Fit)",
        x="Flipper Length (mm)",
        y="Body Mass (g)"
    )
)
```

## Combining Faceting and Layering

The real power comes from combining these techniques:

``` python
# Complex research visualization
(
    so.Plot(penguins, x="bill_length_mm", y="bill_depth_mm", color="species")
    .facet(col="island")
    .add(so.Dot(alpha=0.6))
    .add(so.Line(linewidth=1.5), so.PolyFit(order=1))
    .label(
        title="Bill Dimensions by Species Across Islands (with Trend Lines)",
        x="Bill Length (mm)",
        y="Bill Depth (mm)",
        color="Species"
    )
)
```

This shows:

- Data points (dots)
- Trends (lines)
- Species (colors)
- Islands (facets)

That’s a lot of information clearly organized!

## Distribution Comparisons

Faceting is excellent for comparing distributions:

``` python
# Compare distributions across categories
(
    so.Plot(penguins, x="body_mass_g")
    .facet(col="species")
    .add(so.Bars(), so.Hist(bins=20))
    .label(
        title="Body Mass Distributions by Species",
        x="Body Mass (g)",
        y="Count"
    )
)
```

## Advanced: Wrapping Facets

When you have many categories, wrap them into multiple rows:

``` python
# Create data with many categories
many_categories = pd.DataFrame({
    'value': np.random.randn(600),
    'category': np.repeat([f'Cat {i}' for i in range(1, 13)], 50)
})

(
    so.Plot(many_categories, x="value")
    .facet("category", wrap=4)  # 4 columns, wrap to next row
    .add(so.Bars(), so.Hist())
    .label(title="Distributions Across 12 Categories")
)
```

## Real Research Example: Impact Evaluation

Let’s create a comprehensive impact evaluation figure:

``` python
# Create realistic program evaluation data
np.random.seed(123)
time_points = [0, 3, 6, 9, 12]
sites = ['Rural North', 'Rural South', 'Urban East']

eval_data = []
for site in sites:
    for group in ['Control', 'Treatment']:
        for time in time_points:
            n_obs = 30
            if group == 'Control':
                mean = 50 + time * 0.5  # Modest improvement
            else:
                mean = 50 + time * 1.5  # Better improvement

            values = np.random.normal(mean, 8, n_obs)
            for val in values:
                eval_data.append({
                    'site': site,
                    'group': group,
                    'month': time,
                    'outcome': val
                })

eval_df = pd.DataFrame(eval_data)

# Create publication-quality figure
(
    so.Plot(eval_df, x="month", y="outcome", color="group")
    .facet(col="site")
    .add(so.Dots(alpha=0.2, pointsize=3))  # Individual observations
    .add(so.Line(linewidth=2.5), so.Agg())  # Mean trajectory
    .add(so.Band(alpha=0.2), so.Est())      # Confidence intervals
    .scale(color=so.Nominal(["#E69F00", "#56B4E9"]))
    .label(
        title="Agricultural Training Program Impact by Site\n12-Month Follow-up Period",
        x="Months Since Baseline",
        y="Household Food Security Score",
        color="Group"
    )
)
```

This comprehensive figure shows:

- Individual data points (transparency shows density)
- Mean trajectories (bold lines)
- Confidence intervals (bands)
- Site comparisons (facets)
- Treatment vs. control (colors)

Perfect for a research paper or policy brief!

## Exercises

> **NOTE:**
>
> For each scenario, decide whether to use faceting or color (or both):
>
> 1.  Comparing test scores across 3 schools
> 2.  Showing income distribution for 12 different counties
> 3.  Plotting temperature over time for 4 cities
> 4.  Analyzing survey responses across 20 questions
>
> Discuss your reasoning.
>
> > **TIP:**
> >
> > 1.  **Color** - Only 3 schools, easy to compare on one plot
> > 2.  **Faceting** - 12 counties would be too cluttered with color; facets let you see each distribution clearly
> > 3.  **Either works, or both** - 4 cities could work with color (4 lines), or facet for clarity. Or facet by city and color by year!
> > 4.  **Faceting** - 20 questions need separate panels to avoid overwhelming the viewer

> **NOTE:**
>
> Using the penguins dataset, create a plot that:
>
> - Shows flipper length vs. body mass
> - Has separate panels for each island
> - Shows individual points (with transparency)
> - Includes a trend line for each species (use color for species)
>
> ``` python
> # Your code here
> ```
>
> > **TIP:**
> >
> > ``` python
> > (
> >     so.Plot(penguins, x="flipper_length_mm", y="body_mass_g", color="species")
> >     .facet(col="island")
> >     .add(so.Dot(alpha=0.4))
> >     .add(so.Line(linewidth=2), so.PolyFit(order=1))
> >     .label(
> >         title="Penguin Measurements by Island and Species",
> >         x="Flipper Length (mm)",
> >         y="Body Mass (g)",
> >         color="Species"
> >     )
> > )
> > ```

> **NOTE:**
>
> Create a figure for an educational intervention:
>
> 1.  Create data for:
>     - 2 groups (treatment, control)
>     - 3 schools
>     - 4 time points (0, 6, 12, 18 months)
>     - Math test scores as outcome
> 2.  Create a faceted figure showing:
>     - Each school in its own panel
>     - Different colors for treatment/control
>     - Individual data points + mean lines
>
> ``` python
> # Your code here
> ```
>
> > **TIP:**
> >
> > ``` python
> > # Create data
> > np.random.seed(42)
> > schools = ['School A', 'School B', 'School C']
> > groups = ['Control', 'Treatment']
> > months = [0, 6, 12, 18]
> >
> > education_data = []
> > for school in schools:
> >     for group in groups:
> >         for month in months:
> >             # Treatment effect grows over time
> >             if group == 'Control':
> >                 mean_score = 65 + month * 0.3
> >             else:
> >                 mean_score = 65 + month * 0.8  # Stronger effect
> >
> >             scores = np.random.normal(mean_score, 8, 25)
> >             for score in scores:
> >                 education_data.append({
> >                     'school': school,
> >                     'group': group,
> >                     'month': month,
> >                     'score': score
> >                 })
> >
> > edu_df = pd.DataFrame(education_data)
> >
> > # Create figure
> > (
> >     so.Plot(edu_df, x="month", y="score", color="group")
> >     .facet(col="school")
> >     .add(so.Dot(alpha=0.3, pointsize=4))
> >     .add(so.Line(linewidth=2.5), so.Agg())
> >     .scale(color=["#999999", "#E69F00"])
> >     .label(
> >         title="Mathematics Intervention Impact Across Three Schools",
> >         x="Months Since Baseline",
> >         y="Math Test Score",
> >         color="Group"
> >     )
> > )
> > ```

## Design Principles for Multi-Panel Figures

### 1. Keep Scales Consistent

Unless there’s a good reason, use the same scales across panels for easy comparison.

### 2. Limit Complexity

- Maximum 3-4 aesthetics (x, y, color, size)
- Maximum 12-15 facet panels
- If you need more, consider multiple figures

### 3. Order Matters

Arrange facets logically:

- Alphabetically
- By magnitude
- Chronologically
- Geographically

### 4. Guide the Eye

- Use titles and labels to tell a story
- Highlight the most important panel or finding
- Add annotations if needed

### 5. Consider Your Medium

- **Presentations**: Fewer, larger panels
- **Papers**: Can have more panels with smaller size
- **Reports**: Balance detail with readability

> **IMPORTANT:**
>
> - Small multiples (faceting) create separate panels for each category
> - Use `.facet(col=, row=)` to create faceted plots
> - Facet when you have many categories or cluttered plots
> - Use color when you have few categories and want to see overlap
> - Combine faceting and color for multi-dimensional comparisons
> - Layer multiple marks with `.add()` for richer visualizations
> - Common layering: dots + lines, bars + error bars, scatter + fit
> - Combining faceting and layering creates comprehensive research figures
> - Keep faceted plots simple - don’t overwhelm with too much in each panel
> - Consistent scales across panels enable easy comparison

> **TIP:**
>
> In the next lesson, we’ll explore statistical transformations - how to add regression lines, confidence intervals, aggregations, and other statistical summaries directly to our visualizations.

Back to top
