## Statistical Inference ----- Final Project 
## Salar Nouri ---- 810194422
## ----------------------------------------

library(tidyverse)
library(caret)
library(FSelector)
install.packages('caret')
install.packages('FSelector')
install.packages('corrgram')
library(corrgram)
install.packages('PRROC')
library(PRROC)
install.packages('QuantPsyc')
library(QuantPsyc)

House_Data <- read.csv("E:/Salar/Uni/SI/project/House Sales.csv")


# Problem (1) ==========


cat_var_1 <- House_Data$bedrooms
cat_var_2 <- House_Data$yr_built
tbl = table(cat_var_1, cat_var_2) 
chisq.test(tbl)

# Problem (2) ==========


source("inference.R")
House_Data$Category2[House_Data$yr_renovated == 0] = "Not renovated"
House_Data$Category2[House_Data$yr_renovated > 0] = "renovated"
sample <- sample(House_Data$Category2,10)
inference(sample,est="proportion",succes="renovated",
          method="simulation",type="ht",
          alternative="twosided",null=0.5)

inference(sample, est = 'proportion', type = 'ht', method = 'simulation', 
          success = 'flat', null = 0.5, alternative = 'greater')

# Problem (3) ==========

categories <- House_Data$bedrooms
categories.freq <- table(categories)
categories.relfreq <- categories.freq / nrow(House_Data)
p <- cbind(categories.relfreq)
plot(categories.relfreq)

# Part (1)

Sample <- sample(House_Data$bedrooms,100)
categories <- Sample
categories.freq <- table(categories)
categories.relfreq <- categories.freq / 100
p1<- cbind(categories.relfreq)
plot(categories.relfreq,xlim=c(0,33))

# Part (2)

prb <- ifelse(House_Data$bedrooms==3,0.1,0.9)
Sample <- sample(House_Data$bedrooms,100,prob = prb)
categories <- Sample
categories.freq <- table(categories)
categories.relfreq <- categories.freq / 100
p2 <- cbind(categories.relfreq)
plot(categories.relfreq,xlim=c(0,33))

# Test

good_of_fit <- list(p,p1,p2)
good_of_fit <- lapply(good_of_fit, 'length<-', max(lengths(good_of_fit)))
chisq.test(good_of_fit[[1]], good_of_fit[[2]])
chisq.test(good_of_fit[[1]], good_of_fit[[3]])

# Problem (4) ==========

Num_var <-lm(House_Data$price~House_Data$sqft_lot)
coefficients(Num_var)
plot(House_Data$sqft_lot,House_Data$price,pch=16, 
     xlab="Total Sqft.", 
     ylab="Price", 
     main="Scatterplot of Variables")
abline(coefficients(Num_var), lwd=2, lty=2, 
       col="gray")
# Part (4)

variablity <-cor(House_Data$sqft_lot~House_Data$price)
# Part (5)

temp<-lm(House_Data$sqft_lot~House_Data$price)
coefficients(temp)

# Part (6)

House_Data$index <- 1:nrow(House_Data)  # create index variable
data <- House_Data[1:80,]
loessMod10 <- loess(data$price ~ index, data=data, span=0.10) # 10% smoothing span
loessMod25 <- loess(data$price ~ index, data=data, span=0.25) # 25% smoothing span
loessMod50 <- loess(data$price ~ index, data=data, span=0.50) # 50% smoothing span
smoothed10 <- predict(loessMod10) 
smoothed25 <- predict(loessMod25) 
smoothed50 <- predict(loessMod50) 
plot(data$price, type="l", main="Lose Smoothing and Prediction", ylab="Price")
lines(smoothed10,  col="blue")
lines(smoothed25,  col="green")
lines(smoothed50, col="yellow")
legend("topright", legend=c("0.10 Span", "0.25 Span","0.50 Span"),col=c("blue", "green","yellow"), lty=1:2, cex=0.8)


lw1 <- loess(price ~sqft_lot,data=House_Data)
plot(price ~ sqft_lot, data=House_Data,pch=19,cex=0.1)
j <- order(House_Data$sqft_lot)


# Problem (5) ==========

mod<-lm(House_Data$price~House_Data$sqft_lot + House_Data$grade)
coefficients(mod)
mod2<-lm(House_Data$price~House_Data$sqft_lot)
coefficients(mod2)
summary(mod)$adj.r.squared
summary(mod2)$adj.r.squared
anova(mod,mod2)
rss <- sum(residuals(mod)) - sum(residuals(mod2))
rss

# Problem (6) ==========

fit <- information.gain(price ~ ., House_Data)
fit2 <- cutoff.k(fit,8)
reducedmodel <- as.simple.formula(fit2,"price")
print(reducedmodel)


set.seed(123)
training.samples <- House_Data$price %>%
  createDataPartition(p = 0.8, list = FALSE)
train.data  <-House_Data[training.samples, ]
test.data <- House_Data[-training.samples, ]
model <- lm(price~ zipcode + grade + lat + sqft_living + sqft_living15 + 
              sqft_above + bathrooms + long,data = train.data)
predictions <- model %>% predict(test.data)
model

data.frame( R2 = R2(predictions, test.data$price),
            RMSE = RMSE(predictions, test.data$price),
            MAE = MAE(predictions, test.data$price))
plot(model,1)
plot(model,2)
plot(model,3)
par(mfrow=c(1,2))
plot(model,4)
plot(model,5)

new_df=data.frame(House_Data$price,House_Data$zipcode, House_Data$grade, House_Data$lat ,House_Data$sqft_living ,House_Data$sqft_living15 , 
                  House_Data$sqft_above ,House_Data$bathrooms,House_Data$long)
corrgram(new_df, order=TRUE, lower.panel=panel.pts,
         upper.panel=NULL, text.panel=panel.txt,
         main="House_Data corrgram")


# Problem (7) ==========


set.seed(123)
train.control <- trainControl(method = "cv", number = 10)
step.model <- train(price ~zipcode + grade + lat + sqft_living + sqft_living15 + 
                      sqft_above + bathrooms + long, data = House_Data,
                    method = "leapBackward", 
                    tuneGrid = data.frame(nvmax = 1:8),
                    trControl = train.control
)
step.model$results
step.model$bestTune
summary(step.model$finalModel)

set.seed(123)
train.control <- trainControl(method = "cv", number = 10)
step.model <- train(price ~zipcode + grade + lat + sqft_living + sqft_living15 + 
                      sqft_above + bathrooms + long, data = House_Data,
                    method = "leapForward", 
                    tuneGrid = data.frame(nvmax = 1:8),
                    trControl = train.control
)
step.model$results
step.model$bestTune
summary(step.model$finalModel)


# Problem (8) ==========

model <- glm(waterfront ~yr_built+floors+sqft_lot+view+price,family=binomial(link='logit'),data=House_Data)
model
summary(model)

input_ones <- House_Data[which(House_Data$waterfront == 1), ]
input_zeros <- House_Data[which(House_Data$waterfront == 0), ]


set.seed(100)  
input_ones_training_rows <- sample(1:nrow(input_ones), 0.7*nrow(input_ones)) 
input_zeros_training_rows <- sample(1:nrow(input_zeros), 0.7*nrow(input_ones))  
training_ones <- input_ones[input_ones_training_rows, ]  
training_zeros <- input_zeros[input_zeros_training_rows, ]
trainingData <- rbind(training_ones, training_zeros)   

# Create Test Data

test_ones <- input_ones[-input_ones_training_rows, ]
test_zeros <- input_zeros[-input_zeros_training_rows, ]
testData <- rbind(test_ones, test_zeros)
predicted <- predict(model, testData, type="response")

AURC <- roc.curve(scores.class0 = predicted, weights.class0=testData$waterfront,
                       curve=TRUE)
plot(AURC)

exp(cbind("Odds ratio" = coef(model), confint.default(model, level = 0.95)))

coef_lmbeta <- lm.beta(model)

car::vif(model)

## =============================================

