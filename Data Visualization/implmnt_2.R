# =================================

## =========   a) Simple Plots
# ====== Problem(1)

require(graphics)
X <- seq(-3.5, 3.5, length = 70)
stdnormal <- dnorm(X, mean = 0, sd = 1)
plot(X,
     stdnormal,
     type = "l",
     main = "Standard Normal Distribution",
     xlab = "x",
     ylab = "Probability Density Function")

# ===== Problem(2)

par(mfrow = c(2,2))
Sample_Size <- c(10, 25, 100, 2000)
X1 <- rnorm(Sample_Size[1], mean = 0, sd = 1)
X2 <- rnorm(Sample_Size[2], mean = 0, sd = 1)
X3 <- rnorm(Sample_Size[3], mean = 0, sd = 1)
X4 <- rnorm(Sample_Size[4], mean = 0, sd = 1)

X1 <- X1[order(X1)]
X2 <- X2[order(X2)]
X3 <- X3[order(X3)]
X4 <- X4[order(X4)]

Y1 <- dnorm(X1, mean = 0, sd = 1)
Y2 <- dnorm(X2, mean = 0, sd = 1)
Y3 <- dnorm(X3, mean = 0, sd = 1)
Y4 <- dnorm(X4, mean = 0, sd = 1)

plot(X1,
     Y1,
     type = "l",
     main = "Standard Normal Distribution",
     sub = "Sample Size = 10",
     xlab = "x",
     ylab = "Probability Density Function",
     col = "blue")

plot(X2,
     Y2,
     type = "l",
     main = "Standard Normal Distribution",
     sub = "Sample Size = 25",
     xlab = "x",
     ylab = "Probability Density Function",
     col = "blue")

plot(X3,
     Y3,
     type = "l",
     main = "Standard Normal Distribution",
     sub = "Sample Size = 100",
     xlab = "x",
     ylab = "Probability Density Function",
     col = "blue")

plot(X4,
     Y4,
     type = "l",
     main = "Standard Normal Distribution",
     sub = "Sample Size = 1000",
     xlab = "x",
     ylab = "Probability Density Function",
     col = "blue")

# ====== Problem(3)

X <- seq(-20, 20, length = 1000)
Y1 <- dt(X, df = 1)
Y2 <- dt(X, df = 2)
Y3 <- dt(X, df = 5)
Y4 <- dt(X, df = 10)

plot(X,
     Y1,
     type = "l",
     main = "T-Student Distribution",
     xlab = "X",
     ylab = "Probability Density Function",
     col = "blue",
     lwd = 2)

lines(X,
      Y2,
      type = "l",
      col = "red",
      lwd = 2)

lines(X,
      Y3,
      type = "l",
      col = "green",
      lwd = 2)

lines(X,
      Y4,
      type = "l",
      col = "black",
      lwd = 4)

legend("topleft",
       title = "Degree of Freedom",
       c("1", "2", "5", "10"),
       lty = 'solid',
       lwd = c(2, 2, 2, 4),
       col = c("blue", "red", "green", "black"))

# ===============================
# ========= b) QQ-Plots, Histograms, Box-Plots and Pie-Charts

# ==== Problem (4)

par(mfrow = c(1, 1))
qqnorm(quantile(precip, probs = seq(0.01, 0.99, 0.01)))
qqline(quantile(precip, probs = seq(0.01, 0.99, 0.01)))

# === Problem (5)

par(mfrow = c(2,2))
hist(precip,
     breaks = 7,
     main = "Histogram with 7 Bins",
     xlab = "X",
     ylab = "Frequency",
     col = "blue")
hist(precip,
     breaks = 13,
     main = "Histogram with 13 Bins",
     xlab = "X",
     ylab = "Frequency",
     col = "blue")
hist(precip,
     breaks = 30,
     main = "Histogram with 30 Bins",
     xlab = "X",
     ylab = "Frequency",
     col = "blue")
hist(precip,
     breaks = 13,
     prob = TRUE,
     main = "Histogram of Densities with 13 Bins",
     xlab = "X",
     ylab = "Probability Density Function",
     col = "blue")

# ===== Problem (6)


par(mfrow = c(1, 1))
hist(precip,
     breaks = 13,
     prob = TRUE,
     main = "Histogram of Densities with 13 Bins",
     xlab = "X",
     ylab = "Probability Density Function",
     col = "green",
     lwd = 2)
lines(density(precip, adjust = 2),
      lwd = 3,
      col = "blue")
legend("topleft",
       title = "Legend",
       c("Smooth Curve"),
       lty = 'solid',
       lwd = c(3),
       col = c("blue"))

# ===== Problem (7)

boxplot(rivers,
        main = "Boxplot Corresponding to the Length of Major North American Rivers")

# ===== Problem (8)

lower_whisker <- boxplot(rivers)$stats[1]
upper_whisker <- boxplot(rivers)$stats[5]
outliers <- c(rivers[which(rivers > upper_whisker)], rivers[which(rivers < lower_whisker)])
lower_whisker
upper_whisker
outliers

# ===== Problem (9)

tiny <- sum(rivers < 500)
short <- sum(rivers > 500 & rivers < 1500)
medium <- sum(rivers > 1500 & rivers < 3000)
long <- sum(rivers > 3000)
slices <- c(tiny, short, medium, long)
lbls <- c("Tiny", "Short", "Medium", "Long")
pct <- round(slices/length(rivers)*100)
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "%", sep = " ")
pie(slices,
    labels = lbls,
    col = rainbow(length(lbls)),
    main = "Pie Chart of Rivers")

# ==== Problem (10) 

setwd("E:/Bachelor of Science/8th Semester/Statistical Inference/Lab/Lab#2/Codes")
mpg <- read.csv(file = "mpg.csv")
boxplot(mpg$displ ~ mpg$class)

# ===============================
# ========= c) ggplot2

# ===== Problem (11)

library(ggplot2)
Age <- Orange$age
Circumference <- Orange$circumference
qplot(Age,
      Circumference,
      main = "Scatter plot of Circumference vs. Age",
      xlab = "Age",
      ylab = "Circumference")

# ===== Problem (12)

library(ggplot2)
Age <- Orange$age
Circumference <- Orange$circumference
Tree <- Orange$Tree
qplot(Age,
      Circumference,
      main = "Scatter plot of Circumference vs. Age",
      xlab = "Age",
      ylab = "Circumference",
      color = Tree) + scale_color_manual(breaks = c("1", "2", "3", "4", "5"),
                                         values = c("green", "red", "blue", "yellow", "black"))

# ===== Problem (13)

ggplot(Orange, aes(x = age, y = circumference)) + geom_point() + geom_smooth(method = "loess")

# ===== Problem(14)

ageGroup <- vector(mode = "character", length = length(Orange$age))
ageGroup[Orange$age < 250] <- "Young"
ageGroup[Orange$age > 250 & Orange$age < 900] <- "Adult"
ageGroup[Orange$age > 900] <- "Old"
orangeplus <- data.frame(Orange, ageGroup)
ggplot(orangeplus,
       aes(x = ageGroup, y = Circumference,
           color = Tree,
           fill = Tree)) +
  geom_bar(stat = "identity",
           position = position_dodge()) +
  coord_flip() +
  scale_x_discrete(limits = c("Young", "Adult", "Old")) +
  scale_fill_manual(values = c("cadetblue3", "deepskyblue4", "darkolivegreen1", "green4", "lightpink")) +
  scale_color_manual(values = c("cadetblue3", "deepskyblue4", "darkolivegreen1", "green4", "lightpink")) +
  ggtitle("Growth of Orange Trees") +
  theme_bw()

# ===============================
# ========= d) ggmap

# ===== Problem (17)

centers_df <- data.frame(State = state.name, Latitude = state.center$x, Longitude = state.center$y)
centers_df

# ===== Problem (18)

require(ggplot2)
map <- get_stamenmap(bbox = c(left = -150.2, bottom = 18.91619, right =
                                -66.4, top = 52.4), zoom = 5, maptype = "terrain", crop = TRUE, messaging = FALSE, urlonly = FALSE,
                     color = c("color", "bw"), force = FALSE, where = tempdir())
ggmap(map) + geom_point(data = centers_df, aes(x = state.center$x, y = state.center$y), color='blue', size=3, alpha=0.4)

