## Set working directory to 'UCI HAR Dataset' folder
#setwd("UCI HAR Dataset")

## You should create one R script called run_analysis.R that does the following.

## 1. Merges the training and the test sets to create one data set.
## Read all test Data
X_test <- read.table('test/X_test.txt', header = F)
Y_test <- read.table('test/y_test.txt', header = F)
subject_test <- read.table('test/subject_test.txt', header = F)

## Read all train Data
X_train <- read.table('train/X_train.txt', header = F)
Y_train <- read.table('train/y_train.txt', header = F)
subject_train <- read.table('train/subject_train.txt', header = F)

## Merge test and train
## Merge X_test and X_train to get X_merged
X_merged <- rbind(X_test,X_train)
## Merge Y_test and Y_train to get Y_merged
Y_merged <- rbind(Y_test,Y_train)
## Merge subject_test and subject_train to get subject_merged
subject_merged <- rbind(subject_test,subject_train)

## Check the dimension of merged dataset against test and train dataset
if((nrow(X_merged) - nrow(X_train)- nrow(X_test)) != 0 || (nrow(Y_merged) - nrow(Y_train)- nrow(Y_test)) != 0 || (nrow(subject_merged) - nrow(subject_train)- nrow(subject_test)) != 0)
{
  stop('Data not merged correctly')
}

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## Load features data
features <- read.table('features.txt', header = F)
## Dimension of features data is 561x2
#dim(features)
#[1] 561  2

## Select only rows where mean and std are mentioned
X_merged<-X_merged[,grep("(mean|std)\\(\\)", features[,2])]
## Only 66 rows have either mean() or std() in features.
## New dimension for X_merged is 10299x66

## 3.Uses descriptive activity names to name the activities in the data set
## Read activity levels
activity_labels <- read.table('activity_labels.txt', header = F)

## Change label of Y_merged from number to description as per activity_labels
new_labels <- activity_labels[Y_merged[,1],]
Y_merged_labeled <- new_labels[2]
## Now the Y_merged has labeled column values

## 4.Appropriately labels the data set with descriptive variable names.
names_of_features <- features[grep("(mean|std)\\(\\)", features[,2]), 2]
names_of_features <- sub('-mean\\(\\)','Mean',names_of_features)
names_of_features <- sub('-std\\(\\)','StdDev',names_of_features)
names_of_features <- sub('^f','Frequency',names_of_features)
names_of_features <- sub('^t','Time',names_of_features)
names_of_features <- sub('BodyBody','Body',names_of_features)
names_of_features <- sub('Gyro','Gyroscopic',names_of_features)
names_of_features <- sub('Mag','Magnitude',names_of_features)
names_of_features <- sub('Acc','Acceleration',names_of_features)

## Rename columns for X_merged
names(X_merged) <- names_of_features
## Rename column for Y_merged_labeled
names(Y_merged_labeled) <- 'Activity'
Y_merged <- Y_merged_labeled
## Rename column for subject_merged
names(subject_merged) <- 'SubjectNumber'

## Save the subject wise fitness data into a dataset
subjectWiseFitnessData <- cbind(X_merged, Y_merged, subject_merged)

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
library(data.table)
aggregated_Res <- aggregate(select(subjectWiseFitnessData,-Activity,-SubjectNumber), by=list(Activity=subjectWiseFitnessData$Activity, SubjectNumber=subjectWiseFitnessData$SubjectNumber), FUN=mean)
write.table(aggregated_Res, "tidyData.txt", row.name=F)
