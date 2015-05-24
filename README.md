==================================================================
Coursera Data Science Specialization Track
Course 3 - Getting and Cleaning Data
==================================================================
Course Project
==================================================================

First, read in all six of the datasets in the Test & Train folders and run the dimension function on them:
	All the resulting test data frames and all the train data frames have the same number of rows.
	The X_train and X_test data frames have 561 columns which corresponds to the list of features.
	The y_ data frames have 1 column which contains the class labels corresponding to each activity.
	The subject_ data frames 1 column which contains an identifier for the volunteer who carried out the experiment.
The data consists of Samsung smartphone data that can be found at this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Combine the X_train and X_test datasets using rbind into a data frame named X_all
Label the data set with descriptive variable names
- create a vector of variable names by reading in the features.txt file and converting it to a vector named featuresVector
- use the names function with the featuresVector to name the variables in the X_all data frame

Extract only the measurements on the mean and standard deviation for each measurement
- Thanks to ideas shared in the discussion forum, use the grepl function to create a logical vector that contains a TRUE value for each variable name that contains -mean or -std
- Use this logical vector to subset the X_all data frame into a new variable named X_subset

Combine the y_train and y_test datasets using rbind into a data frame named y_all
Combine the subject_train and subject_test datasets using rbind into a data frame named subject_all
Use the names function to name the column in each of y_all and subject_all

Use descriptive activity names to name the activities in the data set
- read in the dataset named activity_labels.txt into a data frame named activities
- use the names function to name the columns in the data frame activities
- merge y_all with activities by activity_code with the result saved in a new data frame named y_label

Finally, combine y_label, subject_all and X_subset into a new data frame named dataSamsung using the bind function
Order of data frames was determined for easiest readability putting the x_subset last since it contains all the data

Code for #5 is also included
Create a second, independent, tidy data set with the average of each variable for each activity and each subject
Using chaining, define a new data frame named meanSamsung that is created from the data frame dataSamsung
- group by activity, activity_code and volunteer_num
- summarize by the group by variables and calculate the mean of all other variables

View the final 2 datasets dataSamsung and meanSamsung



