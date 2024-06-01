# Load required libraries
library(ggplot2)
library(cluster)
library(plot3D)

# Load the Credit Card Dataset
credit_card_data <- read.csv(file.choose())  # Choose the Credit Card Dataset file
head(credit_card_data)



# Perform k-means clustering on Balance and Purchases, assign cluster labels, and visualize
kmeans_model <- kmeans(credit_card_data[, c("BALANCE", "PURCHASES")], centers = 3)
credit_card_data$cluster_bal_pur <- factor(kmeans_model$cluster)
# Visualize clusters in 2D
ggplot(credit_card_data, aes(x = BALANCE, y = PURCHASES, color = cluster_bal_pur)) +
  geom_point() +
  labs(title = "Clustering based on Balance and Purchases")



# Perform k-means clustering on Balance Frequency and Purchases Frequency, assign cluster labels, and visualize
kmeans_model_freq <- kmeans(credit_card_data[, c("BALANCE_FREQUENCY", "PURCHASES_FREQUENCY")], centers = 3)
credit_card_data$cluster_freq <- factor(kmeans_model_freq$cluster)
# Visualize clusters in 2D
ggplot(credit_card_data, aes(x = BALANCE_FREQUENCY, y = PURCHASES_FREQUENCY, color = cluster_freq)) +
  geom_point() +
  labs(title = "Clustering based on Frequency of Balance and Purchases")




# Elbow Method for determining optimal number of clusters
wss <- rep(0, 10) 
for (k in 1:10) {
  kmeans_model <- kmeans(credit_card_data[, c("BALANCE", "PURCHASES")], centers = k)
  wss[k] <- sum(kmeans_model$withinss)
}
plot(1:10, wss, type = "b", xlab = "Number of Clusters", ylab = "Within-cluster Sum of Squares")




# Visualize the data points with their assigned clusters (2D and 3D)
par(mfrow = c(1, 2))

# 2D Plot with Assigned Clusters based on Balance and Purchases
plot(credit_card_data$BALANCE, credit_card_data$PURCHASES, col = kmeans_model$cluster, 
     main = "2D Plot with Assigned Clusters", xlab = "Balance", ylab = "Purchases")


# 3D Plot with Assigned Clusters based on Balance and Purchases
scatter3D(credit_card_data$BALANCE, credit_card_data$PURCHASES, z = rep(0, nrow(credit_card_data)),
          colvar = as.numeric(as.character(credit_card_data$cluster_bal_pur)), pch = 19, theta = 120, phi = 20,
          xlab = "Balance", ylab = "Purchases", zlab = "Cluster",
          main = "3D Plot with Assigned Clusters")
