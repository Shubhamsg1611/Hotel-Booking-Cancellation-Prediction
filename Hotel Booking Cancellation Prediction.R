# Load necessary libraries
library(readr)
library(dplyr)
library(ggplot2)
library(corrplot)
library(caret)
library(pROC)

# Load the dataset
data <- read_csv("C:/Users/shubh/OneDrive/Documents/Hotel Reservations.csv")

# View the dataset
glimpse(data)
colSums(is.na(data))
data <- distinct(data)
summary(data)

# Data Visualization
ggplot(data, aes(x = lead_time)) + geom_histogram(bins = 30, fill = "black", color = "white") + 
  labs(title = "Lead Time Distribution", x = "Lead Time", y = "Frequency")

ggplot(data, aes(x = market_segment_type, fill = booking_status)) + 
  geom_bar(position = "fill") +
  labs(title = "Booking Status by Market Segment", y = "Proportion")

# Data Preprocessing for Machine Learning

data$booking_status <- ifelse(data$booking_status == "Canceled", 1, 0)
data$booking_status <- as.factor(data$booking_status)

set.seed(123) # For reproducibility
trainIndex <- createDataPartition(data$booking_status, p = 0.8, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Train logistic regression model
model <- glm(booking_status ~ lead_time + no_of_adults + no_of_children +
               no_of_weekend_nights + no_of_week_nights + type_of_meal_plan +
               required_car_parking_space + room_type_reserved + market_segment_type +
               avg_price_per_room + no_of_special_requests,
             data = trainData, family = "binomial")

# Summary of the model
summary(model)

# Predict probabilities
predicted_probs <- predict(model, testData, type = "response")

# Convert probabilities to binary predictions
predicted_classes <- ifelse(predicted_probs > 0.5, 1, 0)
predicted_classes

# Confusion matrix
confusionMatrix(as.factor(predicted_classes), testData$booking_status)

# Plot ROC curve
roc_curve <- roc(testData$booking_status, predicted_probs)
plot(roc_curve, col = "blue", main = "ROC Curve")
auc(roc_curve)
![](https://github.com/Shubhamsg1611/Hotel-Booking-Cancellation-Prediction/blob/main/ROC%20Curve-Sensitivity%20%26%20Specificity.png)
