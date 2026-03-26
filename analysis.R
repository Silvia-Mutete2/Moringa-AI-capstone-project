# Moringa AI Capstone - R Data Analysis Script
# =============================================
# This script demonstrates basic data analysis workflows using R

# Load core libraries
library(tidyverse)
library(readxl)
library(skimr)

# Import CSV
df <- read_csv('data/sample_dataset.csv')

# Quick inspection
glimpse(df)
skim(df)

# Basic summary statistics for numeric columns
df %>% summarise(across(where(is.numeric), list(mean = mean, sd = sd, min = min, max = max), na.rm = TRUE))

# Basic plot
df %>%
  ggplot(aes(x = study_hours, y = math_score)) +
  geom_point() +
  theme_minimal() +
  labs(title = 'Math Score vs Study Hours',
       x = 'Study Hours',
       y = 'Math Score')

# Additional analyses
# Correlation between study hours and scores
df %>%
  select(study_hours, math_score, english_score, science_score) %>%
  cor(use = "complete.obs")

# Group by attendance rate ranges
df %>%
  mutate(attendance_category = case_when(
    attendance_rate >= 95 ~ "Excellent",
    attendance_rate >= 90 ~ "Good",
    attendance_rate >= 85 ~ "Fair",
    TRUE ~ "Low"
  )) %>%
  group_by(attendance_category) %>%
  summarise(
    avg_math = mean(math_score),
    avg_english = mean(english_score),
    avg_science = mean(science_score),
    count = n()
  )
