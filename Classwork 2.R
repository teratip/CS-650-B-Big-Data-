#Classwork 2

# if-else function
x <- 10
count <- 0
if( x>= -1 & x <=1){
  count <- count+1
} else {
  count <- count-1
}
count


# Creating vector using While-loop
counter <-1
while(counter<12){
  print(counter)
  counter <- counter +1
}

# Creating vector using For-loop
for (i in 1:5){
  print("Hello R")
}

for (m in 5:10)
  print(m)

# Classwork 1
# Square roots of 1 to 20 numbers using While loop
for (i in 1:20) {
  print(sqrt(i))
}

#creating vectors
# 1
myFirstVector <- c( 2, 5, 7, 1, 4)
myFirstVector
typeof(myFirstVector)

# 2
mySecondVector <- c( "I", "am", "Sam")
mySecondVector
typeof(mySecondVector)

# 3
myThirdVector <- c( T, F, T)
myThirdVector
typeof(myThirdVector)

# creating vectors and printing number of items in X and Y
X <- c(3,4,5)
X

Y <- c(7,8,9,10)
Y

#Creating vector using range
V <- 1:10
S <- -5:30
T <- 10:1

Mix <- c( 3:6, 24, 0:4, 31, 9:7)
Mix

#creating vector using Sequence function
A <- 1:10
A <- seq(1,10)
A
B <- seq(1,10, by=2)
B
C <- seq(5, -5, by=-2)
C
D <- seq(1,10, length=20)
D
E <- seq(0,1, length=15)
E

#creating vector using Repeat function
A <- rep("Hello", 5)
A
B <- rep(A,2)
B
C <- rep(1:5,4)
C
D1 <- rep(c("A","B","C"), 3)
D1
D2 <- rep( c("A","B","C"), each=3)
D2
D3 <- rep( c("A","B","C"), c(2,1,3) )
D3

# Convert mixed mode vector to single mode vector
T <- c("Hello", 3, 67L, 6.8)
typeof(T)

y <- 67000000000L
typeof(y)

y <- c (67L)
typeof(y)


# Print length after creating vector
X <- c(3,5,8)
typeof(X)
length(X)

# Partial Vectors
w <- c ("a", "b", "c", "d","e")

w[1]
w[3]
w[-1]                             
w[-3]
w[c(1,3,5)]                    
w[c(-2,-4)]                     
w[c(-3:-5)]                     
w[1:3]                           

# Sorting Vector
A <- c(5,-2,51,42,-76,42)
A
B <- sort(A)
B

# Arithmetic 
# 1
X <- c( 1, 2, 3)
X
Y <- c( 4, 5 , 6 )
Y
Z <- X + Y
Z

# 2
X <- c( 1, 2, 3)
X
Y <- c( 4, 5 , 6, 7, 8, 9 )
Y
Z <- X + Y
Z

# Creating Vectors using Math Functions
X <- c( 34,56,22,11,65,45)
X
Y <- mean(X)
Y
Z <- min(X)
Z
W <- max(X)
W
S <- sum(X)
S
V <- prod(X)
V

# Printing numbers less than 50 from the given elements
Tax <- c(32,56,44,76,89,24)

for (i in 1:6)
  if (Tax[i] < 50)
    print(i)

for (i in Tax)
  if (i <50)
    print(i)

# Classwork 2
# converting temperature from Fahrenheit to Celsius
fahrenheit <- c(45,77,20,19,101,120,212)

# Celcius calcutation
cel = (fahrenheit - 32) * 5/9
cel

# highest, lowest and average temperatures in Fahrenheit
highest <- max(fahrenheit)
highest
lowest <- min(fahrenheit)
lowest
average <- mean(fahrenheit)
average