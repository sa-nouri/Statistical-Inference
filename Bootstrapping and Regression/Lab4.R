# =========================


setwd("/Bootstrapping and Regression")

# a) Bootstrapping ----------------------

# Problem (1) =======

original_sample <- airquality$Solar.R
bootstrap_populations <- replicate(1000,
                                   sample(original_sample,
                                          size = 1000,
                                          replace = TRUE))
medians <- apply(X = bootstrap_populations,
                 MARGIN = 2,
                 FUN = median,
                 na.rm = TRUE)
medians

# Problem (2) =======

CI <- quantile(medians, c(0.05, 0.95))
print("Confidence Interval Using the Percentile Method : ")
print(CI)

# Problem (3) =======

SE <- sd(medians)
tstar <- qt(0.95, df = length(medians) - 1)
upperbound <- median(original_sample, na.rm = TRUE) + tstar*SE
lowerbound <- median(original_sample, na.rm = TRUE) - tstar*SE
print(paste0("Confidence Interval : ( ", lowerbound, " to ", upperbound, " )"))

# Problem (5) =======

source("inference.R")
inference(original_sample,
          type = "ci",
          method = "simulation",
          conflevel = 0.9,
          est = "median",
          boot_method = "perc")
inference(original_sample,
          type = "ci",
          method = "simulation",
          conflevel = 0.9,
          est = "median",
          boot_method = "se")

# b) Simulation -----------------------

# Problem (6)

library(COUNT)
risk <- ifelse(ships$incidents > 10, "High", "Low")
ships$Risk <- risk

# Problem (7)

dataset <- ships$Risk[ships$type == "B"]
inference(dataset,
          est = "proportion",
          type = "ht",
          method = "simulation",
          null = 0.5,
          alternative = "greater",
          success = "High",
          siglevel = 0.05)

# c) Linear Regression, Multiple Linear Regression ---------------

# Problem  (9)

library(mosaicData)
library(ggplot2)
ggplot(data = Galton,
       aes(x = father, y = height)) +
  geom_point() +
  ggtitle("Scatter Plot Corresponding to the Heights of the Children and their Fathers") +
  xlab("Height of the Father") +
  ylab("Height of the Child")

# Problem  (10)

corr_coeff <- cor(Galton$father, Galton$height)
corr_coeff

# Problem  (11)

height_model <- lm(height ~ father, data = Galton)
summary(height_model)

# Problem  (13)

heights <- data.frame("father" = c(70, 75, 80))
predict(object = height_model,
        newdata = heights,
        interval = "prediction",
        type = "response")

# Problem  (14)

height_model <- lm(height ~ father + mother, data = Galton)
summary(height_model)

# Problem (15)

residuals <- resid(height_model)
hist(residuals,
     col = "gray",
     main = "Histogram Corresponding to Residuals")

# Problem (16)

qqnorm(residuals)

# Problem (17)

qplot(x = Galton$father,
      residuals,
      main = "Plot Corresponding to Residuals with Respect to Height of the Fathers",
      xlab = "Height of the Fathers",
      ylab = "Residuals")
qplot(x = Galton$mother,
      residuals,
      main = "Plot Corresponding to Residuals with Respect to Height of the Mothers",
      xlab = "Height of the Mothers",
      ylab = "Residuals")

# Problem (18)

plot(residuals,
     main = "Residuals of the Fitted Model with Respect to their Indices",
     xlab = "Indices",
     ylab = "Residuals")

# Problem (19)

height_model <- lm(height ~ father + mother + sex, data = Galton)
summary(height_model)

# Problem (21)

model_1 <- lm(height ~ father + mother + sex + family + nkids, data = Galton)
summary(model_1)
model_2 <- lm(height ~ father + mother + sex + nkids, data = Galton)
summary(model_2)
model_3 <- lm(height ~ father + mother + sex , data = Galton)
summary(model_3)


## ==== Winner Model ====

final_model <- lm(height ~ father + mother + sex, data = Galton)
summary(final_model)


## ==== Checking Conditions ====


residuals <- resid(final_model)
qqnorm(residuals)
fitted_values <- predict.lm(final_model,interval="prediction",type="response")
plot(fitted_values[,1],abs(residuals),xlab="fitted values")

plot(residuals)

plot(residuals~Galton$father,xlab="father")
plot(residuals~Galton$mother,xlab="mother")
plot(residuals~Galton$sex,xlab="sex")


## d) Logistic Regression --------------------

# Problem (22)

data("titanic")
raw_model <- glm(survived ~ age + sex + class,
                 data = titanic,
                 family = binomial)
summary(raw_model)

# Problem (23)

data <- data.frame("class" = "2nd class", "age" = "adults", "sex" = "man")
pred <- predict(object = raw_model,
                newdata = data,
                interval = "prediction",
                type = "response")
print(paste0("probability of survival : ", pred))

# Problem (24)

age <- c("adults", "child")
sex <- c("man", "women")
class <- c("1st class", "2nd class", "3rd class")
conditions <- expand.grid("class" = class,
                          "sex" = sex,
                          "age" = age)
conditions$probability_of_survival <- predict(object = raw_model,
                                              newdata = conditions,
                                              interval = "prediction",
                                              type = "response")
conditions <- conditions[order(-conditions$probability_of_survival), ]
print("probability of survival for all possible cases in the titanic incident : ")
conditions

# Problem (25)

data <- titanic[c("class", "sex", "age")]
titanic$probability_of_survival <- predict(object = raw_model,
                                           newdata = data,
                                           interval = "prediction",
                                           type = "response")
titanic$survival_prediction <- ifelse(titanic$probability_of_survival > 0.5, "yes", "no")
accuracy <- sum(titanic$survival_prediction == titanic$survived)/nrow(titanic)*100
print(paste0("percentage of the cases that out model predicted correctly : ", accuracy))


## +++++++++++++++++++===============================++++++++++++++++++++++++##