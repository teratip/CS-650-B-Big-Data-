library(ggplot2)
library("ggthemes")

# Classwork 8

# Load the dataset MovieRating.csv into 'movies'
movies <- read.csv(file.choose()) 

# Display the first few rows of the dataset
head(movies)

# Summary statistics of the dataset
summary(movies)

# Structure of the dataset (column names, data types)
str(movies)

# Change column names to shorter versions
colnames(movies) <- c( "Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")

# Display the last few rows of the dataset with updated column names
tail(movies)

# Convert 'Year' column to a factor for categorical grouping
movies$Year <-factor(movies$Year)

# Display structure of dataset after converting 'Year' to factor
str(movies)


# Scatter plot: AudienceRating vs CriticRating
ggplot( data= movies, aes(x=CriticRating, y= AudienceRating))
# geometry
ggplot( data= movies, aes(x=CriticRating, y= AudienceRating)) + 
  geom_point()
# add color
ggplot( data= movies, aes(x=CriticRating, y= AudienceRating, 
  color=Genre)) + geom_point()
# add size
ggplot( data= movies, aes(x=CriticRating, y= AudienceRating,
  color=Genre, size= BudgetMillions)) + geom_point()



# Create a base plot object 'p' for further layering
p <-ggplot( data= movies, aes(x=CriticRating, y= AudienceRating,
  color=Genre, size= BudgetMillions))
# Add different layers to the plot object 'p'
p+ geom_point()
p+ geom_line() # ugly
p + geom_point() + geom_line() 
p + geom_line() + geom_point() 



# Override aesthetics examples with plot object 'q'
q <-ggplot( data= movies, aes(x=CriticRating, y= AudienceRating,
                              color=Genre, size= BudgetMillions))
# Override size aesthetic with 'CriticRating'
q + geom_point(aes(size=CriticRating))
# Override color aesthetic with 'BudgetMillions'
q + geom_point(aes(color= BudgetMillions))
# Override x-axis variable to 'BudgetMillions'
q + geom_point(aes(x=BudgetMillions))
# Fix x-axis label to 'Budget in millions'
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget in millions")
# Adjust line size and point size
q + geom_line(size=1) + geom_point()
q + geom_line(size=1) + geom_point(size=2)



# Mapping vs Setting aesthetics with plot object 'r'
r <-ggplot( data= movies, aes(x=CriticRating, y= AudienceRating))
r + geom_point()
# Scatter plot with mapped color to 'Genre'
r+ geom_point(aes(color=Genre))
# Scatter plot with fixed color 'DarkGreen'
r + geom_point(color="DarkGreen")
# Scatter plot with mapped size to 'BudgetMillions'
r+ geom_point(aes(size=BudgetMillions))
# Scatter plot with fixed size '3'
r+ geom_point(size=3)



# Histograms and density charts with plot object 's'
# Histograms
s <-ggplot( data= movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10) # bar represents 10 points
s + geom_histogram(binwidth = 5) # bar represents 5 points
s + geom_histogram(binwidth = 30) # bar represents 30 points
s + geom_histogram(binwidth = 10, fill="Red") #setting
s + geom_histogram(binwidth = 10, aes(fill=Genre)) #mapping
s + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")
# Density
s + geom_density()
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="Stack")



# More layering methods with plot object 't'
# method 1 : x-axis variable 'AudienceRating'
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, fill="White", color="Blue")
# method 2 : x-axis variable 'AudienceRating' and all aesthetics specified together
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10,
                   aes(x=AudienceRating),fill="White", color="Blue")
# Histogram with x-axis variable 'CriticRating'
t + geom_histogram(binwidth=10,
                   aes(x=CriticRating),fill="White", color="Blue")



# Statistical transformations with plot object 'u'
# Scatterplot
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
u + geom_point()
u + geom_point() + geom_smooth()
u + geom_point() + geom_smooth(fill=NA)
# boxplot
v <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))
v + geom_point()
v + geom_boxplot()
v + geom_boxplot(size=1.2)
v + geom_boxplot(size=1.2) + geom_point()
v + geom_boxplot(size=1.2) + geom_jitter() 
v + geom_jitter() + geom_boxplot(size=1.2)
v + geom_jitter() + geom_boxplot(size=1.2, alpha=0.3) 



# Facets for grouped plots with plot object 'v'
v<- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(bin=10, aes(fill=Genre), color="Black")
# Histogram with facets by 'Genre'
v + geom_histogram(bin=10, aes(fill=Genre), color="Black") +
  facet_grid(Genre~.)
# Facets by 'Genre' with free scales
v + geom_histogram(bin=10, aes(fill=Genre), color="Black") +
  facet_grid(Genre~., scales="free")


# Scatter plot facets with plot object 'b'
b <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                               color=Genre))
b + geom_point(size=2)
# Scatter plot with facets by 'Genre'
b + geom_point(size=2) + facet_grid(Genre~.)
b + geom_point(size=2) + facet_grid(.~Year)
b + geom_point(size=2) + facet_grid(Genre~Year)
b + geom_point(size=2) + geom_smooth() + facet_grid(Genre~.)
b + geom_point(aes(size=BudgetMillions)) + geom_smooth() +
  facet_grid(Genre~Year)


# # Coordinate adjustments with plot object 'm'
m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions,color=Genre))
m + geom_point()
# Zoom into specific range of x and y axes
m + geom_point() + xlim(50,100) + ylim(50,100)
# Another method to zoom into specific range
m + geom_point() +coord_cartesian(ylim=c(50,100))
m + geom_point() +coord_cartesian(xlim=c(50,100),ylim=c(50,100))



# # Theme adjustments with plot object 'h'
o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")
h
# 1. Histogram with x-axis label and y-axis label
h + xlab("Money Spent") +
  ylab("Number of Movies")

# 2. Adjust axis title colors and sizes
h + xlab("Money Spent") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=20),
        axis.title.y = element_text(color="Red", size=20))

# 3.Adjust axis text sizes
h + xlab("Money Spent") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=20),
        axis.title.y = element_text(color="Red", size=20),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))


# 4. Adjust legend title and text sizes
h + xlab("Money Spent") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=20),
        axis.title.y = element_text(color="Red", size=20),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=15),
        legend.text = element_text(size=15))


# 5. Add plot title and adjust its color and size
h + xlab("Money Spent") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="DarkGreen", size=20),
        axis.title.y = element_text(color="Red", size=20),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=15),
        legend.text = element_text(size=15),
        plot.title = element_text(color="DarkBlue",size=30))



# Apply additional theme from ggthemes package
h + xlab("Money Spent") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="DarkGreen", size=20),
        axis.title.y = element_text(color="Red", size=20),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=15),
        legend.text = element_text(size=15),
        plot.title = element_text(color="DarkBlue",size=30))
+ theme_economist()

