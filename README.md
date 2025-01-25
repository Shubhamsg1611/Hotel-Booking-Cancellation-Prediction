# Hotel-Booking-Cancellation-Prediction
![](https://www.datascienceportfol.io/static/profile_pics/pr28_071DFE7F0D7971643FE8.jpg)
This project builds a logistic regression model to predict whether a hotel booking will be canceled based on features like lead time, room type, price, and special requests. The model achieved 80% accuracy, with key predictors including lead time, number of special requests, and room type. The project includes data preprocessing, exploratory data analysis (EDA), model training, evaluation (confusion matrix, accuracy, sensitivity, and specificity), and actionable insights for improving hotel booking management.

## Data Preprocessing:
1. **Handling Missing Values:** Checked for and addressed any missing or inconsistent data.
2. **Encoding Categorical Variables:** Transformed categorical variables (e.g., type of meal plan, room type) into numerical representations using one-hot encoding.
3. **Feature Scaling:** Standardized numeric features to ensure the model's coefficients are comparable.
4. **Splitting Data:** Divided the dataset into training and testing sets (70% training, 30% testing).

## Model Summary:
The logistic regression model included the following features:
1. Lead time
2. Number of adults and children
3. Number of weekend and weekday nights
4. Type of meal plan
5. Required car parking space
6. Room type reserved
7. Market segment type
8. Average price per room
9. Number of special requests

- Key Coefficients:
1. Lead time: Significant positive effect (p-value < 2e-16)
2. Number of special requests: Strong negative effect (p-value < 2e-16)
3. Market segment (Offline): Significant negative effect (p-value < 7.97e-13)
4. Required car parking space: Negative effect (p-value < 2e-16)
 
- Model Performance:
1. Null Deviance: 36710
2. Residual Deviance: 24879
3. AIC: 24923

## Confusion Matrix and Evaluation Metrics:
The model's performance was evaluated on the test dataset:

- Confusion Matrix:
![](https://github.com/Shubhamsg1611/Hotel-Booking-Cancellation-Prediction/blob/main/Confusion%20Matrix.png)

1. Accuracy: The model achieved an accuracy of 80.03%, which is a strong result.
2. Sensitivity: The sensitivity (true positive rate) is 89.18%, indicating the model effectively identifies non-canceled bookings.
3. Specificity: The specificity (true negative rate) is 61.25%, meaning the model is less effective at predicting cancellations.
4. Balanced Accuracy: With a balanced accuracy of 75.21%, the model performs reasonably well in distinguishing between canceled and non-canceled bookings.
5. Class Imbalance: The prevalence of non-canceled bookings (67.24%) aligns with real-world scenarios, making accuracy a less informative metric. Kappa (0.5266) provides a better assessment, showing moderate agreement between predictions and actual outcomes.


- Key Metrics:
1. Accuracy: 80.03%
2. Sensitivity (Not Canceled): 89.18%
3. Specificity (Canceled): 61.25%
4. Precision (Not Canceled): 82.53%
5. Kappa Statistic: 0.5266
6. Balanced Accuracy: 75.21%

- Observations:
1. The model demonstrates high sensitivity, accurately identifying bookings that are not canceled.
2. Specificity is lower, indicating room for improvement in predicting canceled bookings.
3. Precision and Kappa scores indicate moderate agreement and predictive power.

## Conclusion:
The logistic regression model provides a strong foundation for predicting booking cancellations with an accuracy of 80% and balanced accuracy of 75.21%. It identifies non-cancellations effectively but has room for improvement in predicting cancellations. Future enhancements could involve addressing class imbalance and exploring additional predictors or advanced modeling techniques like ensemble methods to further improve specificity and overall performance.
