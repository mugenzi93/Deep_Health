# Let's start with the acquisition of the 'Diabetes-Training' file first.
df <- read.csv(file.choose(), header = T)
# Here we are calling all the column names to see what dependent or independent variables we will be working with.
names(df)
# Data Cleaning: we will analyze each variable for missing values using the formula below.
is.na(df$readmitted)
any(is.na(df$race))
any(is.na(df$gender))
any(is.na(df$age))
any(is.na(df$weight))
# since this particular variable has three missing values, we will replace each missing value with the mode since we are dealing with a categorical variable.
any(is.na(df$admission_type_id))
# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
subset(df, is.na(df$admission_source_id))["admission_source_id"]
# https://stackoverflow.com/questions/25835643/replace-missing-values-with-column-mean
df[is.na(df[,"admission_source_id"]), "admission_source_id"] <- getmode(df[,"admission_source_id"])
any(is.na(df$time_in_hospital))
sum(is.na(df$time_in_hospital))
meantime <- mean(df$time_in_hospital, na.rm = T)
round(meantime,0)
