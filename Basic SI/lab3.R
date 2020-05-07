## Salar Nouri ----- 810194422 ##
## R-Lab (3)
#======================================

setwd("E:/Bachelor of Science/8th Semester/Statistical Inference/Lab/Lab#3/Codes")
library("ggplot2")

####################################
# Part a) Central Limit Theorem

#Problem (2) ======================

x <- 1:20
y <- spline(dpois(x, lambda = 1))
plot(y,
     type = "l",
     main = "Density Function of a Poisson Distribution",
     xlab = "the Value of x",
     ylab = "Density Function Value",
     col = "blue",
     lwd = 2)
y <- spline(dpois(x, lambda = 2))
lines(y,
      col = "red",
      lwd = 2)
y <- spline(dpois(x, lambda = 3))
lines(y,
      col = "green",
      lwd = 2)
y <- spline(dpois(x, lambda = 4))
lines(y,
      col = "black",
      lwd = 2)
y <- spline(dpois(x, lambda = 5))
lines(y,
      col = "yellow",
      lwd = 2)
y <- spline(dpois(x, lambda = 6))
lines(y,
      col = "orange",
      lwd = 2)
y <- spline(dpois(x, lambda = 7))
lines(y,
      col = "purple",
      lwd = 2)
y <- spline(dpois(x, lambda = 8))
lines(y,
      col = "brown",
      lwd = 2)
y <- spline(dpois(x, lambda = 9))
lines(y,
      col = "pink",
      lwd = 2)
y <- spline(dpois(x, lambda = 10))
lines(y,
      col = "green4",
      lwd = 2)
legend(17,
       0.35,
       title = "Lambda",
       c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"),
       lty = 'solid',
       lwd = c(2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
       col = c("blue", "red", "green", "black", "yellow", "orange", "purple", "brown", "pink", "green4"))

# Problem (3) ========================

population <- rpois(100000, 4)
avg <- mean(population)
hist(population,
     col = "green",
     main = "Histogram of Population",
     xlab = "the Value of x",
     ylab = "Frequency")
abline(v = avg,
       col = "blue",
       lwd = 3)
legend("topright",
       "mean",
       lty = 'solid',
       lwd = 3,
       col = "blue")

# Problem (4) =======================

histplot <- function(x){
  hist(x,
       col = "red",
       main = "Sample Distribution",
       xlab = "the Value of x")
  abline(v = mean(x),
         col = "blue",
         lwd = 3)
}
qqsmooth <- function(x, y){
  plot(qqplot(x,
              y,
              plot.it = FALSE),
       main = "QQ-Plot",
       xlab = "x",
       ylab = "y")
}
s <- matrix(0, 15, 100)
for (i in 1:15) s[i, ] <- sample(population,
                                 size = 100)
par(mfrow = c(3, 5))
apply(s,
      MARGIN = 1,
      function(x) histplot(x))
par(mfrow = c(3, 5))
apply(s,
      MARGIN = 1,
      function(x) qqsmooth(x, population))

# Problem (5) ====================

s <- matrix(0, 500, 50)
for (i in 1:nrow(s)) s[i, ] <- sample(population,
                                      size = 50)
samples_mean <- apply(s,
                      MARGIN = 1,
                      function(x)  mean(x))
par(mfrow = c(1, 1))
hist(samples_mean,
     col = "red",
     breaks = 13,
     main = "Sampling Distribution",
     xlab = "Sample Mean",
     ylab = "Frequency")
qqplot(samples_mean,
       population,
       main = "QQPlot")
qqnorm(samples_mean,
       main = "QQPlot")

# Problem (7) ==============================

avg <- mean(samples_mean)
std <- sd(samples_mean)
mu_hat <- avg
sigma_hat <- sqrt(ncol(s))*std
mean(population)
mu_hat
sd(population)
sigma_hat


##############################
# Part b) Confidence Intervals

# Problem (8) ======================

library(mosaicData)
heights <- Galton$height
heights

# Problem (9) ======================

CI <- function(x, cl){
  avg <- mean(x)
  std <- sd(x)/sqrt(length(x))
  zstar <- qnorm(0.5 + cl/2)
  upperbound <- avg + zstar*std
  lowerbound <- avg - zstar*std
  c(lowerbound, upperbound)
}
samples <- matrix(0, 10000, 50)
for (i in 1:nrow(samples)) samples[i, ] <- sample(heights,
                                                  size = 50)
intervals <- apply(samples,
                   MARGIN = 1,
                   function(x) CI(x, cl = 0.97))
intervals <- t(intervals)
realmean <- mean(heights)
meaninclude <- ifelse(realmean < intervals[, 1], 0,
                      ifelse(realmean < intervals[, 2], 1, 0))
percentage <- sum(meaninclude)/length(meaninclude)
percentage

# Problem (10) ==============================

CI <- function(x, cl){
  avg <- mean(x)
  std <- sd(x)/sqrt(length(x))
  zstar <- qnorm(0.5 + cl/2)
  upperbound <- avg + zstar*std
  lowerbound <- avg - zstar*std
  c(lowerbound, upperbound)
}
samples <- matrix(0, 10000, 10)
for (i in 1:nrow(samples)) samples[i, ] <- sample(heights,
                                                  size = 10)
intervals <- apply(samples,
                   MARGIN = 1,
                   function(x) CI(x, cl = 0.9))
intervals <- t(intervals)
realmean <- mean(heights)
meaninclude <- ifelse(realmean < intervals[, 1], 0,
                      ifelse(realmean < intervals[, 2], 1, 0))
percentage <- sum(meaninclude)/length(meaninclude)
percentage

# Problem (11) ===============================

library(moments)
CI <- function(x, cl){
  if (length(x) < 30){
    print("Warning : Required Conditions Are Not Met. Sample Size is Too Small.")
  }
  if (skewness(x) > 0.2){
    print("Warning : Required Conditions Are Not Met. Too Much Skewness in the Distribution.")
  }
  if (skewness(x) < -0.2){
    print("Warning : Required Conditions Are Not Met. Too Much Skewness in the Distribution.")
  }
  avg <- mean(x)
  std <- sd(x)/sqrt(length(x))
  zstar <- qnorm(0.5 + cl/2)
  upperbound <- avg + zstar*std
  lowerbound <- avg - zstar*std
  data.frame("LowerBound" = lowerbound,"UpperBound" = upperbound)
}

##############################
# Part c) Simple Simulation

# Problem (12) ====================================

sample_height <- sample(heights,
                        size = 60)
SE <- sd(sample_height)/sqrt(length(sample_height))
CL <- seq(0.5, 1, length = 51)
zstar <- qnorm(0.5 + CL/2)
ci_length <- 2*zstar*SE
plot(CL*100,
     ci_length,
     main = "Length of the Confidence Interval with Respect to Confidence Level",
     xlab = "the Value of Confidence Level",
     ylab = "Length of the Confidence Interval")
lines(CL*100,
      ci_length,
      lwd = 2)

# Problem (13) =================================

outcomes <- c(1:6)
sample_dice <- sample(outcomes,
                      size = 15000,
                      replace = TRUE)
barplot(table(sample_dice)/length(sample_dice),
        col = "red",
        main = "Distribution of the Outcomes of Rolling a Fair Dice",
        xlab = "Outcomes",
        ylab = "Probability")
table_dice <- table(sample_dice)
percentage_dice <- table_dice/length(sample_dice)
print("Percentage of each Outcome Category : ")
print(percentage_dice)

# Problem (14) ====================================

outcomes <- c("with butter and jam", "without butter and jam")
sample_toast <- sample(outcomes,
                       size = 1000,
                       replace = TRUE,
                       prob = c(0.6875, 0.3125))
barplot(table(sample_toast),
        col = "red",
        main = "Distribution of the Outcomes",
        xlab = "Outcomes",
        ylab = "Frequency")
barplot(table(sample_toast)/length(sample_toast),
        col = "red",
        main = "Distribution of the Outcomes",
        xlab = "Outcomes",
        ylab = "Probability")

# Problem (15) ================================
outcomes <- c(1:6)
dice1 <- sample(outcomes,
                size = 100000,
                replace = TRUE)
dice2 <- sample(outcomes,
                size = 100000,
                replace = TRUE)
sum_dice <- dice1 + dice2
prob_8 <- sum(sum_dice > 8)/length(sum_dice)
prob_8

##########################
# Part d) Hypothesis Testing

# Problem (16) =============================

library(mosaicData)
Beijing <- Weather[Weather$city == "Beijing", "avg_humidity"]
hist(Beijing,
     col = "red",
     main = "Population Distribution",
     xlab = "Humidity",
     ylab = "Frequency")
samples <- sample(Beijing,
                  size = 70,
                  replace = FALSE)
xbar <- mean(samples)
SE <- sd(samples)/sqrt(length(samples))
null_value <- 50
zscore <- (xbar - null_value)/SE
p_value <- pnorm(abs(zscore), lower.tail = FALSE)*2
p_value

# Problem (18) =============================

library(MASS)
xbar <- mean(shrimp)
SE <- sd(shrimp)/sqrt(length(shrimp))
null_value <- 31
tscore <- (xbar - null_value)/SE
p_value <- pt(tscore, df = length(shrimp)-1)
p_value

# Problem (19) ============================

two_tail_z_dist_mean_hyp_test <- function(x, null_value, alpha){
  library(moments)
  print(paste0("Null Hypothesis : mu = ", null_value))
  print(paste0("Alternative Hypothesis : mu != ", null_value))
  xbar <- mean(x)
  SE <- sd(x)/sqrt(length(x))
  if (abs(skewness(x)) > 0.5){
    print("Warning : Too Much Skewness in the Distribution")
  }
  if (length(x) > 30){
    print("Sample Size is Greater than 30. Using Normal Distribution for Hypothesis Test")
    zscore <- (xbar - null_value)/SE
    p_value <- pnorm(abs(zscore), lower.tail = FALSE)*2
    print(paste0("p-value = ", p_value))
  }
  else{
    print("Sample Size is Smaller than 30. Using T Distribution for Hypothesis Test")
    tscore <- (xbar - null_value)/SE
    p_value <- pt(abs(tscore), df = length(x)-1, lower.tail = FALSE)*2
    print(paste0("p-value = ", p_value))
  }
  if (p_value > alpha){
    print("p-value is greater than the significance level. so we can not reject the null hypothesis")
  }
  else {
    print("p-value is smaller than the significance level. so we can reject the null hypothesis")
  }
}

# Problem (20) ==============================
library(mosaicData)
Beijing <- Weather[Weather$city == "Beijing", "avg_humidity"]
samples <- sample(Beijing,
                  size = 70,
                  replace = FALSE)
two_tail_z_dist_mean_hyp_test(samples,
                              50,
                              0.05)
two_tail_z_dist_mean_hyp_test(shrimp,
                              31,
                              0.05)

###################################################
