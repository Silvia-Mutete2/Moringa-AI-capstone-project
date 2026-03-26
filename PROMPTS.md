# AI Prompt Interactions Log

## Purpose
This file logs all AI-assisted prompts used during the development and analysis phases of the R Data Analysis Capstone Project. Each entry documents:
- The question or task
- The AI response or guidance
- Key learnings
- Date and context

---

## Prompt Journal – R Data Analysis Learning Log

| # | Prompt Used | AI Response Summary | How It Helped Me | Notes / Reflections |
|---|---|---|---|---|
| 1 | "Show me how to read a CSV file in R and view the first few rows" | Suggested `read_csv("file.csv")` and `head(data)` | Allowed me to quickly load and inspect my dataset | I realized I needed to install readr first |
| 2 | "Provide a summary of all numeric columns in my dataset" | Recommended `summary(data)` and `skim(data)` | Helped me get a quick statistical overview | Noted that categorical columns need separate handling |
| 3 | "Create a scatter plot in ggplot2 for columns study_hours vs math_score" | Example using `ggplot(data, aes(x=study_hours, y=math_score)) + geom_point()` | Scaffolded my first visualization | Adjusted axis labels and titles for clarity |
| 4 | "Filter rows where math_score > 80 and study_hours > 5 using dplyr" | Provided `data %>% filter(math_score > 80, study_hours > 5)` | Helped me subset data easily | Learned to chain multiple conditions with `%>%` |
| 5 | "Handle missing values in a dataset in R" | Recommended `na.omit(data)` or mean imputation | Helped me clean my dataset before plotting | Learned about multiple ways to handle NAs |
| 6 | "Calculate correlation between study_hours and math_score in R" | Suggested `cor(data$study_hours, data$math_score)` | Allowed me to analyze relationships quickly | Observed strong positive correlation |
| 7 | "Create a histogram of math_score in ggplot2" | Example: `ggplot(data, aes(x=math_score)) + geom_histogram(binwidth=5)` | Visualized distribution of scores | Learned to adjust binwidth for better resolution |
| 8 | "Split dataset into training and testing sets for predictive modeling" | Suggested `sample()` or `caret::createDataPartition()` | Prepped data for basic machine learning | Practiced 80/20 train/test split |
| 9 | "Build a linear regression model predicting math_score from study_hours" | Example using `lm(math_score ~ study_hours, data=data)` | Scaffolded first predictive model | Observed coefficients, p-values, and R² |
| 10 | "Export cleaned dataset to CSV in R" | Provided `write_csv(data, "cleaned_data.csv")` | Allowed me to save work and share dataset | Learned importance of reproducibility |

### Tips for Using AI Prompts in Your Toolkit

- **Refine your prompts:** If the AI output is too complex or incomplete, break it down step-by-step.
- **Document reflections:** Note whether the AI suggestion worked or if you had to adjust it.
- **Experiment:** Ask AI to suggest alternative plots, analysis, or code improvements.
- **Test & iterate:** Run the code, verify outputs, and record what worked.

---

## Interaction Log

### Interaction 1: Project Initialization
**Date:** 2026-03-26  
**Prompt:** "Create a beginner's toolkit for R data analysis with dataset import and visualization capabilities"

**Response Summary:**
- Established project structure with README, data folder, analysis.R, and this tracking file
- Created sample CSV with student performance data (math, english, science scores + study hours + attendance)
- Defined workflow: Import → Inspect → Clean → Analyze → Visualize

**Key Learnings:**
- R packages like tidyverse, ggplot2, and skimr are essential for modern data workflows
- Starting with a clear directory structure (`data/`, `analysis.R`) makes projects scalable

---

### Interaction 2: Sample Data Creation
**Date:** 2026-03-26  
**Prompt:** "Generate realistic sample data for student performance analysis"

**Response Summary:**
- Created 15-row CSV with columns: student_id, math_score, english_score, science_score, study_hours, attendance_rate
- Data reflects realistic correlations (higher study hours → higher scores generally)

**Key Learnings:**
- Sample data should be realistic and reflect expected patterns
- Small dataset (15 rows) is good for learning before scaling to real data

---

## Template for Future Interactions

### Interaction [N]: [Task Title]
**Date:** YYYY-MM-DD  
**Prompt:** "[Your question or task]"

**Response Summary:**
- [Key point 1]
- [Key point 2]
- [Key point 3]

**Key Learnings:**
- [What you learned from this interaction]

---

## Notes
- Update this file after each significant AI-assisted task.
- Review this log periodically to reflect on learning progress.
- Link to relevant code files and analysis outputs where applicable.
