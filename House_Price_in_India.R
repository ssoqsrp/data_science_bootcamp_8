# load necessary libraries
library(readr)
library(tidyverse)
library(ggplot2)
library(caret)
library(knitr)

# load and join dataset

data1 <- read_csv("House Price India.csv", show_col_types = FALSE)
data2 <- read_csv("House Price India 2.csv", show_col_types = FALSE)

full_df <- bind_rows(data1, data2)

# show all columns
glimpse(full_df)

# check data completeness
completeness <- full_df %>%
  complete.cases() %>%
  mean()
  
cat(paste("Data completeness: ", completeness,""))

# Ignore the id and date columns
# because id and date were excluded as they were not relevant for predictions
prep_df <- full_df[, -c(1,2)]

# visualizing price 
ggplot(data = prep_df, 
       aes(x = Price)) +
  geom_density() +
  theme_minimal()

# log transformation
prep_df$log_price <- log(prep_df$Price)

ggplot(data = prep_df,
       aes(x = log_price)) +
  geom_density() +
  theme_minimal()

# building the models
## splitting data 80% train and 20% test
split_data <- function(df) {
  set.seed(59)
  n <- nrow(df)
  id <- sample(1:n, size = 0.8*n)
  train_df <- df[id, ]
  test_dft <- df[-id, ]
  list(train = train_df,
       test = test_df)
}

split_df <- split_data(prep_df)
train_df <- split_df$train
test_df <- split_df$test


# train model
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)
set.seed(59)
lm_model <- train(log_price ~ .,
                  data = train_df,
                  method = "lm",
                  trControl = ctrl
                  )

summary(lm_model)

# score model
p <- predict(lm_model, newdata = test_df)

# evaluate model
# mean absolute error
(mae <- mean(abs(p - test_df$log_price)))

# root mean square error
(rmse <- sqrt(mean((p - test_df$log_price)**2)))







