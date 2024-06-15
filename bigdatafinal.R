
# Install GGally package if not already installed
if (!requireNamespace("GGally", quietly = TRUE)) {
  install.packages("GGally")
}
# Load necessary libraries
library(ggplot2)
library(GGally)

# Set the working directory to where your file is located
setwd("C:/Users/terat/OneDrive/Pictures/")

# Load the dataset
data  <- read.csv(file.choose())


# Perform linear regression
model <- lm(Income ~ Age + Education_Level + Work_Experience, data=data)

# View the summary of the regression model
summary(model)

# Create a scatterplot matrix
ggpairs(data, columns = c("Income", "Age", "Education_Level", "Work_Experience"))

# Scatterplot with regression line for Age
ggplot(data, aes(x = Age, y = Income)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Income vs. Age")

# Plot residuals against fitted values
residuals <- residuals(model)
ggplot(data, aes(x = fitted(model), y = residuals)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Residual Plot", x = "Fitted Values", y = "Residuals")

# Q-Q plot of residuals
qqnorm(residuals)
qqline(residuals)

# Create a grid of diagnostic plots
plot(model)


ggplot(data, aes(x = Age, y = Income, color = Education_Level)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Income vs. Age by Education Level")

