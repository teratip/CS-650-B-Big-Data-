# Assignment 5

#Reading data from a CSV file

# read a csv file
# method 1 : select manually
stats <- read.csv(file.choose())
stats

# 1. Show the data of France
France_data <- stats[stats$Country == "France", ]
France_data

# 2. Show the countries with birthrate > 20 and High income (5)
selected_countries <- stats[stats$Birth.rate > 20 & stats$Income.Group == "High income", ]
selected_countries

# 3. Show the data of the country with the highest internet users (Iceland)
country_highest_internet <- stats[which.max(stats$Internet.users), ]
country_highest_internet

# 4. Average Birthrate (21.46)
avg_birthrate <- mean(stats$Birth.rate)
avg_birthrate

# 5. Standard Deviation of birthrate (10.6)
sd_birthrate <- sd(stats$Birth.rate)
sd_birthrate

# 6. Countries whose birth rate is two SDs above the mean
birthrate_threshold <- average_birthrate + 2 * sd_birthrate
countries_above_threshold <- stats[stats$Birth.rate > birthrate_threshold, ]
countries_above_threshold

# 7. IQR of the birthrate (17.6)
iqr_birthrate <- IQR(stats$Birth.rate)
iqr_birthrate