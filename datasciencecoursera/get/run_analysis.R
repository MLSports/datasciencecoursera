library(plyr)  #needed for mapvalues() in line 41

### Download the zip file at 18-June-2014
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",dest="rundata.zip")
#date_downloaded <-date()

## Load test & train data into data tables
x_test <- read.table(unz("rundata.zip", "UCI HAR Dataset/test/X_test.txt"),header=FALSE, sep="", comment.char="", colClasses="numeric")
y_test <- read.table(unz("rundata.zip", "UCI HAR Dataset/test/y_test.txt"),header=FALSE, sep="", comment.char="", colClasses="numeric")
subject_test <- read.table(unz("rundata.zip", "UCI HAR Dataset/test/subject_test.txt"),header=FALSE, sep="", comment.char="", colClasses="numeric")

x_train <- read.table(unz("rundata.zip", "UCI HAR Dataset/train/X_train.txt"), header=FALSE, sep="", comment.char="", colClasses="numeric")
y_train <- read.table(unz("rundata.zip", "UCI HAR Dataset/train/y_train.txt"), header=FALSE, sep="", comment.char="", colClasses="numeric")
subject_train <- read.table(unz("rundata.zip", "UCI HAR Dataset/train/subject_train.txt"), header=FALSE, sep="", comment.char="", colClasses="numeric")

## combine subject id , the feature vecotrs and the target vector into one dataset
## The target corresponds to the activity level of the subject

## Append the test data to the training data row-wise to build one big data set

data_train <- cbind(subject_train, x_train, y_train)
data_test <- cbind(subject_test, x_test, y_test)

full_set <- rbind(data_train, data_test)

## Load features.txt to set the column names to the corresponding feature names in "features.txt"

feature_names <- read.table(unz("rundata.zip", "UCI HAR Dataset/features.txt"), header=FALSE, sep="", comment.char="", colClasses="character")
readable_fnames <- gsub("\\(\\)|[:+-]", "", feature_names$V2) ## V2 is the column containting the feature names
frame_ids <- grep("mean|std", readable_fnames) ## ids of feature names containing "mean" or "std" , note: ignore "Mean", "Std" as they correspond to angles and not means,stds
frame_names <- c("id", readable_fnames[frame_ids], "activity_level") 

## Set column names to "id", feature_names, "activity_level"
data_sel <- full_set[,c(1, frame_ids+1, length(full_set))]
colnames(data_sel)<- frame_names

## Refactor column "activity_level" from numbers (1-6) to labels from file "activity_labels.txt"
activity_names <- read.table(unz("rundata.zip", "UCI HAR Dataset/activity_labels.txt"), header=FALSE, sep="", comment.char="", colClasses="character")
activity_labels <- activity_names$V2
data_sel$activity_level <- as.factor(data_sel$activity_level)
data_sel$activity_level <- mapvalues(data_sel$activity_level, from = c("1","2","3","4","5","6"), to = activity_labels) 

## Create a tidy data set
## by calculating column means for columns containing the features (2-second last column)

feat <- data_sel[,c(2:length(data_sel)-1)]
d_aggregated <- aggregate(feat, list(data_sel$id, data_sel$activity_level), mean)

data_tidy <- d_aggregated[-3] #delete column "id"
colnames(data_tidy)[1:2] <- c("Subject", "Activity") #Set column names for the new first two rows created by aggregate

## Write data.table to txt file
#write.table(data_tidy, file="tidy_data.txt", sep=" ", row.names=FALSE)

