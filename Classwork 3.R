#Lab 3

# Printing Normal Distribution
x <-rnorm(5)
x

# Printing Normal Distribution Using Vector Math
N <-100000
a <-rnorm(N)
b <- rnorm(N)

#Vectorized approach
c <- a * b
c

# Printing Help Page
?rnorm

# Printing Normal Distribution Using Various Parameters
X <- rnorm(5)
X
X <- rnorm( 5, 10, 1)
X
X <- rnorm (5, 10)
X
X <- rnorm(5, mean=10, sd = 1)
X
X <- rnorm(5, sd=1, mean=10)
X
X <- rnorm(5, sd=1)
X

# Plot Normal Distribution
x <-rnorm(10)
plot(x)
hist(x)

# Plot Normal Distribution
x <-rnorm(5)
plot(x)
hist(x)

# Plot Normal Distribution
x <-rnorm(5, 10, 1)
plot(x)
hist(x)

# Plot Normal Distribution
x <-rnorm(5, 10)
plot(x)
hist(x)

# Plot Normal Distribution
x <-rnorm(5, 1, 10)
plot(x)
hist(x)

# Plot Normal Distribution
x <-rnorm(5, 1)
plot(x)
hist(x)


# Print Normal Distribution Using Basic R statistics tools
x <-rnorm(80000)
plot(x)
hist(x)
head(x)
tail(x)
range(x)
summary(x)
boxplot(x)

# Classwork
# Generate the vector of numbers
x <-rnorm(100000)

# count how many are between -1 and 1
count <- 0
for (i in x)
  if (i>-1 & i<1)
    count <- count+1

# Get and print the percentage, should be around 68%
percent <- count/length(x)
percent