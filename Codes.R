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
categorical_col <- c("df$discharge_disposition_id", "df$admission_type_id", "df$medical_specialty", "df$num_procedures", 
                     "df$diag_1", "df$diag_2","df$diag_3", "df$max_glu_serum", "df$A1Cresult", "df$metformin", "df$repaglinide", 
                     "df$nateglinide", "df$chlorpropamide", "df$glimepiride", "df$acetohexamide", "df$glipizide", "df$glyburide", 
                     "df$tolbutamide", "df$pioglitazone", "df$rosiglitazone", "df$acarbose", "df$miglitol", "df$troglitazone", 
                     "df$tolazamide", "df$examide", "df$citoglipton", "df$insulin", "df$glyburide.metformin", "df$glipizide.metformin", 
                     "df$glimepiride.pioglitazone", "df$metformin.rosiglitazone", "df$metformin.pioglitazone", "df$change", 
                     "df$diabetesMed", "df$readmitted")
numerical_col <- c("df$num_lab_procedures", "df$num_medications", "df$number_outpatient", "df$number_emergency", "df$number_inpatient", 
                   "df$number_diagnoses")
## Since categorical and numerical variables are now separated in two different vectors, let's see if we can determine if a certain variable has missing values, and if so, replace those values with either the mode or mean.
# First with the categorical vector, we will build a function that will determine missingness and replace it with mode.
# !! I was unable to find the simplest way of computing missing values and getting rid of them by using a function I created (save for later).
# Now will identify all NA for numerical variables and take care of them.
sum(is.na(df$num_lab_procedures))
mean.lab <- mean(df$num_lab_procedures, na.rm = T)
mean.ro <- round(mean.lab,0)
mean.ro
df[is.na(df[,"num_lab_procedures"]), "num_lab_procedures"] <- mean(df$num_lab_procedures, na.rm = T) + mean.ro
subset(df, is.na(df$num_lab_procedures))["num_lab_procedures"]
# Second numerical variable (num_medications).
sum(is.na(df$num_medications))
mean.med <- mean(df$num_medications, na.rm = T)
mea.med <- round(mean.med,0)
df[is.na(df[,"num_medications"]), "num_medications"] <- mean.med + mea.med
subset(df, is.na(df$num_medications))["num_medications"]
# Third numerical variable (number_outpatient).
sum(is.na(df$number_outpatient))
mean.out <- mean(df$number_outpatient, na.rm = T)
mea.out <- round(mean.out,0)
df[is.na(df[,"number_outpatient"]), "number_outpatient"] <- mean.out + mea.out
subset(df, is.na(df$number_outpatient))["number_outpatient"]
# Fourth numerical variable (number_emergency).
sum(is.na(df$number_emergency))
mean.em <- mean(df$number_emergency, na.rm = T)
mea.em <- round(mean.em,0)
df[is.na(df[,"number_emergency"]), "number_emergency"] <- mean.em + mea.em
subset(df, is.na(df$number_emergency))["number_emergency"]
# Fifth numerical variable (number_inpatient).
sum(is.na(df$number_inpatient))
mean.in <- mean(df$number_inpatient, na.rm = T)
mea.in <- round(mean.in,0)
df[is.na(df[,"number_inpatient"]), "number_inpatient"] <- mean.in + mea.in
subset(df, is.na(df$number_inpatient))["number_inpatient"]
# Sixth numerical variable (number_diagnoses).
sum(is.na(df$number_diagnoses))
mean.dia <- mean(df$number_diagnoses, na.rm = T)
mea.dia <- round(mean.dia,0)
df[is.na(df[,"number_diagnoses"]), "number_diagnoses"] <- mean.dia + mea.dia
subset(df, is.na(df$number_diagnoses))["number_diagnoses"]
