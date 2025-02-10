# Decision Tree Regression
# importing the dataset
Data = read_csv("Documents/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 8 - Decision Tree Regression/R/Position_Salaries.csv")
Data = Data[2:3]
# Fitting the Decision Tree Regression to the dataset
library(rpart)
regressor = rpart(formula = Salary ~.,
                  data = Data,
                  control = rpart.control(minsplit = 1))
# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualising the Decision Tree Regression results
library(ggplot2)
x_grid = seq(min(Data$Level), max(Data$Level), 0.01)
ggplot() +
  geom_point(aes(x = Data$Level, y = Data$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression)') +
  xlab('Level') +
  ylab('Salary')
