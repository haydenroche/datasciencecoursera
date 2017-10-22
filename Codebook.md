##This is the codebook for the GettingCleaningData Project

#Variable

Subject:  unique number for the person/volunteer that's participating
ActivityType:  there are 6 different types of activity. Laying, sitting, standing, walking, walking_downstairs, walking_upstairs
ActivityID :  numbered 1-6 for each subject that coordinate with the type of activity
TimeBodyAccel-mean()-X:  mean of tBodyAcc-mean()-X
TimeBodyAccel-mean()-Y:  mean of tBodyAcc-mean()-Y
TimeBodyAccel-mean()-Z:  mean of tBodyAcc-mean()-Z
TimeBodyAccel-std()-X:  standard deviation of tBodyAcc-mean()-X
TimeBodyAccel-std()-Y:  standard deviation of tBodyAcc-mean()-Y
TimeBodyAccel-std()-Z:  standard deviation of tBodyAcc-mean()-Z
TimeGravityAccel-mean()-X:  mean of tGravityAcc-mean()-X
TimeGravityAccel-mean()-Y:  mean of tGravityAcc-mean()-Y
TimeGravityAccel-mean()-Z:  mean of tGravityAcc-mean()-Z
TimeGravityAccel-std()-X:  standard deviation of tGravityAcc-mean()-X
TimeGravityAccel-std()-Y:  standard deviation of tGravityAcc-mean()-Y
TimeGravityAccel-std()-Z:  standard deviation of tGravityAcc-mean()-Z
TimeBodyAccelJerk-mean()-X:  mean of tBodyAccJerk-mean()-X
TimeBodyAccelJerk-mean()-Y:  mean of tBodyAccJerk-mean()-Y
TimeBodyAccelJerk-mean()-Z:  mean of tBodyAccJerk-mean()-Z
TimeBodyAccelJerk-std()-X:  standard deviation of tBodyAccJerk-mean()-X
TimeBodyAccelJerk-std()-Y:  standard deviation of tBodyAccJerk-mean()-Y
TimeBodyAccelJerk-std()-Z:  standard deviation of tBodyAccJerk-mean()-Z
TimeBodyGyro-mean()-X:  mean of tBodyGyro-mean()-X
TimeBodyGyro-mean()-Y:  mean of tBodyGyro-mean()-Y
TimeBodyGyro-mean()-Z:  mean of tBodyGyro-mean()-Z
TimeBodyGyro-std()-X:  standard deviation of tBodyGyro-mean()-X
TimeBodyGyro-std()-Y:  standard deviation of tBodyGyro-mean()-Y
TimeBodyGyro-std()-Z:  standard deviation of tBodyGyro-mean()-Z
TimeBodyGyroJerk-mean()-X:  mean of tBodyGyroJerk-mean()-X
TimeBodyGyroJerk-mean()-Y:  mean of tBodyGyroJerk-mean()-Y
TimeBodyGyroJerk-mean()-Z:  mean of tBodyGyroJerk-mean()-Z
TimeBodyGyroJerk-std()-X:  standard deviation of tBodyGyroJerk-mean()-X
TimeBodyGyroJerk-std()-Y:  standard deviation of tBodyGyroJerk-mean()-Y
TimeBodyGyroJerk-std()-Z:  standard deviation of tBodyGyroJerk-mean()-Z
TimeBodyAccelMagnitude-mean():  mean of tBodyAccMag-mean()
TimeBodyAccelMagnitude-std():  standard deviation of tBodyAccMag-mean()
TimeGravityAccelMagnitude-mean():  mean of tGravityAccMag-mean()
TimeGravityAccelMagnitude-std():  standard deviation of tGravityAccMag-mean()
TimeBodyAccelJerkMagnitude-mean():  mean of tBodyAccJerkMag-mean()
TimeBodyAccelJerkMagnitude-std():  standard deviation of tBodyAccJerkMag-mean()
TimeBodyGyroMagnitude-mean():  mean of tBodyGyroMag-mean()
TimeBodyGyroMagnitude-std():  standard deviation of tBodyGyroMag-mean()
TimeBodyGyroJerkMagnitude-mean():  mean of tBodyGyroJerkMag-mean()
TimeBodyGyroJerkMagnitude-std():  standard deviation of tBodyGyroJerkMag-mean()
FreqBodyAccel-mean()-X:  mean of fBodyAcc-mean()-X
FreqBodyAccel-mean()-Y:  mean of fBodyAcc-mean()-Y
FreqBodyAccel-mean()-Z:  mean of fBodyAcc-mean()-Z
FreqBodyAccel-std()-X:  standard deviation of fBodyAcc-mean()-X
FreqBodyAccel-std()-Y:  standard deviation of fBodyAcc-mean()-Y
FreqBodyAccel-std()-Z:  standard deviation of fBodyAcc-mean()-Z
FreqBodyAccelJerk-mean()-X:  mean of fBodyAccJerk-mean()-X
FreqBodyAccelJerk-mean()-Y:  mean of fBodyAccJerk-mean()-Y
FreqBodyAccelJerk-mean()-Z:  mean of fBodyAccJerk-mean()-Z
FreqBodyAccelJerk-std()-X:  standard deviation of fBodyAccJerk-mean()-X
FreqBodyAccelJerk-std()-Y:  standard deviation of fBodyAccJerk-mean()-Y
FreqBodyAccelJerk-std()-Z:  standard deviation of fBodyAccJerk-mean()-Z
FreqBodyGyro-mean()-X:  mean of fBodyGyro-mean()-X
FreqBodyGyro-mean()-Y:  mean of fBodyGyro-mean()-Y
FreqBodyGyro-mean()-Z:  mean of fBodyGyro-mean()-Z
FreqBodyGyro-std()-X:  standard deviation of fBodyGyro-mean()-X
FreqBodyGyro-std()-Y:  standard deviation of fBodyGyro-mean()-Y
FreqBodyGyro-std()-Z:  standard deviation of fBodyGyro-mean()-Z
FreqBodyAccelMagnitude-mean():  mean of fBodyAccMag-mean()
FreqBodyAccelMagnitude-std():  standard deviation of fBodyAccMag-mean()
FreqBodyAccelJerkMagnitude-mean():  mean of fBodyBodyAccJerkMag-mean()
FreqBodyAccelJerkMagnitude-std():  standard deviation of fBodyBodyAccJerkMag-mean()
FreqBodyGyroMagnitude-mean():  mean of fBodyBodyGyroMag-mean()
FreqBodyGyroMagnitude-std():  standard deviation of fBodyBodyGyroMag-mean()
FreqBodyGyroJerkMagnitude-mean():  mean of fBodyBodyGyroJerkMag-mean()
FreqBodyGyroJerkMagnitude-std():  standard deviation of fBodyBodyGyroJerkMag-mean()


#Transformations

1) All of the datasets needed to be merged into one: the subject, activity, features and the training and test data sets.
2) Then using a grep function, I was able to use regexps to extract variables that match the mean() and std()
3) Then the datasets were joined by ActivityID
4) The final output is the write.table function of tidydata.txt and it will have the average per subject and activity


#Data: From the README in the UCI HAR Dataset

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.
