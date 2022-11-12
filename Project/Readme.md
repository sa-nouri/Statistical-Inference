## Project

- Briefly describe your dataset and why studying your dataset can be interesting. Describe each variable existing in the dataset and specify its type. By doing this simple task, you gain an initial understanding of your dataset.

- Using this elementary view of your dataset, which variables do you think may be the most relevant (contain some important information).

#### Numerical Univariate Analysis
Choose a numerical variable, then:
    1. Plot a histogram for this numerical variable with an appropriate bin size.
    2. Plot the density plot for this numerical variable
    3. Describe modality and skewness (calculate skewness).
    4. Calculate mean , variance, standard deviation.
    5. Draw the boxplot, determine the upper and lower quartiles, whiskers, and the IQR.
    6. Determine the outliers for this variable.

#### Bivariate Correlation
Choose two numerical variables, then:
    1. Draw a scatterplot for these two variables.
    2. Describe the two variables relation in words.
    3. Select a categorical variable and either by symbol or by colour (or both); distinguish the samples in the scatterplot.
    4. Calculate the correlation coefficient between these two variables. Using the `cor.test` function we can also test the significance of a correlation
    5. What is the best estimate for the population correlation coefficient?
    6. Draw a 2D density plot and a 2D histogram for the two variables

#### Multivariate Correlation
Consider a group (more than 3) of numeric variables, then:
    1. Display all the bivariate relations between the variables using a correlogram1 where each element is a scatter-plot between two variables.
    2. Describe the relations between the variables.
    3. Create a heatmap correlogram from your variables. Annotate each cell with their corresponding Pearson’s correlation coefficients.
    Note: These simple correlations show how each two variables are related, but this leaves open the question as to whether there are any underlying relations between the entire set. 

#### Categorical Univariate Analysis
Choose a categorical variable.
    1. Plot the barplot for this variable.
    2. Create a frequency table for this variable.
    3. Plot a violin plot for this variable.

#### Categorical Bivariate Analysis
Select two categorical variables.
    1. Grouped bar chart
    2. Contingency table
    3. Segmented bar plot
    4. Spine plot

#### Distribution Analysis among Groups
Compare the distribution of a numerical variable within different categories of another variable. Visualizing a distribution can be achieved using various plots such as box-plots, jitter points and violin plots.
    1. Use the mentioned plots to show how the distribution varies within the different categories of your categorical variable
    2. Compare the strengths and weaknesses of these plots.
    3. Interpret the data from these plots.

#### Univariate Hypothesis Testing
Choose a numerical variable.
    1. Calculate a 98% confidence interval for the mean of this variable.
    2. Interpret this confidence interval.
    3. Design a hypothesis test for the mean of this variable with a power of 50%. Calculate the number of samples required, take the samples and calculate the p-value. Confirm or reject your assumption.
    4. Calculate the Type I and Type II error.

#### Bivariate Hypothesis testing
Conduct a hypothesis test for two numerical variables. Choose a random sample from the dataset and choose two numerical variables which are of corresponding quantity.
    1. Should we use a one-sided or a two-sided test? Explain your reasoning.
    2. Should we use a t-test or a z-test? Explain your reasoning.
    3. Calculate a 95% confidence interval for the difference of means
    4. Design a hypothesis test to see if these data provide convincing evidence of a
    difference between mean values.

#### Analysis of Variance among Groups
Choose a numerical and a categorical variable with more than two levels. Divide observations of this dataset into different groups such that each group represents a level of the chosen categorical variable.
    1. Use the ANOVA test, compare the mean value of the numerical variable in the groups.
    2. Choose two of the groups, perform a hypothesis test for the mean difference of the selected numerical variable in these groups and calculate the p-value. Make a decision and explain the result using a significance level of 5%.

#### Categorical Hypothesis Testing
Consider two categorical variables in dataset such that at least one of them has more than 2 levels. Design and perform a hypothesis test to check if the variables are independent.

#### Sample Proportions
Choose a binary categorical variable (small sample size) and perform a hypothesis test for its success rate by means of the Simulation method.

#### Goodness of Fit
Choose a categorical variable that has more than two levels, calculate its probability distribution. 
Then choose two samples of size 100 from your dataset:
    1. Randomly and without any bias
    2. Bias the sampling method
Compare each sample with the real distribution using 𝜒2 (goodness of fit) and interpret your results.

#### Bivariate Regression
Choose a numerical response variable that predicting its future value is meaningful within the context of your dataset.
Select one explanatory variable which you believe is the best predictor for this response variable.
    1. Compute the least squares regression.
    2. Plot the relation between these two variables using a scatter plot overlaid with the least-squares fit as a dashed line.
    3. Interpret the obtained formula using plain language.
    4. How much of the total variability in the response variable is explained by the explanatory variable?
    5. Compute the least squares regression of the explanatory variable on the response variable.
    6. The least squares fitted line is a parametric method. The line is fitted according to an optimality criterion. However various non-parametric methods exist for visualizing the relation between two variables. One such method is Locally Weighted Regression and Smoothing Scatterplots (LOWESS or LOESS). Draw a scatterplot of your two variables overlaid with the LOESS fit.

#### Multiple Regression
Develop the best possible multiple linear regression model for the chosen response variable.
    1. Compute the least squares regression for the response variable using the two explanatory variables.
    2. Compare this model with the model from the previous question using adjusted R2.
    3. Compare the two models using an ANOVA table with the more complex model listed first.
        a. Calculate the proportional reduction in the residual sum of squares (RSS).
        b. What is the probability the two estimates of residual variance for the two models are equal?
    4. Use 5-fold cross-validation and report the final models RMSE.
    5. Check the conditions for this regression model. Use relevant plots for each condition.
    6. How much of the variability in the response variable is explained by the model?
    7. Plot a correlogram for the chosen explanatory variables.

#### Parsimonious Models
Choose a numerical response variable and several categorical and numerical explanatory variables from your dataset (not less than 5 variables) and build a linear model for them.
    1. Use the backward elimination method with regard to adjusted R2 to attain the parsimonious model for the selected variables.
    2. Use the forward selection method concerning p-value to attain the parsimonious model

#### Logistic Regression
Choose a binary categorical variable from dataset as a response variable and choose several categorical and numerical variables which can best explain the response variable.
    1. Construct a logistic regression model and interpret the intercept and the slopes in terms of log odds and log odds ratio.
    2. Draw the ROC curve for the model.
    3. Discuss the goodness of your obtained model in terms of AUC.
    4. Which explanatory variable in the model plays a more meaningful role in prediction?
    5. Is there an instance of multicollinearity issue in your model? How do you explain that?
    6. Calculate a 95% confidence interval for the odds ratio

- [Inference Function](inference.R): The “inference” function (inference.R) is a custom function that allows you to perform simulation- based statistical inference methods. By default, the function takes 10,000 bootstrap samples (instead of the 1,000 you’ve taken above), creates a bootstrap distribution, and calculates the confidence interval using the percentile method.
