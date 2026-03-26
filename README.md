# Moringa-AI-capstone-project

## Prompt-Powered Kickstart: Building a Beginner’s Toolkit for R Data Analysis

### Why R?

- R is a programming language and environment designed specifically for statistics and data analysis.
- It is widely used by data scientists, statisticians, and researchers for data wrangling, modeling, and visualization.
- R has a rich ecosystem of packages (like `tidyverse`, `data.table`, `ggplot2`) that make data analysis fast and expressive.
- It encourages quick experimentation and repeatable analysis workflows.

### Objective of this Project

- Learn R programming basics with an AI-guided approach.
- Import dataset(s) from CSV or Excel into R.
- Perform exploratory data analysis and summary statistics.
- Create visualizations (plots, charts) to understand patterns.
- Document the learning journey with prompt/response notes.

### What This README Covers First

1. What R is and why it is useful for data analysis.
2. A suggested structured workflow for beginners.
3. A practical code snippet to get started with a sample dataset.

## R Basics at a Glance

- Start by installing R and RStudio (recommended IDE).
- Install key packages:
  - `install.packages('tidyverse')`
  - `install.packages('readxl')`
  - `install.packages('skimr')`
- Load packages urgently:
  - `library(tidyverse)`
  - `library(readxl)`
  - `library(skimr)`

### Typical workflow

1. Import data (`read_csv()`, `read_excel()`).
2. Inspect data (`head()`, `glimpse()`, `summary()`).
3. Clean/transform data (`filter()`, `mutate()`, `select()`).
4. Analyze (grouping, aggregation, stats).
5. Visualize (`ggplot2` with `geom_point`, `geom_bar`, etc.).
6. Communicate results (RMarkdown, reports).

### Example starter code

```r
# Load core libraries
library(tidyverse)
library(readxl)
library(skimr)

# Import CSV
df <- read_csv('data/my_dataset.csv')

# Quick inspection
glimpse(df)
skim(df)

# Basic summary statistics for numeric columns
df %>% summarise(across(where(is.numeric), list(mean = mean, sd = sd, min = min, max = max), na.rm = TRUE))

# Basic plot
df %>%
  ggplot(aes(x = some_numeric_column, y = another_numeric_column)) +
  geom_point() +
  theme_minimal() +
  labs(title = 'Scatter plot of sample columns')
```

---

## Next steps

- Add a `data/` folder and place a sample CSV file there.
- Add an `analysis.R` script with the starter code above.
- Track AI prompt interactions in a `PROMPTS.md` or notebook file.

