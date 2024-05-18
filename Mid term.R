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


# 1. Linear regression: Critical Reading Mean vs Mathematics Mean
linear_model <- lm(Critical_Reading_Mean ~ Mathematics_Mean, data = data)
summary(linear_model)

# Plot Linear Regression
plot1 <- ggplot(data, aes(x = Mathematics_Mean, y = Critical_Reading_Mean)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  ggtitle("Linear Regression: Critical Reading Mean vs Mathematics Mean")
print(plot1)

# 2. Polynomial regression: Critical Reading Mean vs Mathematics Mean
polynomial_model <- lm(Critical_Reading_Mean ~ poly(Mathematics_Mean, 2), data = data)
summary(polynomial_model)

# Plot Polynomial Regression
plot2 <- ggplot(data, aes(x = Mathematics_Mean, y = Critical_Reading_Mean)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), col = "red") +
  ggtitle("Polynomial Regression: Critical Reading Mean vs Mathematics Mean")
print(plot2)

# 3. Logistic regression: Binarizing Critical Reading Mean and predicting based on Mathematics Mean
# Create a binary variable for Critical_Reading_Mean
data$High_Critical_Reading <- ifelse(data$Critical_Reading_Mean > 400, 1, 0)

logistic_model <- glm(High_Critical_Reading ~ Mathematics_Mean, data = data, family = binomial)
summary(logistic_model)

# Plot Logistic Regression
plot3 <- ggplot(data, aes(x = Mathematics_Mean, y = High_Critical_Reading)) +
  geom_point() +
  stat_smooth(method = "glm", method.args = list(family = "binomial"), col = "green") +
  ggtitle("Logistic Regression: High Critical Reading Mean vs Mathematics Mean")
print(plot3)

# Additional Plots

# 4. Scatter plot: Number of Test Takers vs Critical Reading Mean
plot4 <- ggplot(data, aes(x = Number_of_Test_Takers, y = Critical_Reading_Mean)) +
  geom_point() +
  ggtitle("Scatter Plot: Number of Test Takers vs Critical Reading Mean")
print(plot4)

# 5. Histogram of Critical Reading Mean
plot5 <- ggplot(data, aes(x = Critical_Reading_Mean)) +
  geom_histogram(binwidth = 20, fill = "blue", color = "black") +
  ggtitle("Histogram of Critical Reading Mean")
print(plot5)



