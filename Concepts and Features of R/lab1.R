# Statistical Inference ---- Lab(1)
# Salar Nouri ----- 810194422
# =================================
## =========   a) Variable and Types
x = 3 
y = 2
a <- x + y

# Problem(3)

# Successfull Casting
a <- 2L 
b <- 3
class(a)
class(b)
xx <- a + b

# Unsuccessfull Casting

a = 4
c = "H"
class(a)
class(c)
yy <- a + c

# Problem (4)

sum <- FALSE + TRUE
typeof(sum)

sum <- FALSE | TRUE
typeof(sum)

#  ====================
## ========= c) Vectors 

# Problem (6)

vec <- c(1:69)
vec

# Problem (7)

vec_mix <- c(5, "Truck", FALSE)
typeof(vec_mix)

# Problem (8)

first_feature <- c(1:150)
first_feature

# Problem (9)

len_first_feature = length(first_feature)
len_first_feature

# Problem (10)

mean(first_feature)
var(first_feature)
sd(first_feature)
median(first_feature)

# Problem (11)

plot(first_feature)

# Problem (12)

x <- c(first_feature[15:27])
x

# Problem (13)

y <- c(first_feature[15],first_feature[18],first_feature[21],first_feature[22],first_feature[53])
y

# Problem (14)

z <- c(x,y)
z


# Problem (15)

string_1 <- c("barney","robin", "ted", "lily", "marshall", "tracy" )
temp_a <- ifelse(grepl("a",string_1),1,0)
temp_l <- ifelse(grepl("l",string_1),1,0)
Num_elm <- sum(temp_a) + sum(temp_l)
Num_elm

# ================================

## ====== d) Factors

# Problem (17)

directions <- c("West","East","East","South","West","West")
second_feature <- factor(directions)
second_feature[1] <- "North"
levels(second_feature)

# Problem (18)

directions <- c("West","East","East","South","West","West")
second_feature <- factor(directions)
levels(second_feature) <- c(levels(second_feature),"North")
levels(second_feature)

# Problem (19)

second_feature[1] <- "North"
second_feature

# ================================

## ====== e) Missing Values

# Problem (21)

first_feature <- c(1:150)
first_feature[1] <- NA
first_feature

# Problem (22)

mean(first_feature)
mean(first_feature, na.rm = TRUE)

# Problem (23)

is.na(first_feature)
which(is.na(first_feature))

# ================================

## ====== f) Lists

# Problem (26)

list_1 <- list(4, 5, 6, list(6, 4, "abc"))
list_1[1]
list_1[[1]]
typeof(list_1[1])
typeof(list_1[[1]])
class(list_1[1])
class(list_1[[1]])

# ================================

## ====== g) Naming

# Problem (27)

named_list <- list(a = 1, b = 2, c = 3, d = c(4, 5, 6, 7))
named_list["b"]
named_list[["b"]]
named_list$b


# ================================

## ====== h) Data Frames

# Problem (28)

Orange
ncol(Orange)

# Problem (29)

nrow(Orange)

# Problem (30)

f3 <- Orange$circumference
f3
class(f3)
f3 <- Orange[[3]]
f3
class(f3)

# Problem (31)

is.vector(f3)&is.atomic(f3)
class(f3)
typeof(f3)
table(f3)

# Problem (32)

lapply (Orange, class)

# Problem (33)

s29 <- Orange[29,]
s29

# Problem (34)

typeof(s29)
is.data.frame(s29)

# Problem (35)

Orange[Orange$Tree == 3,]

# Problem (36)

new_frame <- Orange[1:10, 1:2]
new_frame

# Problem (37)

median(Orange$age)

# ================================

## ====== i) Exports and Improts

# Problem (38)

df_1 <- Orange[10:24, ]
df_1

# problem (39)

setwd("E:/Salar/Uni/SI/Lab/Lab#1/R_Code")
write.csv(df_1, file = "df_1.csv", row.names = FALSE)

# Problem (40)

df_2 <- read.csv("df_1.csv")
df_2


## =============================== ##







