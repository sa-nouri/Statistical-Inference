## PUBG Players Statistics ----- R Project 
#------------------------------------------

PUBG_Player_Statistics <- read.csv(file="PUBG_Player_Statistics.csv")

# PART 1

sum(is.na(PUBG_Player_Statistics))
sum(is.na(PUBG_Player_Statistics$tracker_id))/length(PUBG_Player_Statistics$tracker_id)
sum(is.na(PUBG_Player_Statistics$solo_KillDeathRatio))/length(PUBG_Player_Statistics$solo_KillDeathRatio)
sum(is.na(PUBG_Player_Statistics$solo_WinRatio))/length(PUBG_Player_Statistics$solo_WinRatio)

#-----------------------------------

# PART 2

boxplot(PUBG_Player_Statistics$tracker_id, horizontal = T, main="Box Plot", ylab="Tracker ID")
quantile(PUBG_Player_Statistics$tracker_id)
hist(PUBG_Player_Statistics$tracker_id)
CDF_Plot=ecdf(PUBG_Player_Statistics$tracker_id)

#-----------------------------------

#PART 3

Sample_Solo_KillDeathRatio <- sample((PUBG_Player_Statistics$solo_KillDeathRatio), 100, replace = FALSE)
Mean_Sample_solo_KillDeathRatio <- mean(Sample_Solo_KillDeathRatio)
Var_Sample_solo_KillDeathRatio <- var(Sample_Solo_KillDeathRatio)
sd_Sample_solo_KillDeathRatio <- sd(Sample_Solo_KillDeathRatio)

Error <- qnorm(0.975)*sd_Sample_solo_KillDeathRatio/sqrt(100)
UpperBound <- Mean_Sample_solo_KillDeathRatio + Error
LowerBound <- Mean_Sample_solo_KillDeathRatio - Error
Confidence_Interval <- c(LowerBound, UpperBound)

Null_Hypothesis_two_Tailed <- 2
t_Two_Tailed <- (Mean_Sample_solo_KillDeathRatio - 2)/(sd_Sample_solo_KillDeathRatio/sqrt(100))
P_Value <- 2*pt(-abs(t_Two_Tailed), df=99)

# P_value is bigger than alpha so we failed to reject the null hypothesis
# because it was in the confidence interval

Null_Hypothesis_Right_tailed <- 1.5
t_Right_Tailed <- (Mean_Sample_solo_KillDeathRatio - Null_Hypothesis_Right_tailed)/(sd_Sample_solo_KillDeathRatio/sqrt(100))
P_Value_Right_Tailed <- pt(-abs(t_Right_Tailed), df=100-1)
print(P_Value_Right_Tailed)
# P-Value_Right_Tailed is less than alpha so we rejected the null hypothesis
# because it was out of the cnfidence interval

#-----------------------------------

# PART 4

plot(PUBG_Player_Statistics$solo_WinRatio, PUBG_Player_Statistics$solo_KillsPg, main = "Scatter Plot", xlab = "Win Ratio", ylab = "Kills", las = 1, cex = 0.3, pch=8)
cor(PUBG_Player_Statistics$solo_WinRatio, PUBG_Player_Statistics$solo_KillsPg, method = "pearson", use = "pairwise.complete.obs")
cor(PUBG_Player_Statistics$solo_WinRatio, PUBG_Player_Statistics$solo_KillsPg, method = "spearman", use = "pairwise.complete.obs")
qqplot(PUBG_Player_Statistics$solo_WinRatio,PUBG_Player_Statistics$solo_KillsPg, xlab = "Win Ratio", ylab = "Kills", main ="Q-Q Plot", las = 1)

# PART 5

# A

plot(0:100, dpois(x=0:100, lambda = 10), xlim = c(-10,30), las = 1)
normden <- function(x){dnorm(x, mean = 10, sd = sqrt(10))}
curve(normden, from = 0, to = 30, add = TRUE, col = "red")

plot(0:100, dpois(x=0:100, lambda = 30), xlim = c(10,50), las = 1)
normden <- function(x){dnorm(x, mean = 30, sd = sqrt(30))}
curve(normden, from = 10, to = 50, add = TRUE, col = "red")

plot(0:100, dpois(x=0:100, lambda = 50), xlim = c(30,70), las = 1)
normden <- function(x){dnorm(x, mean = 50, sd = sqrt(50))}
curve(normden, from = 30, to = 70, add = TRUE, col = "red")

plot(0:100, dpois(x=0:100, lambda = 80), xlim = c(60,100), las = 1)
normden <- function(x){dnorm(x, mean = 80, sd = sqrt(80))}
curve(normden, from = 60, to = 100, add = TRUE, col = "red")

# B

Sample_Poisson <- rep(NA, 5)
for(i in 1:5)
{Sample_Poisson[i] = mean(rpois(50,4))}
plot(density(Sample_Poisson), las = 1)

Sample_Poisson2 <- rep(NA, 10)
for(i in 1:10)
{Sample_Poisson2[i] = mean(rpois(50,4))}
plot(density(Sample_Poisson2), las = 1)

Sample_Poisson3 <- rep(NA, 500)
for(i in 1:500)
{Sample_Poisson3[i] = mean(rpois(50,4))}
plot(density(Sample_Poisson3), las = 1)

Sample_Poisson4 <- rep(NA, 5000)
for(i in 1:5000)
{Sample_Poisson4[i] = mean(rpois(50,4))}
plot(density(Sample_Poisson4), las = 1)

#-----------------------------------

# PART 6

Dataset_200Sample <- PUBG_Player_Statistics[sample(nrow(PUBG_Player_Statistics),200),]
plot (Independant_Variable, Dependant_Variable,xlim = c(0,15), las =1, ylab = "Wins", xlab = "Kills" )
mod <- lm (Dependant_Variable~ Independant_Variable)
abline(mod, col ="gray")

chosenVar1 <- PUBG_Player_Statistics$solo_MoveDistancePg
chosenVar1 <- as.numeric(chosenVar1)


sample_data1 <- sample(chosenVar1, 200)

#vabaste:
chosenVar2 <- PUBG_Player_Statistics$solo_RoundsPlayed
sample_data2 <- sample(chosenVar2, 200)


plot(chosenVar1, chosenVar2, pch = 16, cex = 1.3, col = "blue", main = "Regression Line", xlab = "solo_MoveDistancePg", ylab = "solo_RoundsPlayed")
lm(chosenVar1 ~ chosenVar2, data = PUBG_Player_Statistics)
abline(lm(chosenVar1 ~ chosenVar2), col ="red")

#-----------------------------------
#-----------------------------------