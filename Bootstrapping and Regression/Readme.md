## Bootstrapping and Regression

The section focus is to explore bootstrapping, fitting linear regression models, performing multiple linear regression, and logistic regression in R.

#### Bootstrapping
Construct a bootstrap confidence interval for the median value of a feature in the dataset.
    - Take bootstrap samples from the data and calculate the median for each one
    - Construct a confidence interval using the percentile method
    - Calculate the bootstrap standard error. Note that this is basically the standard deviation of the
bootstrap median distribution.
    - [Inference Function](inference.R): The “inference” function (inference.R) is a custom function that allows you to perform simulation- based statistical inference methods. By default, the function takes 10,000 bootstrap samples (instead of the 1,000 you’ve taken above), creates a bootstrap distribution, and calculates the confidence interval using the percentile method.

#### Simulation
To perform simulation to prove a claim

#### Linear Regression, Multiple Linear Regression
    - Plot a scattered dot scheme that visualizes the relation between features
    - Find the correlation between features
    - Construct a linear model using “lm” function
    - Construct a multiple linear model using “lm” function
    - Plot the histogram of the residuals for the fitted model.
    - Draw QQ-plot of the distribution of the residuals in order to compare it with a standard normal distribution.
    - Plot the residuals in respect to the explanatory variables.
    - Plot the residuals of the fitted model in respect to their indices.
    - Perform a model selection using p-value-based backward elimination method

#### Logistic Regression
    - Find the probability of a feature for all possible cases
    - Discuss the conditions and terms that may affect the accuracy of the prediction for the imported model
