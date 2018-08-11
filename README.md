# Deep_Health
Predict the next re-admission to the hospital for diabetes.

# Warmup Questions

#### 1. What is the probability distribution for readmission?

#### 2. Is there any difference in chances to be re-admitted for different age groups? How about gender? How about the weight?
  (Hint: you can use visualizations and/or statistical tests to check this)

#### 3. Some patients do go under special medical treatments. Can you use the available dataset to identify which medical specialities are more correlated to re-admission? Can you comment on your findings?

#### 4. It is advised to regularly run medical checkups. Using the dataset, can you identify variables that can indicate the frequency of Dr visits? Unfortunately, among those visits, we can't easily distinguish routine visits from serious illness visits. Simply, we can investigate the correlation between the number of visits and re-admission. So, what can you say about:
  - readmission and number of visits
  - patient's age, weight, gender and number of visits. For example, it's interesting to see who visit Dr's more often between young and old people, male and females, and how can the weight play a role

#### 5. Investigate the relationship between the readmission and the number of previous diagnosis

#### 6. Build a model to predict the readmission based on the given dataset. What are the most significants variables to predict a patient's readmission?

## Best practices to explore a dataset in order to build a good predictive model

1. **Read any documentation** available about the dataset. Variables as well the domain knowledge about the projects are explained here

2. **Identify the target variable (or dependent variable)**. This is the variable to be predicted. It is usually provided for **supervised learning** problems. In case it is not provided, it could probably be deduced/derived from other variable. If not, the problem becomes **unsupervised**. Once the target variable is found, you should also define if it's categorical, numerical and therefore carefully define the problem as a classification or regression.

3. **Identify independent variables**. These are the variables to be used as inputs to the model in order to predict the target variable.

3. **Data Cleaning**.
  - Determine the format and datatype of each variable. Variables can be categorical or numerical. Categorical variables care usually provided as strings, characters or integer numbers with a relatively small cardinality. Numerical variables are usually floats and integers.
  - Find and note variable with missing values
  - Describe variables. You need to calculate statistical metrics (count, mean, standard deviation, median, mode, 25% and 75% quantile, ...) for each variable.
  - Treat missing values:
    - if more than 50% of a variable are missing, you can drop this variable and/or derive a new binary variable to indicate empty/non-empty value for this particular variable
    - Otherwise, wisely replace the missing value with the mean or median for numerical variables or mode for categorical variables

4. **Feature Engineering**. Base on your domain knowledge, you can derive new features out of the original features. You can also transform original variables. For example by encoding categorical variables into numerical ones using LabelEncoding when categories are ordered or OneHotEncoder otherwise. Sometimes, this step can be done together with data cleaning

5. **Exploratory data analysis**. It's highly advised to consider doing a visual analysis of the the dataset. In this stage, the goal is
  - to study distributions of dependent variables with respect to the target variable and therefore be able to manually identify the most significant variables for the predictions in mind.
  - to study to correlations and relationship among variables. This can help to reduce the dimension of the dataset. For example, if you find two or many highly correlated independent variables, you can safely use one of them and drop the other variables correlated to it.
  - to run statistical/hypothesis tests (t-test, chi-square test, f-test, anova, ...) to have a quantitative feel about the significance of the variable with respect to the target variable.
  - Identify techniques to be used in order to reduce the dimension if necessary (Principal Component Analysis - PCA, Linear Discriminant Analysis - LDA, Singular value decomposition - SVD, factor analysis, ...)

6. **Modeling**. This is where the magic starts. Having seen the distributions, correlations, significance of variable and dimension of the data, it should become easier to decide which models to build. There is no rule to follow but I can say that it all comes with experience. The more models you build the easier it gets. Here, I will list common things which are done is this stage
  - reduce dimension
  - split data into train/test/validation
  - train, tune, optimize hyper-parameters for the model
  - compute the performance of the model

7. **Discuss the model**. This consists in assessing the model and trying to break it down. Also, it consists in suggesting future stages to improve it

8. **Conclusion and Recommendation**. Here, summarize your work in one paragraph. Next, discuss the impact of the model on the problem that was to be tackled in very laymann terms. This what your boss (with limited technical knowledge) spends more of his time.

## Recommended Resources:
- 8min tutorial on R notebook: https://www.youtube.com/watch?v=TJmNvfhLCoI
- course intro to R: https://www.datacamp.com/courses/free-introduction-to-r
- tutorial of looping in R: https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r
- book: https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf
