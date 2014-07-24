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

# Load activity labels for training set
trainingLabels <- read.table("UCI_HAR_Dataset/train/y_train.txt", header = FALSE)

# Load activity labels for test set
testLabels <- read.table("UCI_HAR_Dataset/test/y_test.txt", header = FALSE)

# Merge training activity labels and test activity labels
mergedLabels <- rbind(trainingLabels, testLabels)

# Use descriptive activity names for the activity labels
mergedActivityNames <- merge(x = mergedLabels, y = activityLabels, by = "V1", all.x = TRUE, sort = FALSE)

# Uses descriptive activity names to name the activities in the data set
extractedData$Activity <- mergedActivityNames$V2

# 4.
# Appropriately labels the data set with descriptive variable names. 
names(extractedData) <- c(selectedFeatures, "Activity")

# 5.
# Load subjects for training set
trainingSubjects <- read.table("UCI_HAR_Dataset/train/subject_train.txt", header = FALSE)

# Load subjects for test set
testSubjects <- read.table("UCI_HAR_Dataset/test/subject_test.txt", header = FALSE)

# Merge subjects for training and test sets
mergedSubjects <- rbind(trainingSubjects, testSubjects)

# Add subjects to the tidy data set
extractedData$Subject <- mergedSubjects$V1

# Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject. 
library(reshape2)
extractedDataMelt <- melt(extractedData, id = c("Subject", "Activity"), measure.vars = selectedFeatures)
averageMeasurements <- dcast(extractedDataMelt, Subject + Activity ~ variable, mean)

# Write the tidy data set to file
tidyDataFile <- "tidyData.txt"
write.table(x = averageMeasurements, file = tidyDataFile, row.names = FALSE, col.names = TRUE)

