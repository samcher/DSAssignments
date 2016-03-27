# DSAssignments


Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For a detailed description follow this link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The raw data set can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In this repo there are three files: 
1. "CodeBook.md": it defines the variables and other relevant information of the tidy data set 
2. "run_analysis.R": it contains the scripts used to obtain the tidy data set 
3. "README.md": here you will find how the script works to generate the tidy data set

Raw Data Set

The row data set can be downloaded at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

The original data (Inside the "UCI HAR Dataset" folder) includes 4 text files and 2 folders:

README.txt - Information about the dataset

activity_labels.txt - defines a value for each activity

features.txt - list of all variable names

features_info.txt - explaination for how the variables are created and what they mean

There are separate training and test data sets.

Script

The script (see "run_analysis.R") has detailed comments which explain how the code works.
The test and training data sets are combined into a single data set. Using the group function in the dplyr mlibrary the data is grouped by the Subject and Activity Type columns to get the mean values.
