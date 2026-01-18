# Introduction to Data Visualization with Python (Seaborn)

A comprehensive workshop on creating research visualizations using Python's seaborn library, specifically designed for research associates and managers working on policy and development projects in Kenya and beyond.

## 🎯 Workshop Overview

This workshop teaches data visualization using the modern `seaborn.objects` interface - a powerful, intuitive approach based on the grammar of graphics. Learn to create publication-quality visualizations for research reports, policy briefs, and stakeholder presentations.

### Why This Workshop?

- **Research-focused**: Examples from program evaluations, surveys, and development research
- **Modern approach**: Uses seaborn.objects, the newest and most flexible interface
- **Practical**: Hands-on exercises with real-world scenarios
- **Complete**: From basics to publication-ready figures

## 📚 Contents

1. **[Introduction to Seaborn](01-intro-seaborn-objects.qmd)** - First steps with seaborn.objects
2. **[Grammar of Graphics](02-grammar-of-graphics.qmd)** - Mapping data to visual properties
3. **[Marks and Geometric Objects](03-marks-geometric-objects.qmd)** - Dots, lines, bars, and more
4. **[Labels, Scales, and Customization](04-labels-scales-customization.qmd)** - Professional polish
5. **[Faceting and Layering](05-faceting-layering.qmd)** - Multi-panel and layered plots
6. **[Statistical Transformations](06-statistical-transformations.qmd)** - Summaries and regression
7. **[Themes and Final Polish](07-themes-final-polish.qmd)** - Publication-ready figures

## 🎓 Learning Objectives

By the end of this workshop, you will:

- ✅ Understand the grammar of graphics framework
- ✅ Create various plot types (scatter, line, bar, histogram, etc.)
- ✅ Map multiple variables to visual properties (color, size, shape)
- ✅ Build multi-panel figures with faceting
- ✅ Add statistical summaries and regression lines
- ✅ Apply professional themes and styling
- ✅ Export publication-quality figures

## 👥 Target Audience

- Research associates and managers
- Data analysts in policy and development
- Anyone creating visualizations for research communication
- Python users wanting to improve their visualization skills

## 📋 Prerequisites

### Required Knowledge

- Basic Python (variables, functions, importing libraries)
- Basic familiarity with pandas DataFrames (helpful but not required)

### Software Requirements

- Python 3.8 or higher
- Required packages: `pandas`, `seaborn`, `matplotlib`, `numpy`

### Installation

Using uv (recommended):

```bash
uv pip install pandas seaborn matplotlib numpy
```

Using pip:

```bash
pip install pandas seaborn matplotlib numpy
```

Using conda:

```bash
conda install pandas seaborn matplotlib numpy
```

## 🚀 Getting Started

### Quick Start

1. **Clone or download** this repository
2. **Install required packages** (see above)
3. **Open the index file**: Start with `index.qmd` for overview
4. **Begin Lesson 1**: Work through `01-intro-seaborn-objects.qmd`
5. **Practice**: Complete exercises in each lesson

### Recommended Path

- **Self-paced learners**: 1-2 lessons per week (8-10 weeks)
- **Workshop format**: 2-day intensive (4-5 hours per day)
- **Weekly series**: 1.5 hours per week for 7 weeks

## 📊 What You'll Create

Examples of visualizations you'll learn to create:

- **Scatter plots** with multiple dimensions (color, size, shape)
- **Time series** with trend lines and confidence intervals
- **Bar charts** comparing categories with error bars
- **Multi-panel figures** comparing across sites or groups
- **Regression plots** with fitted lines and confidence bands
- **Distribution plots** (histograms, density plots)
- **Impact evaluation figures** with treatment/control comparisons

## 🎨 Key Features

### Research-Relevant Examples

Instead of generic datasets, we use scenarios like:

- Agricultural training program impact
- Household income surveys
- Multi-site education interventions
- Microfinance program evaluations
- Food security assessments

### Grammar of Graphics Approach

Learn the systematic framework that underlies all good visualizations:

- Data + Mappings + Marks + Scales + Coordinates + Facets
- Build complex plots by combining simple components
- Understand *why* certain designs work, not just *how* to create them

### Best Practices Throughout

- Accessibility (colorblind-friendly palettes)
- Clear labeling and documentation
- Appropriate statistical summaries
- Professional themes for different outputs
- Ethical data representation

## 🛠️ Technical Details

### Built With

- **Python 3.8+**
- **seaborn 0.12+** (with objects interface)
- **pandas 1.3+**
- **matplotlib 3.4+**

### Datasets Used

- **Palmer Penguins**: Built-in seaborn dataset for teaching
- **Tips**: Built-in seaborn dataset
- **Simulated research data**: Custom datasets mirroring real research scenarios

All data is either built-in or generated programmatically - no external downloads required!

## 📖 Workshop Format

Each lesson includes:

1. **Learning objectives** - What you'll accomplish
2. **Key concepts** - Core ideas introduced
3. **Worked examples** - Code you can run and modify
4. **Exercises** - Practice problems with solutions
5. **Research applications** - Real-world scenarios
6. **Key points summary** - Quick reference

## 🤝 Contributing

This is an open educational resource. Contributions welcome!

- Found a typo? Open an issue or PR
- Have a better example? Share it!
- Want to add a lesson? Let's discuss

## 📜 License

This workshop is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

You are free to:

- **Share** — copy and redistribute
- **Adapt** — remix, transform, and build upon the material

Just provide attribution.

## 🙏 Acknowledgments

Inspired by:

- The Carpentries teaching approach
- Hadley Wickham's grammar of graphics work
- The seaborn development team
- Research teams doing important work worldwide

## 📞 Support

For questions or issues:

1. Check the [seaborn documentation](https://seaborn.pydata.org/)
2. Review lesson content carefully
3. Try the exercises and compare with solutions
4. Search online (Stack Overflow is great for seaborn questions)

## 🗺️ Roadmap

Current version: 1.0

Future additions could include:

- Advanced statistical visualizations
- Geographic/spatial data visualization
- Interactive visualizations
- Integration with other tools (Quarto, Jupyter)

## ⭐ Quick Tips

### For Learners

- Don't rush - understanding is more important than speed
- Type out the code yourself (don't just copy-paste)
- Experiment with the examples
- Apply techniques to your own data

### For Instructors

- Allow time for exercises - hands-on practice is crucial
- Encourage participants to work with their own data
- Adapt examples to your local context
- Build in breaks - this is a lot to absorb!

## 🎯 Success Metrics

You'll know you've mastered this material when you can:

- Create a visualization from scratch without referring to notes
- Choose appropriate plot types for different research questions
- Customize plots to match publication requirements
- Explain the grammar of graphics to a colleague
- Confidently present your visualizations to stakeholders

## 🚦 Getting Help

Stuck? Here's what to do:

1. **Read the error message** - They're often helpful!
2. **Check the code** - Typos are common
3. **Review the lesson** - The answer is probably there
4. **Try simpler versions** - Break down complex plots
5. **Search online** - You're probably not the first to encounter this issue

## 📈 Next Steps

After completing this workshop:

1. **Apply to your research** - Use these skills on real projects
2. **Explore seaborn further** - Check out other interfaces and plot types
3. **Study examples** - Analyze visualizations in papers you read
4. **Build a portfolio** - Save your best visualizations
5. **Teach others** - The best way to solidify learning

---

**Ready to start?** 👉 Open `index.qmd` to begin!

**Questions?** Open an issue or reach out to the training team.

**Found this helpful?** ⭐ Star this repository and share with colleagues!
