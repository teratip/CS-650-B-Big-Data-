#Lab 3

# Sample from a normal distribution with 5 random values
x <-rnorm(5)
x

# Vectorized multiplication of two vectors with 100,000 random normal values each
N <-100000
a <-rnorm(N)
b <- rnorm(N)

c <- a * b
c

# Help documentation for the rnorm function
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

# Plot Normal Distributions and histograms
x <-rnorm(10)
plot(x)
hist(x)


x <-rnorm(5)
plot(x)
hist(x)


x <-rnorm(5, 10, 1)
plot(x)
hist(x)


x <-rnorm(5, 10)
plot(x)
hist(x)


x <-rnorm(5, 1, 10)
plot(x)
hist(x)


x <-rnorm(5, 1)
plot(x)
hist(x)


# Print Normal Distribution Using Basic R statistics tools on a large sample
x <-rnorm(80000)
plot(x)
hist(x)
head(x)
tail(x)
range(x)
summary(x)
boxplot(x)

# Classwork
# Generating 100,000 random values from a normal distribution
x <-rnorm(100000)

# count how many are between -1 and 1
count <- 0
for (i in x)
  if (i>-1 & i<1)
    count <- count+1

# Calculate and print the percentage, should be around 68%
percent <- count/length(x)
percent