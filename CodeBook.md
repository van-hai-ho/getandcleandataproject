---
title: "CodeBook.md"
author: "Van Hai Ho"
date: "Thursday, July 24, 2014"
output: 
  html_document: 
    toc: true
---

This Code Book provides information about the variables, data and transformations included in run_analysis.R.

### Data Sets

For each record in the training and test data set, it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

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

### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
 
The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'.

### run_analysis.R

Variable | Description
---------|-------------
*datasetWidths* | the widths of each column in the data set. There are 561 features, hence there are 561 columns, each is 16 characters long.
*trainingData* | training data loaded from "UCI_HAR_Dataset/train/X_train.txt". There are 7352 objects of 561 variables in this training set.
*testData* | test data loaded from "UCI_HAR_Dataset/test/X_test.txt". There are 2947 objects of 561 variables in this test set.
*mergedData* | data frame after merging training and test data sets. There will be 10,299 objects of 561 variables.
*measurementFeatures* | the measurements used in the data sets as defined in "UCI_HAR_Dataset/features.txt". There are 561 features.
*selectedFeatureIndexes* | the list of indexes of the measurements on the mean and standard deviation for each measurement, extracted from measurementFeatures. These include mean frequency (meanFreq) and angle gravityMean. 
*selectedFeatures* | the list the measurements on the mean and standard deviation for each measurement, extracted from measurementFeatures. These include mean frequency (meanFreq) and angle gravityMean. 
*extractedData* | a subset of mergedData that include only the measurements on the mean and standard deviation for each measurement. extractedData will be extended with columns "Activity" for the activity name on which the measurement is recorded, and "Subject" for the subject on which the measurement is recorded.
*activityLabels* | a data frame provides index and descriptive activity names as defined in "UCI_HAR_Dataset/activity_labels.txt".
*trainingLabels* | the activity labels for the training set, as defined in "UCI_HAR_Dataset/train/y_train.txt".
*testLabels* | the activity labels for the test set, as defined in "UCI_HAR_Dataset/test/y_test.txt".
*mergedLabels* | the activity labels for both training and test sets.
*extractedDataWithActivityLabel* | the extracted data with measurements and activity label assigned for each record.
*mergedActivityNames* | the extracted data that is mapped to descriptive activity names.
*trainingSubjects* | the list of subjects used in training set, as defined in "UCI_HAR_Dataset/train/subject_train.txt".
*testSubjects* | the list of subjects used in test set, as defined in "UCI_HAR_Dataset/test/subject_test.txt".
*mergedSubjects* | the list of subjects used in both training and test sets.
*extractedDataMelt* | melted data after reshaping the extracted data so that each row is a unique id-variable combination, where id is "Subject" and "Activity", variable is the selected measurement features (selectedFeatures).
*averageMeasurements* | the tidy data set with the average of each variable for each activity and each subject. 

