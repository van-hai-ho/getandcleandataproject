---
title: "README.md"
author: "Van Hai Ho"
date: "Thursday, July 24, 2014"
output: html_document
---

This document provides you with instructions on how to run run_analysis.R script. Please perform the following steps in order to run the script:

1. Download data sets:

Before you can run the script, you will first need to have the data sets in your local directory. You can download the data sets provided here:

2. Extract data sets:

Extract the downloaded data sets into your local directory, make sure that data directory named "UCI_HAR_Dataset" is in the same location as the run_analysis.R script. Please make sure that data set directory includes the following files in the same structure:

```
UCI_HAR_Dataset\
                test\
                     subject_test.txt
                     X_test.txt
                     y_test.txt
                training\
                     subject_train.txt
                     X_train.txt
                     y_train.txt
                activity_labels.txt
                features.txt
                features_info.txt
                README.txt
```

3. Set working directory:

Set working directory for the environment to the directory where the run_analysis.R and data set directory are. E.g.:

```
setwd(<your_local_directory>)
```

4. Run run_analysis.R.

When run_analysis.R runs, the script performs the following:
  
  4.1. Merges training and test data sets to create one data set:
  
    1. It first loads the train data set ("UCI_HAR_Dataset/train/X_train.txt") into the data frame called trainingData.
    2. Loads the test data set ("UCI_HAR_Dataset/test/X_test.txt") into testData.
    3. Merges training and test data sets to create one data set called mergedData.
    
  4.2. Extracts only the measurements on the mean and standard deviation for each measurement:
    
    1. Load measurement features from data file ("UCI_HAR_Dataset/features.txt").
    2. Select measurements on mean and standard deviation for each measurement.
    3. Extracts only the measurements on the mean and standard deviation for each measurement from mergedData and stored them in extractedData. 
    
  4.3. Uses descriptive activity names to name the activities in the data set:
    
    1. Loads activity labels from data file ("UCI_HAR_Dataset/activity_labels.txt") and assigns column names as "ActivityLabel" and "Activity".
    2. Loads activity labels for training set from ("UCI_HAR_Dataset/train/y_train.txt") and assigns column name as "ActivityLabel".
    3. Loads activity labels for test set from ("UCI_HAR_Dataset/test/y_test.txt") and assigns column names as "ActivityLabel".
    4. Merges training activity labels and test activity labels into mergedLabels.
    5. Add activity labels to the extracted data set extractedDataWithActivityLabel.
    6. Merges extracted data set with descriptive activity names by joining extractedDataWithActivityLabel and activityLabels on "ActivityLabel".
    7. Removes ActivityLabel and uses descriptive activity names to name the activities in the extracted data set.

  4.4. Appropriately labels the data set with descriptive variable names.
    
  4.5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject:
    
    1. Loads subjects for training set from ("UCI_HAR_Dataset/train/subject_train.txt") and assign column name as "Subject".
    2. Loads subjects for test set from ("UCI_HAR_Dataset/test/subject_test.txt") and assign column name as "Subject".
    3. Merges subjects for training and test sets into mergedSubjects.
    4. Adds subjects to extracted data with activity label extractedDataWithActivitySubjects.
    5. Merges descriptive activity names to the extracted data set.
    6. Removes ActivityLabel and uses descriptive activity names to name the activities in the extracted data set.
    8. Uses descriptive variable names in the extracted data set.
    9. Creates a tidy data set with the average of each variable for each activity and each subject. 
    10. Write the tidy data set to file "tidyData.txt".


