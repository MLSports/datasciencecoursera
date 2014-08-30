Readme.md for run_analysis (Coursera Getting & Cleaning Data Project)
========================================================


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


This data set is based on the data from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",dest="rundata.zip"

More information on data set:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



The following files correspond to this run_analysis project:
- run_analysis.R:  
R-script based on the data sets provided from the urls above. Combines the training and test set and calculates the averages of the 79 features (containing a mean or standard deviation for a feature) for each of the subjects and each of the activities.
Ouput is a data.table with 81 columns and 180 rows (30 subjects*6 different activities)
- Project_Codebook.md  
Contains descriptions of the different features in the data set provided by the use of the smartphone
- Project_Readme.md  
Information about the data set, the contained files and procedures.  
- tidy_data.txt  
The tidy data set described above. (Can be read into R by read.table(url, sep=""))

