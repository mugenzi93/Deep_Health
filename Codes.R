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
# https://stackoverflow.com/questions/25835643/replace-missing-values-with-column-mean
df[is.na(df[,"admission_source_id"]), "admission_source_id"] <- getmode(df[,"admission_source_id"])
subset(df, is.na(df$admission_source_id))["admission_source_id"]
# Let's move onto the next variable 'time_in_hospital'. This is a numerical variable, which means that its three missing values will be replaced by the variable's particular mean.
any(is.na(df$time_in_hospital))
sum(is.na(df$time_in_hospital))
meantime <- mean(df$time_in_hospital, na.rm = T)
getmean <- round(meantime,0)
getmean
df[is.na(df[,"time_in_hospital"]), "time_in_hospital"] <- mean(df$time_in_hospital, na.rm = T) + getmean
# Since we have determined the mean and rounded it to one sigfig, we will replace the missing values with the mean here below.
subset(df, is.na(df$time_in_hospital))["time_in_hospital"]
# To make things easy for ourselves, let's identify both numerical (or continuous) and categorical variables and create two vectors comprising one of each tyoe of data structure.
categorical_col <- c("discharge_disposition_id", "admission_type_id", "medical_specialty", "num_procedures", 
                     "diag_1", "diag_2","diag_3", "max_glu_serum", "A1Cresult", "metformin", "repaglinide", 
                     "nateglinide", "chlorpropamide", "glimepiride", "acetohexamide", "glipizide", "glyburide", 
                     "tolbutamide", "pioglitazone", "rosiglitazone", "acarbose", "miglitol", "troglitazone", 
                     "tolazamide", "examide", "citoglipton", "insulin", "glyburide.metformin", "glipizide.metformin", 
                     "glimepiride.pioglitazone", "metformin.rosiglitazone", "metformin.pioglitazone", "change", 
                     "diabetesMed", "readmitted")
numerical_col <- c("num_lab_procedures", "num_medications", "number_outpatient", "number_emergency", "number_inpatient", 
                   "number_diagnoses")
## Since categorical and numerical variables are now separated in two different vectors, let's see if we can determine if a certain variable has missing values, and if so, replace those values with either the mode or mean.
# First with the categorical vector, we will build a function that will determine missingness and replace it with mode.
# !! I was unable to find the simplest way of computing missing values and getting rid of them by using a function I created (save for later).
# Now will identify all NA for numerical variables and take care of them.
cat_fun <- function(variable,df) {
  n <- sum(is.na(df[variable])) 
  if (n > 0) {
    m <- getmode(df[,variable])
    df[is.na(df[,variable]), variable] <- m
  } 
  df[variable]
}
df$discharge_disposition_id <- cat_fun("discharge_disposition_id", df)
for(x in categorical_col) {
  print(x)
} 
