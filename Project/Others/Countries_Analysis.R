## Countries of the worlds -----  Engineering Probability and Statistics
##============================

# Problem 1
data <- read.csv("countries of the world.csv") 
for(col in names(data)){ 
  col_data <- data[,col]
  no_data = sum(col_data == "")
  percentage <- sum(col_data == "")/length(col_data) 
  cat("There are", no_data, "ungiven values in", col,"column with the percentage of",percentage,"%\n")
}

#------------------------------------

# Problem 2
pop <- data$Population
boxplot(pop, horizontal = TRUE, xlab = "Population", ylab = "Country")
summary(pop)
hist(pop, xlab = "Population")
plot(ecdf(pop))

#------------------------------------

# Problem 3
random <- sample(pop, 100)
rand_mean <- mean(random)
rand_var <- var(random)
rand_sd <- sd(random)
qqnorm(random)
d <- qt(0.05, 99) * rand_sd / 10
top_bound <- rand_mean + d
bot_bound <- rand_mean - d
q <- (rand_mean - 80)/(sqrt(rand_var)/10)
upper <- qnorm(1 - 0.05/2)
lower <- (-upper)

#------------------------------------

# Problem 4

lit <- as.numeric(data$Literacy....)
ind <- as.numeric(data$Industry)
scatter.smooth(lit, ind, xlab = "literacy", ylab = "industry")
cor(lit, ind, method = "spearman")
cor(lit, ind, method = "pearson")
qqplot(lit, ind, xlab = "literacy", ylab = "industry")

#------------------------------------

# Problem 5

plot(dpois(x = 0:20, lambda = 1), type="b")
plot(dpois(x = 0:20, lambda = 10), type="b")
plot(dpois(x = 0:20, lambda = 100), type="b")

plot(0:100, dpois( x=0:100, lambda=80 ), xlim=c(-2,100));
normden <- function(x){dnorm(x, mean=80, sd=sqrt(80))}
curve(normden, from=-4, to=100, add=TRUE, col="blue");

sample_means = rep(NA, 5)#taking five samples and their means saved in sample_means
for(i in 1:5){
  sample_means[i] = mean(rpois(50,4))
}
plot(density(sample_means)); #plot!


sample_means2 = rep(NA, 10)#taking 10 samples and their means saved in sample_means
for(i in 1:10){
  sample_means2[i] = mean(rpois(50,4))
}
plot(density(sample_means2)); #plot!

sample_means3 = rep(NA, 50)#taking 50 samples and their means saved in sample_means
for(i in 1:50){
  sample_means3[i] = mean(rpois(50,4))
}
plot(density(sample_means3)); #plot!

sample_means4 = rep(NA, 500)#taking 500 samples and their means saved in sample_means
for(i in 1:500){
  sample_means4[i] = mean(rpois(50,4))
}
plot(density(sample_means4)); #plot!

sample_means5 = rep(NA, 5000)#taking five samples and their means saved in sample_means
for(i in 1:5000){
  sample_means5[i] = mean(rpois(50,4))
}
plot(density(sample_means5)); #plot!



qqnorm(sample_means);
qqline(sample_means);

qqnorm(sample_means2);
qqline(sample_means2);

qqnorm(sample_means3);
qqline(sample_means3);

qqnorm(sample_means4);
qqline(sample_means4);

qqnorm(sample_means5);
qqline(sample_means5);

#------------------------------------

# Problem 6
lit <- as.numeric(data$Literacy....)
ind <- as.numeric(data$Industry)
rnd_lit <- sample(lit, 200)
rnd_ind <- sample(ind, 200)
lin_mod <- lm(rnd_lit ~ rnd_ind)
coeff <- lin_mod[["coefficients"]]
X <- c(min(lit), max(ind))
Y <- c(coeff[1] * min(lit) + coeff[2], coeff[1] * max(ind) + coeff[2])
plot(X, Y, type="o", xlab = "literacy", ylab = "industry")


#------------------------------------
