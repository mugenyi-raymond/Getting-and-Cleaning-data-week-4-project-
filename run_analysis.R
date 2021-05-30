# Reading data from the relevant files regarding the project
# I made sure that all the unzipped files are put in my working directory

features <- read.table("features.txt", col.names = c("n","functions"))
activities <- read.table("activity_labels.txt", col.names = c("serial", "activity"))
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
x_test <- read.table("test/X_test.txt", col.names = features$functions)
y_test <- read.table("test/y_test.txt", col.names = "serial")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
x_train <- read.table("train/X_train.txt", col.names = features$functions)
y_train <- read.table("train/y_train.txt", col.names = "serial")


# Merging the training and the test sets to create one data set.

X_combined <- rbind(x_train, x_test)
Y_combined <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y_combined, X_combined)

# Extracting only the measurements on the mean and standard deviation
# for each measurement.

library(dplyr)
NiceData <- Merged_Data %>% select(Subject, serial, contains("mean"), contains("std"))

# Using descriptive activity names to name the activities in the data set.
NiceData$serial <- activities[NiceData$serial, 2]

# Appropriately labeling the data set with descriptive variable names.
names(NiceData)[2] = "Activity"
names(NiceData)<-gsub("Acc", "Accelerometer", names(NiceData))
names(NiceData)<-gsub("Gyro", "Gyroscope", names(NiceData))
names(NiceData)<-gsub("BodyBody", "Body", names(NiceData))
names(NiceData)<-gsub("Mag", "Magnitude", names(NiceData))
names(NiceData)<-gsub("^t", "Time", names(NiceData))
names(NiceData)<-gsub("^f", "Frequency", names(NiceData))
names(NiceData)<-gsub("tBody", "TimeBody", names(NiceData))
names(NiceData)<-gsub("-mean()", "Mean", names(NiceData), ignore.case = TRUE)
names(NiceData)<-gsub("-std()", "STD", names(NiceData), ignore.case = TRUE)
names(NiceData)<-gsub("-freq()", "Frequency", names(NiceData), ignore.case = TRUE)
names(NiceData)<-gsub("angle", "Angle", names(NiceData))
names(NiceData)<-gsub("gravity", "Gravity", names(NiceData))

# From the data set in step 4, creating a second, 
# independent tidy data set with the average of each variable for each activity and 
# each subject.
TidyDataFinal<- NiceData %>%
  group_by(Subject, Activity) %>%
  summarise_all(funs(mean))
write.table(TidyDataFinal, "TidyDataFinal.txt", row.name=FALSE)
