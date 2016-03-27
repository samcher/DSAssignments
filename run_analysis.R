library(dplyr)

#Read the activity labels to use it as a lookup table later.
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
activityLabelsdf <- tbl_df(activityLabels)

#read the features table.
features <- read.table("UCI HAR Dataset/features.txt")


#Read the taining data
#name the columns from the feature table loaded earlier.
#Load the subject train.txt data and name it the subject ID
#Load the y_train.txt for the activity type codes
train <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(train) = features[,2]
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(train_subjects) = "Subject_ID"
train_activities <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(train_activities) = "Activity_TYPE"

#append the columns gathered above for the training data set
train <- cbind.data.frame(train_subjects, train_activities, train)

#do the steps above for the test data Set.
test <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(test) = features[,2]
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(test_subjects) = "Subject_ID"
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(test_activities) = "Activity_TYPE"
test <- cbind.data.frame(test_subjects, test_activities, test)

#Add the test and training data sets into 1 set
full_dataset <- rbind.data.frame(train, test)

#using the tbl_df from the dplyr library convert to a dataset.
dataset <- tbl_df(full_dataset)
colnames(dataset) = make.unique(colnames(dataset))


dataset <- select(dataset, Subject_ID, Activity_TYPE, contains("mean()"), contains("std()"))

#loop through the data set to convert the activity code to a description from the Activity label Data set
for(i in 1:nrow(dataset)){
  activityType <- as.integer(dataset[i, 2])  
  dataset[i, 2] = filter(activityLabelsdf, V1 == activityType)[,"V2"]
}

#group and summarize by the subject and activity
dataset <- group_by(dataset, Subject_ID, Activity_TYPE)
final1 <- summarise_each(dataset, funs(mean))
View(final1)
