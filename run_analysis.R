# run_analysis.R
# Author: Van Hai Ho

# Clean up environment
rm(list = ls())

# Set working directory
#setwd("K:/Passage/training/coursera/Data_Science/03_Getting_and_Cleaning_Data/project")

# 1.
# Read train data set
datasetWidths <- c(rep(16, times = 561)) 
trainingData <- read.fwf("UCI_HAR_Dataset/train/X_train.txt", header = FALSE, 
                         widths = datasetWidths)

# Load test data
testData <- read.fwf("UCI_HAR_Dataset/test/X_test.txt", header = FALSE, 
                         widths = datasetWidths)

# Merge training and test data sets to create one data set
mergedData <- rbind(trainingData, testData)

# 2.
# Load measurement features
measurementFeatures <- read.delim("UCI_HAR_Dataset/features.txt", header = FALSE, sep = " ")

# Select measurements on mean and std
selectedFeatureIndexes <- grep("mean|std", measurementFeatures$V2, ignore.case = TRUE, value = FALSE)
selectedFeatures <- grep("mean|std", measurementFeatures$V2, ignore.case = TRUE, value = TRUE)

# Extracts only the measurements on the mean and standard deviation for 
# each measurement. 
extractedData <- mergedData[, selectedFeatureIndexes]

# 3.
# Load activity labels
activityLabels <- read.delim("UCI_HAR_Dataset/activity_labels.txt", header = FALSE, sep = " ")
names(activityLabels) <- c("ActivityLabel", "Activity")

# Load activity labels for training set
trainingLabels <- read.table("UCI_HAR_Dataset/train/y_train.txt", header = FALSE)
names(trainingLabels) <- c("ActivityLabel")

# Load activity labels for test set
testLabels <- read.table("UCI_HAR_Dataset/test/y_test.txt", header = FALSE)
names(testLabels) <- c("ActivityLabel")

# Merge activity labels for training and test sets
mergedLabels <- rbind(trainingLabels, testLabels)

# Add activity labels to the extracted data set
extractedDataWithActivityLabel <- cbind(extractedData, mergedLabels)

# Adds descriptive activity names for activity labels
mergedActivityNames <- merge(x = extractedDataWithActivityLabel, 
                             y = activityLabels, by = "ActivityLabel", 
                             all.x = TRUE, sort = FALSE)

# Remove ActivityLabel and uses descriptive activity names to name the activities in the data set
extractedData <- subset(mergedActivityNames, select = -ActivityLabel)

# 4.
# Appropriately labels the data set with descriptive variable names. 
names(extractedData) <- c(selectedFeatures, "Activity")

# 5.
# Load subjects for training set
trainingSubjects <- read.table("UCI_HAR_Dataset/train/subject_train.txt", header = FALSE)
names(trainingSubjects) <- c("Subject")

# Load subjects for test set
testSubjects <- read.table("UCI_HAR_Dataset/test/subject_test.txt", header = FALSE)
names(testSubjects) <- c("Subject")

# Merge subjects for training and test sets
mergedSubjects <- rbind(trainingSubjects, testSubjects)

# Add subjects to extracted data with activity label
extractedDataWithActivitySubjects <- cbind(extractedDataWithActivityLabel, 
                                           mergedSubjects)

# Adds descriptive activity names to the extracted data set
mergedActivityNames <- merge(x = extractedDataWithActivitySubjects, 
                             y = activityLabels, by = "ActivityLabel", 
                             all.x = TRUE, sort = FALSE)

# Remove ActivityLabel and uses descriptive activity names to name the activities in the data set
extractedData <- subset(mergedActivityNames, select = -ActivityLabel)
names(extractedData) <- c(selectedFeatures, "Subject", "Activity")

# Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject. 
library(reshape2)
extractedDataMelt <- melt(extractedData, id = c("Subject", "Activity"), measure.vars = selectedFeatures)
averageMeasurements <- dcast(extractedDataMelt, Subject + Activity ~ variable, mean)

# Write the tidy data set to file
tidyDataFile <- "tidyData.txt"
write.table(x = averageMeasurements, file = tidyDataFile, row.names = FALSE, col.names = TRUE)

