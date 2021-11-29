# CodeBook

This code book describes the variables, the data, and any transformations or work that I performed to clean up the accelerometers raw data from the Samsung Galaxy Smartphone. 

## The data

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.  The full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained. The data for the project can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. More information about the data can be found at : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Attribute Information

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

## Data Set file information:

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Transformations or work performed to clean up the data in run_analysis.R
1. Merging the training and the test sets to create one data set.
	1.1. Read X_test, X_train, y_test, y_train, subject_train and subject_test into respective variables.
	1.2. Get merged data into X_merged(X_test+X_train), Y_merged(y_test+y_train) and subject_merged(subject_test+subject_train). 
2. Extract only the measurements on the mean and standard deviation for each measurement from features.
	2.1. Load features data
	2.2. Select only rows where mean and std are mentioned in features
	2.3. Select only those features from X_merged
3. Used descriptive activity names to name the activities in the data set.
	3.1. Read activity levels into activity_labels
	3.2. Change label of Y_merged from number to description as per activity_labels
4. Appropriately labels the data set with descriptive variable names
	4.1. Get names of all the features identified in step 2.2
	4.2. Assign user-friendly names to column names. Subsitute '-mean()' with 'Mean','-std() with 'StdDev','BodyBody' with 'Body', 'Gyro' with 'Gyroscopic','Mag' with Magnitude and 'Acc' with 'Accelaration'. Also, we renamed columns starting with 'f' as 'Frequency' and 't' as 'Time' respectively.
	4.3. Assign column name 'Activity' to Y_merged
	4.4. Assign column name 'SubjectNumber' to subject_merged
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	5.1. Create a combined dataset by merging X_merged,Y_merged and subject_merged by columns.
	5.2. Use aggreate function to get means of all columns in dataset by 'Activity' and 'SubjectNumber'
	5.3. Save the resultant dataset to 'tidyData.csv'