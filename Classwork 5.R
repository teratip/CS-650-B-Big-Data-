Lecture5 : Regression

# Load the ggplot2 library
library(ggplot2)

# Read the 'Income.csv' file
inc <- read.csv(file.choose()) 
head(inc) 

# Explore the relationship between different variables
qplot( x = inc$Age , y= inc$Income) 
qplot( x = inc$Education , y= inc$Income) 
qplot( x = inc$Gender , y= inc$Income) 
# Conduct linear regression using Age, Education, and Gender to predict Income.
results = lm ( inc$Income~inc$Age+inc$Education+inc$Gender )
results
summary(results)




# Read the 'Income.csv' file
inc <- read.csv(file.choose())
head(inc) 

# Explore the relationship between different variables
qplot( x = inc$Age , y= inc$Income) 
qplot( x = inc$Education , y= inc$Income) 
qplot( x = inc$Gender , y= inc$Income) 
# Execute linear regression using Age and Education to forecast Income.
results2 = lm ( inc$Income~inc$Age+inc$Education )
results2
summary(results2)




# Generate data with a linear relationship
x <- runif(75,0,10) 
x <- sort(x)
y <- 20 + 10*x + rnorm(75,0,10) 
plot(x,y)

# Perform linear regression on the generated data
lr <- lm(y~x)
lr 
# Plot the linear regression line
points( x, lr$coefficients[1] + lr$coefficients[2] * x, type="l", col=4 )




# Generate data with a linear relationship
x <- runif(75,0,10) 
x<- sort(x)
y <- 200 + x^3 - 10 * x^2 + x + rnorm(75,0,20)
plot(x,y)

# Perform linear regression on the generated data
lr <- lm(y~x)
lr
# Plot the linear regression line
points(x,lr$coefficients[1] + lr$coefficients[2] * x, type="l", col=4 )




# Generate data with a linear relationship
x <- runif(75,0,10) 
x<- sort(x)
y <- 200 + x^3 - 10 * x^2 + x + rnorm(75,0,20)
plot(x,y)

# Perform linear regression on the generated data
lr <- lm(y~x)
lr

# Fit a polynomial regression
poly <- loess(y~x) 
fit <- predict(poly)
points(x,fit, type="l", col=2)
points(x,lr$coefficients[1] + lr$coefficients[2] * x, type="l", col=4 )




# Read the 'Churn.csv' file
churn_input <- read.csv(file.choose()) 
head(churn_input)
sum(churn_input$Churned)

# Explore characteristics of churned customers
ch <- churn_input[churn_input$Churned=="1",]
qplot( x = ch$Churned_contacts )
qplot( x = ch$Age )
qplot( x = ch$Married )
qplot( x = ch$Cust_years)

# Explore characteristics of non-churned customers
nch <- churn_input[churn_input$Churned=="0",]
qplot( x = nch$Churned_contacts )
qplot( x = nch$Age )
qplot( x = nch$Married )
qplot( x = nch$Cust_years)




# Perform logistic regression to predict churn using Age, Marital Status, Customer Years, and churned Contacts
Churn_logistic1 <- glm (Churned~Age + Married + Cust_years + Churned_contacts,
                        data=churn_input, family=binomial(link="logit"))
Churn_logistic1
summary(Churn_logistic1) # Eliminate Married and Cust_years


Churn_logistic2 <- glm (Churned~Age + Churned_contacts,
                        data=churn_input, family=binomial(link="logit"))
Churn_logistic2
summary(Churn_logistic2)





# Lab5 

# Reading data from a 'Demographics.CSV' file

# method 1 : select manually
stats <- read.csv(file.choose())
stats




# Explore the data
nrow(stats) 
ncol(stats) 
head(stats) 
tail(stats) 
str(stats) 
# Summary statistics
summary(stats)




#The amazing $
stats[3,3] 
stats[3,3, drop=F] 
stats[3, "Birth.rate"] 

stats$Internet.users 
stats[, "Internet.users"] 
stats$Internet.users[3] 

levels(stats$Income.Group)
summary(stats$Birth.rate)




# Creating new Columns
stats[1:10,]
stats[2:7,]
stats[c(4,16,100),]
stats$Birth.rate * stats$Internet.users 
stats$Birth.rate + stats$Internet.users 

# Add a column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
stats
stats$xyz <- 1:5 
stats

# remove a column
stats$xyz <-NULL
stats$MyCalc <- NULL
stats




# Data Filtering
filter <- stats$Internet.users < 2 
stats[filter,]

# Data Filtering with conditions
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,] 
stats[stats$Income.Group == "High income", ]
stats[stats$Country.Name == "Egypt", ]




# Explore the dataset with qplot
?qplot
# One variable
qplot(stats$Birth.rate) 
qplot(data=stats,x=Internet.users) 
qplot(data=stats,x=Internet.users, bins=10) 
# Two variables
qplot(data=stats, x = Income.Group, y= Birth.rate)
qplot(data=stats, x = Income.Group, y= Internet.users)
# Test the different sizes
qplot(data=stats, x = Income.Group, y= Birth.rate, size=I(10)) 
# Test the different Colors
qplot(data=stats, x = Income.Group, y= Birth.rate, size=I(6), color=I("blue"))




# Test the different charts qplot can draw
qplot(data=stats, x = Income.Group, y= Birth.rate, geom="boxplot")
qplot(data=stats, x = Income.Group, y= Birth.rate, geom="path")
#qplot(data=stats, x = Income.Group, y= Birth.rate, geom="dotplot")
qplot(data=stats, x = Income.Group, y= Birth.rate, geom="point") 
qplot(data=stats, x = Internet.users, y= Birth.rate, geom="boxplot")
qplot(data=stats, x = Internet.users, y= Birth.rate, geom="path")
#qplot(data=stats, x = Internet.users, y= Birth.rate, geom="dotplot")
qplot(data=stats, x = Internet.users, y= Birth.rate, geom="point") 




# Three variables qplot
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate, color=I("red"))
qplot(data=stats, x=Internet.users, y=Birth.rate, color= Income.Group)
qplot(data=stats, x=Internet.users, y=Birth.rate, color= Income.Group, size=I(4))
qplot(data=stats, y=Internet.users, x=Birth.rate, color= Income.Group, size=I(2))




# Creating a Data Frame from Vectors
# Load the file “continent.R”
cont <-
  data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
cont
head(cont)
colnames(cont) <- c("Country", "Code", "Region")
head(cont)




# Merging Two Data Frames
tot <- cbind(stats, cont) 
head(tot)

# Merge using merge
merged <- merge(stats, cont, by.x= "Country.Code", by.y="Code")
head(merged)
merged$Country <- NULL
head(merged)




# QPLOT 
# Plot Birth rate vs Internet Users with additional features
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region)

#shapes 0-25
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, size = I(4), shape=I(17))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, size = I(4), shape=I(2))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, size = I(4), shape=I(15))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, size = I(4), shape=I(23))
# Transparency 0---1
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.7))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.3))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.5))




# PLOT 4 variables

# All four variables
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=Income.Group, alpha=I(0.5))

# Add a title
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.7),
      main="Birth rate vs Internet Users")
