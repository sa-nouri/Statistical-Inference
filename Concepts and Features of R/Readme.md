## Concepts and Features of R

We will examine some basic concepts and features of R language. Throughout this, tiny tips and clues about each of the topic will be learned.

#### Variables and Types
Operators can be used within the variables or values of the same type. Sometimes, we call these types as “Classes”.
If you try to use one operator within two variables/values of different types, R tries to cast the type of variables; sometimes it is possible and sometimes it is not.
The operator “=” or “<-“ for value assignment and their difference.

#### Data Structures
The main data structures of R

#### Vectors
It is commonly said that everything in R is a vector (it is somehow true). With the good knowledge of how vectors work, you can guess the basic behavior of other data structures, even if you did not confront them before.
    - How to create vector
    - Get the statistics of the vector
    - Plot the vector
    - Get subscriptions of the vector

#### Factors
R can handle categorical variables as well as numerical variables.
    - Their difference with vectors
    - Get and adding a value

#### Missing Values
In reality, there are many cases that observations from some samples are not available.
    - Represent unavailable values in R
    - Examine the statistics of vector with unavailable values
    - NULL values

#### Lists
    - Their difference with vectors
    - Nested list

#### Naming
Can add names to the objects.

#### DataFrames
Data frame is the most important data structure in R. In summary, data frame is a list of [named] atomic vectors with some constraints over the data structure. All atomic vectors in a data frame should have the same length.
A data frame could be seen as a collection of features (variables) sampled from the population, where each row represents one observation (a sample point) and each column represents a feature.

    - Get number of featurs
    - Get number of sample points
    - Extracting feature
    - Type of data structures
    - Extract categorical variables
    - Feature Indexing
    - Get statistics of the features

#### Export and Import
Many datasets in statistical researches are loaded into the computers using a file with “CSV” format.

#### Notes
    - There is a rich data structure in R named matrix. It has a variety of functions and features, which makes it a powerful mathematical structure. It is widely used for implementing machine learning algorithms.
    - In some cases the data extracted from a data frame might be converted automatically to a different data structure. Find out the cases, and find out how to convert between data frame and vectors bidirectionally.
    - Sometimes factors could behave in a way that you are not expected. The easy way is to convert them to vectors; but it is usually not a good idea.
    - how coercions occur in R
    - R language operators: There are cases that you can use operators instead of
functions.
    - Using loops in R is as bad as using “goto” in C. There are many functions such as apply
family, aggregation family, etc. to avoid using loops