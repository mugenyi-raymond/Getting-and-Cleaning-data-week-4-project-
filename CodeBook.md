The run_analysis.R script performs the data preparation that is, it contains the code i used to make the data tidy.The code was written basing on the instructions given in the assignment


Dataset was downloaded and extracted under the folder called UCI HAR Dataset which i used as my working directory

Each relevant data regarding the project was assigned to a variabe as follows:

features <- features.txt : contains 561 rows, 2 columns
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

activities <- activity_labels.txt : contains 6 rows, 2 columns
List of activities performed when the corresponding measurements were taken and its serials (labels)

subject_test <- test/subject_test.txt : contains 2947 rows, 1 column.
Contains test data of 9/30 volunteer test subjects being observed.

x_test <- test/X_test.txt : contains 2947 rows, 561 columns.
Contains recorded features test data

y_test <- test/y_test.txt : contains 2947 rows, 1 columns.
Contains test data of activities’serial labels.

subject_train <- test/subject_train.txt : contains 7352 rows, 1 column.
Contains train data of 21/30 volunteer subjects being observed.

x_train <- test/X_train.txt : contains 7352 rows, 561 columns.
Contains recorded features train data.

y_train <- test/y_train.txt : contains 7352 rows, 1 columns.
Contains train data of activities’serial labels.


The training and the test sets data were merged to create just one data set.
x_train and x_test were merged using rbind() function to create X_combined (10299 rows, 561 columns).
y_train and y_test were merged using rbind() function to create Y_combined (10299 rows, 1 column).
Subject (10299 rows, 1 column) is created by merging subject_train and subject_test were merged  using rbind() function to  create Subject (10299 rows, 1 column).
Subject, Y_combined and X_combined were merged using cbind() function to create Merged_Data(10299 rows, 563 column).

The mean and standard deviation for each measurement were extracted.
By using the dplyr package, the columns ; Subject, serial and the measurements on the mean and standard deviation for each measurement were selected to create NiceData(10299 rows, 88 columns).

Descriptive activity names were used to name the activities in the data set

The numbers in serial column of the NiceData were replaced with corresponding activity taken from second column of the activities variable

The following descritpive variable names were used to appropriately label the dataset:
serial column in NiceData renamed into Activity.
All Acc in column’s name replaced by Accelerometer.
All Gyro in column’s name replaced by Gyroscope.
All BodyBody in column’s name replaced by Body.
All Mag in column’s name replaced by Magnitude.
All start with character f in column’s name replaced by Frequency.
All start with character t in column’s name replaced by Time.
All tBody in column's name replaced by TimeBody.
All with -mean() replaced by Mean.
All with -std() replaced by STD.
All angle in column's name replaced by Angle.
All gravity in column's name replaced by Gravity. 



From the data set in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject was created. The name given to it is "TidyDataFinal".
TidyDataFinal(180 rows, 88 columns) was created by sumarizing NiceData taking the means of each variable for each activity and each subject, after being  grouped by subject and activity.
With the help of Write.table(), the TidyDataFinal was exported  into TidyDataFinal.txt file.
