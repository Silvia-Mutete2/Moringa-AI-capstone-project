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

## Project Structure

This toolkit includes everything you need to learn R data analysis with AI assistance:

```
├── README.md              # This file
├── PROMPTS.md             # Learning journal with 10 AI prompts + responses
├── analysis.R             # Beginner-friendly starter script
├── analysis_complete.R    # Full working example with all 10 prompts
└── data/
    └── sample_dataset.csv # Student performance dataset (15 rows × 6 columns)
```

### File Descriptions

- **PROMPTS.md**: 
  - Prompt journal table documenting 10 AI-assisted learning interactions
  - Tracks what you asked, how AI helped, and key reflections
  - Template for adding new prompts as you learn

- **analysis.R**: 
  - Starter template for basic analysis workflow
  - Includes: data import, inspection, summary stats, visualization

- **analysis_complete.R**: 
  - Fully executable demonstration of all 10 prompts in action
  - Includes regression modeling, train/test split, and export
  - Run this to see end-to-end analysis with our sample dataset

- **data/sample_dataset.csv**: 
  - 15 students with: math_score, english_score, science_score, study_hours, attendance_rate
  - Realistic correlations (higher study hours → higher scores)
  - Ready for exploration and analysis

---

## Quick Start Guide

### 1. Install R & Required Packages
```r
# Option 1: Install all at once
install.packages(c("tidyverse", "readxl", "skimr", "caret"))

# Option 2: Install individually
install.packages("tidyverse")  # data wrangling + ggplot2
install.packages("caret")      # machine learning toolkit
```

### 2. Run the Complete Example
```bash
# From R console or RStudio
source("analysis_complete.R")
```

This will:
- Load and inspect the dataset
- Generate summary statistics
- Create 3 visualizations (scatter plot, histogram, regression plot)
- Build a linear regression model
- Export cleaned data to `data/cleaned_data.csv`
- Print a summary report

### 3. Explore the Learning Journal
Open `PROMPTS.md` to see:
- 10 documented AI prompts with outcomes
- Learning reflections after each interaction
- Tips for refining your own prompts

---

## Next Steps

1. **Run analysis_complete.R** to see the full workflow in action
2. **Modify the analysis** with your own questions and plots
3. **Replace sample_dataset.csv** with your own data
4. **Add new prompts to PROMPTS.md** as you learn more R techniques
5. **Experiment!** Try different visualizations, models, and analyses

---

## Sample Outputs from analysis_complete.R

Once you run the script, you'll see:
- **Correlation:** Study hours vs Math score (expect ~0.97)
- **High performers:** Students with math_score > 80 AND study_hours > 5
- **Regression model:** `math_score = 60.42 + 4.47 * study_hours`
- **Model R²:** ~0.95 (excellent predictive power)
- **Test RMSE:** ~2-3 points (model accuracy on unseen data)

---

## Tips for Your Capstone Submission

✅ Document every AI interaction in PROMPTS.md  
✅ Run analysis_complete.R and save outputs (plots, cleaned data)  
✅ Show regression coefficients with interpretation  
✅ Include correlation matrix showing data relationships  
✅ Reference both "how AI helped" and "what you learned"

