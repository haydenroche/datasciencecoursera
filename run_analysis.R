####Part 1 :: Merges the training and the test sets to create one data set.####

##Install the package##
install.packages("dplyr")
install.packages("plyr")
install.packages("data.table")
install.packages("tidyr")

##Load the package##

library(dplyr)
library(plyr)
library(data.table)
library(tidyr)

##Load in all of the unzipped datasets##

setwd("/Users/hroche/Coursera")

Activity_Labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
Features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
X_Test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
Y_Test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
Subject_Test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
Subject_Train<- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
X_Train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
Y_Train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

##Renaming Rows##
Data_Set_Subject <- rbind(Subject_Train, Subject_Test)
setnames(Data_Set_Subject, "V1", "Subject")
Data_Set_Y <- rbind(Y_Train, Y_Test)
setnames(Data_Set_Y, "V1", "ActivityID")

##Merge the Data and Test Tables##
Data_Set_X <- rbind(X_Train, X_Test)

##Features table: Renaming into ID and Feature Type##
setnames(Features, names(Features), c("FeatureID", "FeatureType"))
colnames(Data_Set_X) <- Features$FeatureType

##Activites table: Renaming into ID and Activity Type##
setnames(Activity_Labels, names(Activity_Labels), c("ActivityID", "ActivityType"))

##Merge the Subject with the Activity Tables where each observation is a subject-activity combo##
Subject_Activity <- cbind(Data_Set_Subject, Data_Set_Y)
Final_Data <- cbind(Subject_Activity, Data_Set_X)


####Part 2 :: Extracts only the measurements on the mean and standard deviation for each measurement.####

Feat_Mean_Std <- grep("mean\\(\\)|std\\(\\)",Features$FeatureType, value=TRUE)

##Joining the new Feat_Mean_Std##
Feat_Mean_Std <- union(c("Subject", "ActivityID"), Feat_Mean_Std)
Final_Data <- subset(Final_Data, select = Feat_Mean_Std)


####Part 3 :: Uses descriptive activity names to name the activities in the data set####

##Merge the Activity Labels table with all of the Final Data Mean and Std Data Tables##

Final_Data2 <- inner_join(Final_Data, Activity_Labels, by="ActivityID", match = "first")
##Final_Data2 <- Final_Data2[,-1]
##Next we should sort the Final_Data2 by Subject and Activity##
Final_Data2$ActivityType <- as.character(Final_Data2$ActivityType)
Aggregation <- aggregate(.~Subject - ActivityType, data = Final_Data2, mean)
Final_Data3 <- arrange(Aggregation,Subject,ActivityType)

####Part 4 :: Appropriately labels the data set with descriptive variable names.####
##Renaming all of the nonsensical names with the gsub function. 
names(Final_Data3) <- gsub("^t", "Time", names(Final_Data3))
names(Final_Data3) <- gsub("^f", "Freq", names(Final_Data3))
names(Final_Data3) <- gsub("BodyBody", "Body", names(Final_Data3))
names(Final_Data3) <- gsub("Acc", "Accel", names(Final_Data3))
names(Final_Data3) <- gsub("Mag", "Magnitude", names(Final_Data3))

####Part 5 :: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.####
Final_Data4 <- ddply(Final_Data3, c("Subject", "ActivityType"), numcolwise(mean))
head(str(Final_Data4))
View(Final_Data4)
write.table(Final_Data4, file = "TidyData.txt", row.names = FALSE)






