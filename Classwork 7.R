#File 1
#NaiveBayes

install.packages("e1071") 
library(e1071) 

# Load the dataset 'sample1.csv'
sample <- read.csv(file.choose()) 
print(sample)

# define the data frames for the NB classifier
traindata <- as.data.frame(sample[1:14,])
testdata <- as.data.frame(sample[15,])
traindata
testdata

# Train the Naive Bayes model
model <- naiveBayes(Enrolls ~ Age+Income+JobSatisfaction+Desire,traindata)
model

# predict and display with test data
results <- predict (model,testdata)
results

 


#File 2
#Manual Naive Bayes 


## Load the dataset 'bank-sample.csv'
banktrain <- read.csv(file.choose()) 
banktrain

## drop a few columns to simplify the model
drops<-c("balance", "day", "campaign", "pdays", "previous", "month")
banktrain <- banktrain [,!(names(banktrain) %in% drops)]
summary(banktrain)


## Compute conditional probabilities for 'marital' variable
maritalCounts <- table(banktrain[,c("subscribed", "marital")])
maritalCounts 
rowSums(maritalCounts)

## Normalize to get probabilities
maritalCounts <- maritalCounts/rowSums(maritalCounts)
maritalCounts

## Retrieve probability of 'subscribed = yes' given 'marital = divorced'
maritalCounts["yes","divorced"]

## Compute conditional probabilities for 'job' variable
jobCounts <- table(banktrain[,c("subscribed", "job")])
jobCounts <- jobCounts/rowSums(jobCounts)
jobCounts

## Compute conditional probabilities for 'education' variable
educationCounts <- table(banktrain[,c("subscribed", "education")])
educationCounts <- educationCounts/rowSums(educationCounts)
educationCounts

## Compute conditional probabilities for 'default' variable
defaultCounts <- table(banktrain[,c("subscribed", "default")])
defaultCounts <- defaultCounts/rowSums(defaultCounts)
defaultCounts

## Compute conditional probabilities for 'housing' variable
housingCounts <- table(banktrain[,c("subscribed", "housing")])
housingCounts <- housingCounts/rowSums(housingCounts)
housingCounts

## Compute conditional probabilities for 'loan' variable
loanCounts <- table(banktrain[,c("subscribed", "loan")])
loanCounts <- loanCounts/rowSums(loanCounts)
loanCounts

## Compute conditional probabilities for 'contact' variable
contactCounts <- table(banktrain[,c("subscribed", "contact")])
contactCounts <- contactCounts/rowSums(contactCounts)
contactCounts

## Compute conditional probabilities for 'poutcome' variable
poutcomeCounts <- table(banktrain[,c("subscribed", "poutcome")])
poutcomeCounts <- poutcomeCounts/rowSums(poutcomeCounts)
poutcomeCounts





#File 3
#DecisionTree

# install package rpart.plot
install.packages("rpart.plot") 

library("rpart")
library("rpart.plot")

# Load the dataset 'bank-sample.csv'
banktrain  <- read.csv(file.choose()) 
summary(banktrain)


# Build a decision tree using only categorical variables
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))
# Plot the decision tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)


# Simplify the tree by re-fitting
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))
# Plot the simplified tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)


# Include a numeric variable 'duration' in the model
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + duration + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))
summary(fit)

# Plot the tree with the 'duration' variable included
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)



# Predict using new data and display
newdata <- data.frame(job="retired", 
                      marital="married", 
                      education="secondary",
                      default="no",
                      housing="yes",
                      loan="no",
                      contact = "cellular",
                      duration = 598,
                      poutcome="unknown")
newdata

# Predict the class for new data
predict(fit,newdata=newdata,type=c("class"))
