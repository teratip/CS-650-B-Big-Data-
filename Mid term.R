# Load necessary library
library(ggplot2)

#Choose a unique dataset that is different from those used in classwork or assignments, and perform the following operations:
# 1. Linear regression (10 points)
# 2. Polynomial regression (10 points)
# 3. Logistic regression (10 points)
# For each type of regression, write a theoretical explanation and provide an example (5 points each, totaling 15 points). Additionally, submit a pull request (PR) and include a detailed description (5 points).

# Read the 'Student Marks.csv' file
inc <- read.csv(file.choose()) 
head(inc) 


# Create a dataframe with the data
data <- data.frame(
  DBN = c("01M292", "01M448", "01M450", "01M458", "01M509", 
          "01M515", "01M539", "01M650", "01M696", "02M047",
          "02M288", "02M294", "02M296", "02M298", "02M300", 
          "02M303", "02M305", "02M308", "02M313", "02M316"),
  School_Name = c("Henry Street School for International Studies", 
                  "University Neighborhood High School", 
                  "East Side Community High School", 
                  "SATELLITE ACADEMY FORSYTH ST", 
                  "CMSP HIGH SCHOOL", 
                  "Lower East Side Preparatory High School", 
                  "New Explorations into Sci, Tech and Math HS", 
                  "CASCADES HIGH SCHOOL", 
                  "BARD HIGH SCHOOL EARLY COLLEGE", 
                  "AMERICAN SIGN LANG ENG DUAL",
                  "FOOD AND FNANCE HIGH SCHOOL", 
                  "HIGH SCHOOL FOR HIST AND COMM", 
                  "High School of Hospitality Management", 
                  "PACE HIGH SCHOOL", 
                  "Urban Assembly School of Design and Construction", 
                  "The Facing History School", 
                  "Urban Assembly Academy of Government and Law", 
                  "LOWER MANHATTAN ARTS ACADEMY", 
                  "The James Baldwin School", 
                  "Urban Assembly School of Business for Young Women"),
  Number_of_Test_Takers = c(31, 60, 69, 26, NA, 
                            154, 47, 35, 138, 11,
                            50, 51, 43, 71, 49, 
                            59, 48, 35, 45, 52),
  Critical_Reading_Mean = c(391, 394, 418, 385, NA, 
                            314, 568, 411, 630, 405,
                            422, 382, 397, 424, 405, 
                            381, 411, 409, 421, 401),
  Mathematics_Mean = c(425, 419, 431, 370, NA, 
                       532, 583, 401, 608, 415,
                       412, 364, 415, 448, 446, 
                       373, 406, 381, 419, 409),
  Writing_Mean = c(385, 387, 402, 378, NA, 
                   314, 568, 401, 630, 385,
                   407, 366, 391, 423, 415, 
                   377, 411, 412, 394, 391)
)

# Remove rows with any missing values
data_clean <- na.omit(data)

# Check for missing values
missing_rows <- which(rowSums(is.na(data)) > 0)

# Check for non-finite values in each column
non_finite_rows <- apply(data, 2, function(x) any(!is.finite(x)))

# Print the column names with non-finite values
print(names(data)[non_finite_rows])

# 1. Linear regression

# Fit a linear regression model
model <- lm(Critical_Reading_Mean ~ Mathematics_Mean + Writing_Mean, data = data_clean)

summary(model)


# Plot 1: Scatterplot of Critical Reading Mean vs. Mathematics Mean with regression line
plot1 <- ggplot(data_clean, aes(x = Mathematics_Mean, y = Critical_Reading_Mean)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Critical Reading Mean vs. Mathematics Mean",
       x = "Mathematics Mean",
       y = "Critical Reading Mean")

plot1

# Plot 2: Scatterplot of Critical Reading Mean vs. Writing Mean with regression line
plot2 <- ggplot(data_clean, aes(x = Writing_Mean, y = Critical_Reading_Mean)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Critical Reading Mean vs. Writing Mean",
       x = "Writing Mean",
       y = "Critical Reading Mean")

plot2



# 2. Polynomial Regression


# Plot 1
# Perform polynomial regression for Critical Reading Mean and Writing Mean
poly_reg <- lm(Writing_Mean ~ poly(Critical_Reading_Mean, 2), data = data_clean)
predictions <- predict(poly_reg)

# Sort the data for smoother plotting
sorted_data <- data_clean[order(data_clean$Critical_Reading_Mean), ]

# Plot polynomial regression
plot(data_clean$Critical_Reading_Mean, data_clean$Writing_Mean, main = "Polynomial Regression", xlab = "Critical Reading Mean", ylab = "Writing Mean")
lines(sorted_data$Critical_Reading_Mean, predictions[order(data_clean$Critical_Reading_Mean)], col = "red", lw = 2)



# Plot 2
# Perform polynomial regression for Mathematics Mean and Writing Mean
poly_reg_another <- lm(Writing_Mean ~ poly(Mathematics_Mean, 2), data = data_clean)
predictions_another <- predict(poly_reg_another)

# Plot polynomial regression 
plot(data_clean$Mathematics_Mean, data_clean$Writing_Mean, main = "Polynomial Regression (Another Variable)", xlab = "Mathematics Mean", ylab = "Writing Mean")
lines(sort(data_clean$Mathematics_Mean), predictions_another[order(data_clean$Mathematics_Mean)], col = "blue", lw = 2)





# 3. Logistic Regression

# Create a binary response variable based on "Number_of_Test_Takers"
data_clean$Binary_Response <- ifelse(data_clean$Number_of_Test_Takers >= 50, 1, 0)

# Perform logistic regression
log_reg <- glm(Binary_Response ~ Critical_Reading_Mean + Mathematics_Mean + Writing_Mean, 
               data = data_clean, family = binomial)

summary(log_reg)

# Plot the logistic regression curve
plot(data_clean$Writing_Mean, data_clean$Binary_Response, 
     xlab = "Writing Mean", ylab = "Binary Response", 
     main = "Logistic Regression Plot")

# Add logistic regression curve to the plot
curve(predict(log_reg, newdata = data.frame(Critical_Reading_Mean = x, Mathematics_Mean = x, Writing_Mean = x), type = "response"), 
      add = TRUE, col = "blue")


