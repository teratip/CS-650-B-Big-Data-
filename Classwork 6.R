#Classwork 6

library(ggplot2)


# performing k-means clustering on a 'ThreeClusters.csv' dataset with two variables. 
# visualizing the data points along with their assigned clusters, and summarizes the clustered data.

all <- read.csv(file.choose()) #open ThreeClusters.csv
head(all)
qplot(data=all, x=V1, y=V2) 

#convert to a matrix 
mat <- cbind( all$V1, all$V2)
head(mat)

kmeans(mat,centers=3) 
km = kmeans(mat,centers=3)$cluster 
all$cl <- factor( km)
head(all)
summary(all)
qplot(data=all, x=V1,y=V2, color=cl)




# PerformING k-means clustering on internet usage and birth rate data from a demographics dataset. 
# visualizing the data points along with their assigned clusters and comparing them with income groups.

all <- read.csv(file.choose()) #open Demographics.csv
head(all)
qplot(data=all, y=Internet.users) 

kmeans(all$Internet.users,centers=3) 
km = kmeans(all$Internet.users,centers=3)$cluster 
all$cl <- factor( km)
qplot(data=all, y=Internet.users, color=Income.Group)
qplot(data=all, y=Internet.users, color=cl)
qplot(data=all, y=Birth.rate) 
kmeans(all$Birth.rate,centers=3) 
km = kmeans(all$Birth.rate,centers=3)$cluster 
all$cl <- factor( km)
qplot(data=all, y=Birth.rate, color=Income.Group)
qplot(data=all, y=Birth.rate, color=cl)




# Performing k-means clustering on student grades in English, Math, and Science.
# VisualizING the grades and the assigned clusters.

all <- read.csv(file.choose()) #open grades_km_input.csv
head(all)
qplot(data=all, y=English)
qplot(data=all, y=Math)
qplot(data=all, y=Science)
mat <- cbind(all$English, all$Math, all$Science)
head(mat)

kmeans(mat,centers=3) 
km = kmeans(mat,centers=3)$cluster 
all$cl <- factor( km)

qplot(data=all, y=English, color=cl)
qplot(data=all, y=Math, color=cl)
qplot(data=all, y=Science, color=cl)
qplot(data=all, x=Science,y=English, color=cl)
qplot(data=all, x=Science,y=Math, color=cl)
qplot(data=all, x=Math, y=Science, color=cl)




# PerformING k-means clustering on student grades in English, Math, and Science.
# Visualizing the grades in both 2D and 3D plots and coloring the points by their assigned clusters.

all <- read.csv(file.choose()) #open grades_km_input.csv
head(all)
install.packages("plot3D") 
library("plot3D")
scatter3D(all$English,all$Math,all$Science)
mat <- cbind(all$English, all$Math, all$Science, col=NULL)
head(mat)
kmeans(mat,centers=3) 

km = kmeans(mat,centers=3)$cluster 
all$cl <- km
scatter3D(all$English,all$Math,all$Science, colvar=all$cl)




# Performing k-means clustering on student grades in English, Math, and Science.
# Using the Elbow Method to determine the optimal number of clusters and visualizing the grades in 3D plots, 
# Coloring the points by their assigned clusters.

all <- read.csv(file.choose()) #open grades_km_input.csv
head(all)
install.packages("plot3D")
library("plot3D")
scatter3D(all$English,all$Math,all$Science)
mat <- cbind(all$English, all$Math, all$Science, col=NULL)
head(mat)
wss <- rep(0,15) 
wss
for (k in 1:15)
  wss[k] <- sum( kmeans(mat,centers=k, nstart=50)$withinss)
wss
plot(wss, type="b") 
kmeans(mat,centers=3) 

km = kmeans(mat,centers=3)$cluster 
all$cl <- km
scatter3D(all$English,all$Math,all$Science, colvar=all$cl)




# Lab 6

