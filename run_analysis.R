library(dplyr)

# Read in all Samsung data datasets 
X_train <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
X_test <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")

# Determine dimensions of each dataset
dim(X_train)
dim(subject_train)
dim(y_train)
dim(X_test)
dim(subject_test)
dim(y_test)

# 1 - Merge the training and test sets to create one data set
X_all <- rbind(X_train,X_test)
# 4 - Appropriately label the data set with descriptive variable names
# create vector of the features variable names
features <- read.table("./UCI_HAR_Dataset/features.txt")
featuresVector <- as.vector(features[,2])
names(X_all) <- featuresVector
names(X_all) <- featuresVector
# 2 - Extract only the measurements on the mean and standard deviation for each measurement
X_subset <- X_all[,grepl("-mean|-std",names(X_all))]

# 1 - Merge the training and test sets to create one data set
y_all <- rbind(y_train,y_test)
subject_all <- rbind(subject_train,subject_test)
# name column in both y_ and subject_ datasets
names(y_all) <- c("activity_code")
names(subject_all) <- c("volunteer_num")

# 3 - Use descriptive activity names to name the activities in the data set
activities <- read.table("./UCI_HAR_Dataset/activity_labels.txt")
names(activities) <- c("activity_code","activity")
y_label = merge(activities,y_all,by.x="activity_code",by.y="activity_code",all=TRUE)

# combine data from X_(subsetted) y_(labelled) and subject_
dataSamsung <- cbind(y_label, subject_all, X_subset)

# 5 - Create a second, independent, tidy data set with the average of each variable for each activity and each subject
meanSamsung <- dataSamsung %>%
group_by(activity, activity_code, volunteer_num) %>%
summarise_each(funs(mean))

View(dataSamsung)
View(meanSamsung)
