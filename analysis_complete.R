# Moringa AI Capstone - Complete R Data Analysis
# ==============================================
# This script demonstrates all 10 AI-assisted prompts in action
# Learning outcomes: Data import, EDA, visualization, modeling, and export

library(tidyverse)
library(readxl)
library(skimr)
library(caret)

# =====================================================
# SETUP: Import Data
# =====================================================
# Prompt 1: "Show me how to read a CSV file in R and view the first few rows"
df <- read_csv('data/sample_dataset.csv')
head(df)
cat("\n--- Dataset imported successfully ---\n")

# =====================================================
# PROMPT 2: Summary Statistics
# =====================================================
# Prompt 2: "Provide a summary of all numeric columns in my dataset"
cat("\n--- Summary Statistics ---\n")
summary(df)
cat("\n--- Detailed Data Overview (skim) ---\n")
skim(df)

# =====================================================
# PROMPT 3: Scatter Plot Visualization
# =====================================================
# Prompt 3: "Create a scatter plot in ggplot2 for columns study_hours vs math_score"
cat("\n--- Creating scatter plot: study_hours vs math_score ---\n")
plot1 <- df %>%
  ggplot(aes(x = study_hours, y = math_score)) +
  geom_point(color = "steelblue", size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "red", alpha = 0.2) +
  theme_minimal() +
  labs(
    title = 'Math Score vs Study Hours',
    x = 'Study Hours',
    y = 'Math Score',
    subtitle = 'Linear trend with confidence interval'
  )
print(plot1)

# =====================================================
# PROMPT 4: Data Filtering with dplyr
# =====================================================
# Prompt 4: "Filter rows where math_score > 80 and study_hours > 5 using dplyr"
cat("\n--- Filtering high performers (math_score > 80 AND study_hours > 5) ---\n")
high_performers <- df %>%
  filter(math_score > 80, study_hours > 5)
print(high_performers)
cat(sprintf("Found %d high performers\n", nrow(high_performers)))

# =====================================================
# PROMPT 5: Handling Missing Values
# =====================================================
# Prompt 5: "Handle missing values in a dataset in R"
cat("\n--- Checking for missing values ---\n")
cat("Missing values per column:\n")
colSums(is.na(df))

# Option 1: Complete case removal (if needed)
df_clean <- na.omit(df)
cat(sprintf("Rows after na.omit: %d (removed %d rows)\n", nrow(df_clean), nrow(df) - nrow(df_clean)))

# Option 2: Mean imputation for study_hours (example)
# df$study_hours[is.na(df$study_hours)] <- mean(df$study_hours, na.rm = TRUE)

# =====================================================
# PROMPT 6: Correlation Analysis
# =====================================================
# Prompt 6: "Calculate correlation between study_hours and math_score in R"
cat("\n--- Correlation Analysis ---\n")
correlation <- cor(df$study_hours, df$math_score, use = "complete.obs")
cat(sprintf("Correlation between study_hours and math_score: %.3f\n", correlation))

# Full correlation matrix for all numeric columns
cat("\n--- Full Correlation Matrix (all numeric columns) ---\n")
corr_matrix <- df %>%
  select(where(is.numeric)) %>%
  cor(use = "complete.obs")
print(corr_matrix)

# =====================================================
# PROMPT 7: Histogram Visualization
# =====================================================
# Prompt 7: "Create a histogram of math_score in ggplot2"
cat("\n--- Creating histogram of math scores ---\n")
plot2 <- df %>%
  ggplot(aes(x = math_score)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black", alpha = 0.7) +
  theme_minimal() +
  labs(
    title = 'Distribution of Math Scores',
    x = 'Math Score',
    y = 'Frequency',
    subtitle = 'Binwidth = 5 for clear resolution'
  )
print(plot2)

# =====================================================
# PROMPT 8: Train/Test Split for Modeling
# =====================================================
# Prompt 8: "Split dataset into training and testing sets for predictive modeling"
cat("\n--- Creating train/test split (80/20) ---\n")
set.seed(42)
train_index <- createDataPartition(df$math_score, p = 0.8, list = FALSE)
train_data <- df[train_index, ]
test_data <- df[-train_index, ]
cat(sprintf("Training set: %d rows\n", nrow(train_data)))
cat(sprintf("Test set: %d rows\n", nrow(test_data)))

# =====================================================
# PROMPT 9: Linear Regression Model
# =====================================================
# Prompt 9: "Build a linear regression model predicting math_score from study_hours"
cat("\n--- Linear Regression: math_score ~ study_hours ---\n")
model <- lm(math_score ~ study_hours, data = train_data)
summary(model)

# Model predictions on test set
test_predictions <- predict(model, newdata = test_data)
test_rmse <- sqrt(mean((test_data$math_score - test_predictions)^2))
cat(sprintf("\nTest Set RMSE: %.3f\n", test_rmse))

# =====================================================
# BONUS: Additional Analysis
# =====================================================
# Visualize regression model
cat("\n--- Regression visualization ---\n")
plot3 <- df %>%
  ggplot(aes(x = study_hours, y = math_score)) +
  geom_point(color = "steelblue", size = 3, alpha = 0.7) +
  geom_abline(intercept = coef(model)[1], slope = coef(model)[2], 
              color = "red", linewidth = 1, linetype = "dashed") +
  theme_minimal() +
  labs(
    title = 'Linear Regression: Math Score vs Study Hours',
    x = 'Study Hours',
    y = 'Math Score',
    subtitle = sprintf('y = %.2f + %.2f*x, R² = %.3f', 
                       coef(model)[1], 
                       coef(model)[2],
                       summary(model)$r.squared)
  )
print(plot3)

# =====================================================
# PROMPT 10: Export Cleaned Dataset
# =====================================================
# Prompt 10: "Export cleaned dataset to CSV in R"
cat("\n--- Exporting cleaned dataset ---\n")
write_csv(df_clean, 'data/cleaned_data.csv')
cat("Cleaned dataset exported to: data/cleaned_data.csv\n")

# =====================================================
# SUMMARY REPORT
# =====================================================
cat("\n")
cat("============================================\n")
cat("CAPSTONE ANALYSIS SUMMARY\n")
cat("============================================\n")
cat(sprintf("Total observations: %d\n", nrow(df)))
cat(sprintf("Numeric columns: %d\n", ncol(select(df, where(is.numeric)))))
cat(sprintf("Study hours range: %.1f - %.1f hours\n", 
            min(df$study_hours), max(df$study_hours)))
cat(sprintf("Math score range: %d - %d points\n", 
            min(df$math_score), max(df$math_score)))
cat(sprintf("Correlation (study_hours vs math_score): %.3f\n", correlation))
cat(sprintf("Regression R-squared: %.3f\n", summary(model)$r.squared))
cat(sprintf("Model interpretation: Each additional study hour, math score increases by %.2f points\n", 
            coef(model)[2]))
cat("============================================\n")
cat("\nAnalysis complete! Check 'data/cleaned_data.csv' for exported results.\n")
