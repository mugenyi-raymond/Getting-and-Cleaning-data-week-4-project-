PEER-GRADED ASSIGNMENT:GETTING AND CLEANING DATA COURSE PROJECT
This repository is created in order to finish the peer-graded Assignment given in week 4 of Getting and Cleaning Data course

Description of the data DESCRIPTION OF THE DATA
Experiments weren carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the  3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments were video-recorded to label the data manually and the obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.


THE DATASET
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 

FILES
CodeBook.md :This code book  describes the variables, the data, and any transformations or work that I performed to clean up the data.That is; to make the data tidy.

run_analysis.R: This R script contains the  code for data preparation. It was written based on the following instructions given in the assignment:

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
 TidyDataFinal.txt: This is the generated dataset obtained  after going through all the steps  described above.


