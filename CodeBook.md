---
title: "CodeBook.md"
author: "Van Hai Ho"
date: "Thursday, July 24, 2014"
output: html_document
---

This Code Book provides information about the variables, data and transformations included in run_analysis.R.

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
*activityLabels* | a data frame to provide index and descriptive activity names as defined in "UCI_HAR_Dataset/activity_labels.txt".
*trainingLabels* | the activity labels for the training set, as defined in "UCI_HAR_Dataset/train/y_train.txt".
*testLabels* | the activity labels for the test set, as defined in "UCI_HAR_Dataset/test/y_test.txt".
*mergedLabels* | the activity labels for both training and test sets.
*mergedActivityNames* | the activity labels for both training and test sets along with their descriptive activity names.
*trainingSubjects* | the list of subjects used in training set, as defined in "UCI_HAR_Dataset/train/subject_train.txt".
*testSubjects* | the list of subjects used in test set, as defined in "UCI_HAR_Dataset/test/subject_test.txt".
*mergedSubjects* | the list of all subjects used in training and test sets.
*extractedDataMelt* | melted data after reshaping the extracted data so that each row is a unique id-variable combination, where id is "Subject" and "Activity", variable is the selected measurement features (selectedFeatures).
*averageMeasurements* | the tidy data set with the average of each variable for each activity and each subject. 

