install.packages("ggplot2")

# Lecture 4 : Visualisation

# Generating data and visualizing with ggplot2.
First <- rnorm(50)
Second <- First + rnorm(50, mean=0, sd=0.4)
data <- as.data.frame(cbind(First,Second))
# text results
summary(data)

library(ggplot2)
# visualization
ggplot( data, aes(x=First,y=Second)) + geom_point(size=2)


# Loading Anscombe, setting theme, and visualizing with ggplot2.
data("anscombe")
anscombe
# generate levels to indicate groups 
levels <- gl(4, nrow(anscombe))
mydata <- with(anscombe,data.frame(x=c(x1,x2,x3,x4), y=c(y1,y2,y3,y4),mygroup=levels))
mydata
theme_set(theme_bw())
# Creating a scatter plot with linear regression lines for each group
ggplot(mydata, aes(x,y)) + geom_point(size=4) +
  geom_smooth(method="lm", fill=NA, fullrange=TRUE) +
  facet_wrap(~mygroup)


# Handling missing valuesin a vector and data frame.
x <- c( 1,2,3,NA,5)
x
is.na(x)
# calculating means and maximums with and without NA removal.
mean(x) # NA
mean(x, na.rm=TRUE) #2.75
DF <- data.frame( x= c(12,9,23), y=c(10,20,NA))
DF
DF1 <- na.exclude(DF)
DF1
max(DF) #NA
max(DF, na.rm=TRUE) #23
max(DF1) #20


# Visualizing car mpg and cylinder count distribution using dotchart and barplot.
data(mtcars)
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=0.6, main="Miles perGallons of Car models", xlab="mpg")
barplot(table(mtcars$cyl), main="Dist of Car Cylinder Count", xlab="Number ofcylinders")


# Creating stem-and-leaf plot, and histogram for x Variable.
x <- c( 12, 13, 21, 27, 33, 34, 35, 37, 46, 51, 51, 57)
x
stem(x)
hist(x)


# visualizing income distribution with histogram, rug plot, and density plot.
income <- 1000 * rlnorm(4000, meanlog = 4, sdlog = 0.7)
summary(income)
hist( income, breaks=500, xlab="Income", main = "Histogram of Income")
rug(income)
plot(density(log10(income),adjust=0.5), main="Log10 Scale Distribution")
rug(log10(income))


# Loading diamonds dataset and visualizing price distribution.
library("ggplot2")
data(diamonds)
#filtering premium and ideal cut diamonds
nicediamonds <- diamonds [diamonds$cut=="Premium" | diamonds$cut=="Ideal",]
summary(nicediamonds$cut) 
# Creating density plots of diamond prices
ggplot( nicediamonds, aes(x=price, fill=cut)) + geom_density(alpha=0.3,color=NA)
ggplot( nicediamonds, aes(x=log10(price), fill=cut)) + geom_density(alpha=0.3,color=NA)


# Loading mtcars dataset and visualizing mpg with a dot chart. 
data("mtcars")
cars <- mtcars[order(mtcars$mpg),]
cars$cyl <- factor(cars$cyl)
cars$color[cars$cyl==4] <- "Red"
cars$color[cars$cyl==6] <- "Blue"
cars$color[cars$cyl==8] <- "Green"
dotchart(cars$mpg, labels=row.names(cars), cex=.7, groups=cars$cyl, main="Miles per Gallon", xlab="Milesoer Gallon", color= cars$color, gcolor="Black")

# Lab 4

# Creating matrices with specified dimensions and values
A<- matrix(1:10, nrow=5)
A
B <- matrix( 21:40, nrow=2)
B
C <- matrix(1:100, 20)
C
D <- matrix(0,4,4)
D
E <- matrix(0,10)
E
F <- matrix(c(4,5,6,2,3,4,12,34,45,10,55,32),4,3)
F

# Creating matrices using Snaking
Data <- 1:20
A <-matrix(Data, 4,5) #snake down
A
B <-matrix(Data,4,5,byrow=TRUE) #snake right
B
C<-A+B
C

# # Creating density plots of diamond prices
r2 <- c ("what", "a", "day")
r3 <-1:3
C <- rbind(r1,r2,r3) 
C
D <-cbind(r1,r2,r3) 
D


## Creating density plots of diamond prices
r1 <- c("I", "am", "happy")
r2 <- c ("what", "a", "day", "it", "was")
r3 <-1:3
C <- rbind(r1,r2,r3) 
C
D <-cbind(r1,r2,r3) 
D


# Transposing Matrix A to B
A <- matrix(1:10, nrow=5)
A
nrow(A)
ncol(A)
dim(A)
typeof(A)

B <- t(A)
B


# Creating matrix A and accessing elements, rows, and columns
A <- matrix(1:10, nrow=5)
A
A[1,1]
A[,1]
A[1,]
A[-2,]
A[,-2]
A[-2,-2]


# Creating a named vector and assigning names
#named Vector
Charlie <- 7:11
Charlie
names(Charlie) <- c("a", "b","c","d","e")
Charlie
Charlie[4]
Charlie["d"]
names(Charlie)
#clearing names
names(Charlie) <- NULL
Charlie


# Creating a named Matrix and Assigning rows and columns
temp <- rep(c("a", "b","c"),each=3)
temp
Bravo <- matrix(temp,3,3)
Bravo
rownames(Bravo) <- c("Tom", "Dick", "Harry")
Bravo
colnames(Bravo) <- c("Alice", "Jane", "Mary")
Bravo
Bravo[2,3] <-0
Bravo
Bravo["Tom", "Mary"] <- 0
Bravo

rownames(Bravo)
colnames(Bravo)


# BasketballData.R

# Simple Math
# Exploring data by accessing specific elements, row and column names, and performing basic arithmetic operations.
Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]
FieldGoals

# Approx number of goals per game rounded to 2 decimal points
round( FieldGoals / Games, 2)
round (MinutesPlayed / Games)
round(Salary/Games)
round(Salary/FieldGoals)


# Visualizing columns against each other using matplot.
# plots COLUMNS against each other
?matplot
FieldGoals <- t(FieldGoals) 
matplot(FieldGoals) 
matplot(t(FieldGoals)) 
# # Creating line plots with different markers and colors andadding legend to the plot
matplot(t(FieldGoals/Games), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, pch=15:18, col=c(1:4,6), horiz=FALSE)
matplot(t(FieldGoals/FieldGoalAttempts), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, pch=15:18, col=c(1:4,6), horiz=FALSE)


# Creating a vector and subsetting elements by index.
x <-c("a","b","c","d","e")
x
x[c(1,4)] 
x[1] 


# Subsetting a matrix and extract  rows, columns, or elements.
Games
Games[1:3, 6:10] 
Games[c(1,10), ] 
Games[ , c("2008","2009")] 
Games[1,] 
Games[1,5] 
is.matrix(Games[1,])
is.vector(Games[1,])
Games[1, , drop=F] 
is.matrix(Games[1, , drop=F])
is.vector(Games[1, , drop=F])
Games[1,5, drop=F]


# Plotting Minutes Played data with matplot.
matplot(t(MinutesPlayed), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, pch=15:18, col=c(1:4,6), horiz=FALSE)

Data <- MinutesPlayed[1:3, ]
matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1:3], pch=15:18, col=c(1:4,6), horiz=FALSE)

Data <- MinutesPlayed[1, , drop=F]
matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], pch=15:18, col=c(1:4,6), horiz=FALSE)


# plotting data with matplot.
myplot <-function(rows){
  Data <- MinutesPlayed[rows, ,drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows],pch=15:18, col=c(1:4,6), horiz=FALSE)
 }
myplot(3:5)
myplot(7)
myplot(c(1,7))


myplot2 <-function(mat,rows=1:10){ # default is 1:10
  Data <- mat[rows, ,drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows],pch=15:18, col=c(1:4,6), horiz=FALSE)
 }
myplot2(Points,1:10)
myplot2(Salary,1:3)
myplot2(Salary)
myplot2(MinutesPlayed/Games, 3:5)


# Plotting salary and in-game metrics with matplot.
#salary plots
myplot2(Salary)
myplot2(Salary/Games)
myplot2(Salary/FieldGoals)

# In-game metrics plots
myplot2(MinutesPlayed)
myplot2(Points)

# Normalized in-game metrics plots
myplot2(FieldGoals/Games)
myplot2(FieldGoals/FieldGoalAttempts)
myplot2(FieldGoalAttempts/Games) 
myplot2(Points/Games) 
myplot2(MinutesPlayed/Games) 
myplot2(Games) 