### Statistical Inference -----========
### Project Phase (I) ---- Salar Nouri ------ 810194422 --- =====

## ==============================================

## ======== Library

install.packages("ggplot2")
install.packages("moments")
install.packages("corrgram")
install.packages("ggcorrplot")
install.packages("gmodels")
install.packages("pwr")
install.packages("ppcor")

library(ggplot2)
library(moments)
library(corrgram)
library(ggcorrplot)
library(gmodels)
library(pwr)
library(ppcor)


## ======== dataset Loader

setwd("C:/Users/Salar/Desktop/phase1_project_SI/Codes")
House_Sales_Info<- read.csv("House Sales.csv")

## ======== Question (0) ----- Missing Values

missing_Price_var<-colSums(is.na(House_Sales_Info))
missing_Price_var
sum(missing_Price_var)

## ======== question (1) ----- Numerical Univariate Analysis

Price_var <- House_Sales_Info$price
Price_var <- Price_var/1000

## ==  Part (1)

qplot(Price_var,
      binwidth = 147,
      geom = "histogram",
      main = "Price Histogram ",
      xlab = " * 1000$",
      ylab = "Number",
      col = 'gray' )

## == Part (2)

qplot(Price_var,
      geom = "density",
      main = "Price Density",
      xlab = "* 1000$", fill="gray")

## == Part (3)

Skewness = skewness(Price_var)
Skewness

## == Part (4)

Price_Mean <- mean(Price_var)
Price_std_deviation <- sd(Price_var)
Price_variance <- var(Price_var)
Price_Mean
Price_std_deviation
Price_variance

## == Part (5)

Price_box_plot<- ggplot(House_Sales_Info, aes(x="", y=Price_var)) + ylab(" * 1000$") + ggtitle("Price Boxplot") + geom_boxplot()
Price_box_plot

Price_Info <- summary(Price_var)
Price_Info
Price_Info[2] # Lower Quartile
Price_Info[5] # Upper Quartile

IQR <- IQR(Price_var)
IQR

temp1 <- Price_Info[2] - 1.5*IQR
Lower_Whisker = max(temp1, Price_Info[1])
Lower_Whisker

temp2 <- Price_Info[2] + 1.5*IQR
Upper_Whisker = min(temp2, Price_Info[6])
Upper_Whisker

## === Part (6)

Upper_Outliers <- Price_var[ Price_var > Upper_Whisker]
length(Upper_Outliers)

Lower_Outliers <- Price_var[ Price_var < Lower_Whisker]
length(Lower_Outliers)


## ======== question (2) ----- Bivariate Correlation 


## == Part (1)

ggplot(House_Sales_Info, aes( x = price, y = sqft_living )) + geom_point()

## == Part (2)

ggplot(House_Sales_Info, aes(x = view, y = sqft_living)) + geom_point()

## == Part (3)

plot(House_Sales_Info[House_Sales_Info$waterfront == '0',]$price,
     House_Sales_Info[House_Sales_Info$waterfront == '0',]$sqft_living, xlab = 'Price', ylab = 'basement_Sqft', main='Association with Waterfront',
     xlim = c(0,8000000), ylim = c(0,10000), col = 'lightblue', col.axis = 'green',
     pch = 8)

par(new = TRUE)

plot(House_Sales_Info[House_Sales_Info$waterfront == '1',]$price,
     House_Sales_Info[House_Sales_Info$waterfront == '1',]$sqft_living, xlab = 'price', ylab = 'basement_Sqft', main='Association with Waterfront',
     xlim=c(0,8000000), ylim=c(0,10000), col='lightblue', col.axis = 'gray',
     pch=16)

legend("topright",c("waterfront", "notwaterfront"), col = c("red", "blue"), cex=0.5, pch=c(16,8))

## == Part (4)

Correlation_Coe <- cor.test(House_Sales_Info$price, House_Sales_Info$sqft_living, method = "pearson")
Correlation_Coe$estimate

## == Part (6)


print(ggplot(House_Sales_Info, aes(price,sqft_living)) + ggtitle("2D Density plot") + geom_point() + geom_density2d(aes(price,sqft_living)))

print(ggplot(House_Sales_Info, aes(price,sqft_living)) + ggtitle("2D Histogram plot") + geom_bin2d(bins = 95) + theme_bw())


## ======== question (3) ----- Multivariate Correlation 

## == Part (1)

House_Price <- House_Sales_Info$price
Sqft_Living <- House_Sales_Info$sqft_living
Bedrooms <- House_Sales_Info$bedrooms
Bathrooms <- House_Sales_Info$bathrooms
Floors <- House_Sales_Info$floors
Sqft_Lot <- House_Sales_Info$sqft_lot
Long <- House_Sales_Info$long
Lat <- House_Sales_Info$lat
athree <- data.frame(House_Price, Floors, Bedrooms, Sqft_Living, Bathrooms)
tthree <- data.frame(House_Price, Floors, Bedrooms, Sqft_Living,Bathrooms, Sqft_Lot, Long, Lat)

corrgram(athree, order=TRUE, lower.panel=panel.pts,upper.panel=NULL, text.panel=panel.txt,main = "Bivariate Relations Between the Variables")

## == Part (3)

heat_map <- cor(athree,method="pearson")
heat_map <- round(heat_map,2)

ggcorrplot(heat_map, hc.order = TRUE, type = "lower",lab = TRUE)

heat_map2 <- cor(tthree, method = "pearson")
heat_map2 <- round(heat_map2, 2)
ggcorrplot(heat_map2, hc.order = TRUE, type = "lower",lab = TRUE)


## == Part (4)

pcor.test(House_Sales_Info$bedrooms, House_Sales_Info$floors, House_Sales_Info$sqft_living, method = "pearson" )

## ======== question (4) ----- Categorical Univariate Analysis 

## == Part (1)

Condition <- House_Sales_Info$condition
qplot(Condition, geom = "bar", main = "Condition Barplot")

## == Part (2)

Freq_Table <- table(Condition)
Freq_Table

## == Part (3)

ggplot(House_Sales_Info,aes(x="", y = Condition)) + geom_violin()


## ======== question (5) ----- Categorical Bivariate Analysis

Categorical_1 <- House_Sales_Info$condition

Categorical_2 <- House_Sales_Info$waterfront

## == Part (1) Grouped bar chart

Temp_1 <- which(Categorical_1 == 1)
Categorical_1[Temp_1] = "Very Bad"

Temp_2 <- which(Categorical_1 == 2)
Categorical_1[Temp_2] = "Bad"

Temp_3 <- which(Categorical_1 == 3)
Categorical_1[Temp_3] = "Average"

Temp_4 <- which(Categorical_1 == 4)
Categorical_1[Temp_4] = "Good"

Temp_5 <- which(Categorical_1 == 5)
Categorical_1[Temp_5]="Very Good"


Temp_6 <- which(Categorical_2 == 1)
Categorical_2[Temp_6]="Yes"

Temp_7 <- which(Categorical_2 == 0)
Categorical_2[Temp_7]="No"

Condition_Level <- Categorical_1
Waterfront_Exist <- Categorical_2

ggplot(House_Sales_Info, aes(x = Condition_Level, fill = Waterfront_Exist)) + geom_bar(position = "dodge") + scale_x_discrete(limits = c("Very Bad", "Bad", "Average", "Good", "Very Good"))

## == Part (2) 

table(Condition_Level, Waterfront_Exist)

## == Part (3)

qplot(x = Condition_Level, data = House_Sales_Info) + geom_bar(aes(fill = Waterfront_Exist )) 
+ ggtitle("Segmented Bar Plot") 
+ scale_x_discrete(limits =c("very bad","bad","average","good","very good"))

## == Part (4)

spineplot(factor(Condition_Level)~factor(Waterfront_Exist), xlab = "Waterfront Exist", ylab = "Condition Level")


## ======== question (6) ----- Distribution Analysis among Groups 

## == Part (1)

House_Sales_Info_Sampled <- House_Sales_Info[sample(nrow(House_Sales_Info), 200), ]

Categorical_1 <- House_Sales_Info_Sampled$condition

Temp_1 <- which(Categorical_1 == 1)
Categorical_1[Temp_1] = "Very Bad"

Temp_2 <- which(Categorical_1 == 2)
Categorical_1[Temp_2] = "Bad"

Temp_3 <- which(Categorical_1 == 3)
Categorical_1[Temp_3] = "Average"

Temp_4 <- which(Categorical_1 == 4)
Categorical_1[Temp_4] = "Good"

Temp_5 <- which(Categorical_1 == 5)
Categorical_1[Temp_5] = "Very Good"

Condition_Level <-Categorical_1
House_Price <- House_Sales_Info_Sampled$price


plt_1 <- ggplot(House_Sales_Info_Sampled, aes(Condition_Level, House_Price))
plt_1 + geom_boxplot() + ggtitle("Box plot") + scale_x_discrete(limits = c("Very Bad", "Bad", "Average", "Good", "Very Good"))


plt_2 <- ggplot(House_Sales_Info_Sampled, aes(Condition_Level, House_Price))
plt_2 + geom_point() + geom_jitter() + ggtitle("Jitter Plot") + scale_x_discrete(limits = c("Very Bad", "Bad", "Average", "Good", "Very Good"))

plt_3 <- ggplot(House_Sales_Info_Sampled, aes(Condition_Level, House_Price))
plt_3 + geom_point() + geom_violin()+ggtitle("Violin Plot") + scale_x_discrete(limits = c("Very Bad", "Bad", "Average", "Good", "Very Good"))


## ======== question (7) ----- Univariate Hypothesis Testing 

House_Price <- House_Sales_Info$price

## == Part (1)

ci(x = House_Price, confidence = 0.98, alpha = 0.02)

## == Part (3)

House_Price_df <- House_Sales_Info[,"price"]

Pop_mean = mean (House_Price_df)
Sample_Mean <- 533270

House_Price_std <- sd(House_Price_df)
d <- (Sample_Mean - Pop_mean)/House_Price_std

pwr.t.test( d = d, power = 0.5, sig.level = 0.02, type = "one.sample", alternative = "two.sided")

## == Part (4)

power = 0.5
alpha = 0.05
Type_Error_I <- alpha
Beta <- 1 - power
Type_Error_II <- Beta

## ======== question (8) ----- Bivariate Hypothesis Testing 

## Part (3)

House_Sales_Info_Sampled <- House_Sales_Info[sample(nrow(House_Sales_Info), 25), ]

Temp_1 <- House_Sales_Info_Sampled$sqft_living
Temp_2 <- House_Sales_Info_Sampled$sqft_living15

t.test(Temp_1, Temp_2, alternative = "two.sided")

## ======== question (9) ----- Analysis of Variances among Groups

Sampled_Data <- House_Sales_Info$price
Categorical_1 <- House_Sales_Info$condition

## == Part (1)

Anova <- aov(House_Sales_Info$price ~ House_Sales_Info$condition)
summary(Anova)
Anova

## == Part (2)

idx_1<- which(Categorical_1 == 1)
idx_2<- which(Categorical_1 == 2)


Sampled_Data_1 <- Sampled_Data[idx_1]
Sampled_Data_2 <- Sampled_Data[idx_2]

t.test(Sampled_Data_1, Sampled_Data_2, alternative = "two.sided", Price_var.equal = FALSE)


## ================================================== ##
