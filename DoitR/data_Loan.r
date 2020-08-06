data.Loan <- read.csv("C:\\Users\\HyunTaek\\Desktop\\study\\DoitR\\대출상환\\Loan_payments_data.csv",header = T)
#Get Names of columns
names(data.Loan)


#Number of Rows of the data
nrow.data.Loan <<- nrow(data.Loan)
## There are 500 rows

#unique Loan ID
length(unique(data.Loan$Loan_ID))
## There are 500 unique Values indicating all Loan IDs are unique

# Structure of the data
str(data.Loan)

#Change Structure of "data.Loan"
data.Loan$Principal <- as.double(data.Loan$Principal)
data.Loan$effective_date <- as.Date(data.Loan$effective_date)
data.Loan$due_date <- as.Date(data.Loan$due_date)
data.Loan$paid_off_time <- as.Date(data.Loan$paid_off_time, 
                                   format = "%m/%d/%Y %H:%M")

#Summarize the Data
summary.data.frame(data.Loan)


#For plotting we will be using the package ggplot2
# If not installed please run >> install.packages("ggplot2")
library("ggplot2")

#Data Distribution Views
#The Loan Status Plot
ggplot(data=data.Loan, aes(x=loan_status)) + 
  geom_bar(colour="black", fill="#DD8888") +
  xlab("Paid off Status") +
  ylab("Count") +
  ggtitle("Plot of Loan Status")

#Principle Amount Views
ggplot(data = data.Loan, aes(x = Principal)) +
  geom_histogram(bins =7, colour="black", fill="#DD8888") +
  ylab("Count of principles") +
  ggtitle("Histogram plot of Principle Amount")

#The Education Levels View
ggplot(data=data.Loan, aes(x=education)) + 
  geom_bar(colour="black", fill="#DD8888") +
  xlab("Education") +
  ylab("Count") +
  ggtitle("Plot of education levels")

#Past due dates View
ggplot(data = data.Loan, aes(x = past_due_days)) +
  geom_histogram(colour="black", fill="#DD8888") +
  ylab("Count") +
  ggtitle("Histogram plot of Due Dates")

#The Gender Levels View
ggplot(data=data.Loan, aes(x=Gender)) + 
  geom_bar(colour="black", fill="#DD8866") +
  xlab("Education") +
  ylab("Count") +
  ggtitle("Plot of Gender levels")