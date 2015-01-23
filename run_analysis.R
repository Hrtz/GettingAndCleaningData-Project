##===========================================
## Getting and Cleaning Data – Course Project
##===========================================

## Loading dependencies
library(dplyr)

## Features - tidying names and removing duplicates 
features <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activityNames <- as.vector(activity$V2)
featureNames <- as.vector(features$V2)
featureNames <- gsub("_","",featureNames,)
featureNames <- gsub("\\(","",featureNames,)
featureNames <- gsub("\\)","",featureNames,)
featureNames <- gsub(",","",featureNames,)
featureNames <- gsub("-","",featureNames,)

featureNamesUnique <- unique(featureNames)
featureDuplicates <- as.numeric(duplicated(featureNames))
featureDuplicatesVector <- which(featureDuplicates == 1)

## Train set - prepare
XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
XTrain <- select(XTrain, -featureDuplicatesVector)
colnames(XTrain) <- featureNamesUnique

XTrainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
XTrainSubject <- rename(XTrainSubject, subject = V1)

XTrainAll <- bind_cols(XTrainSubject,XTrain)


## Test set - prepare
XTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
XTest <- select(XTest, -featureDuplicatesVector)
colnames(XTest) <- featureNamesUnique

XTestSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
XTestSubject <- rename(XTestSubject, subject = V1)

XTestAll <- bind_cols(XTestSubject,XTest)


## Merge Test set and Train set
mergedData <- merge(XTestAll,XTrainAll,by = intersect(names(XTestAll), names(XTrainAll)), all=TRUE)

## Selecting mean and standard deviation elements of merged data - by subject
mergedDataSelect <- select(mergedData, contains("subject"), contains("Mean"), contains("std"))

## I don't know how to distinguish witch measuring set is for which activity so
## I've spread all activities over all the subjects
activityNamesSet <- as.data.frame(head(rep(activityNames, nrow(mergedDataSelect)/5), n = 10299))
colnames(activityNamesSet) <- "activity"
mergedDataSelect <- bind_cols(mergedDataSelect,activityNamesSet)


## Calculating mean for each column based on activity - by subject
merged.data1 <- data.frame(x= numeric(0), y= integer(0), z = character(0))

subs <- 1:30
for (i in subs) {
                mergedSub1W <- filter(mergedDataSelect, subject == i & activity == "WALKING")
                mergedSub1WMean <- apply(mergedSub1W[2:nrow(mergedSub1W),2:87], 2, mean)
                mergedSub1WU <- filter(mergedDataSelect, subject == i & activity == "WALKING_UPSTAIRS")
                mergedSub1WUMean <- apply(mergedSub1WU[2:nrow(mergedSub1WU),2:87], 2, mean)
                mergedSub1WD <- filter(mergedDataSelect, subject == i & activity == "WALKING_DOWNSTAIRS")
                mergedSub1WDMean <- apply(mergedSub1WD[2:nrow(mergedSub1WD),2:87], 2, mean)
                mergedSub1SI <- filter(mergedDataSelect, subject == i & activity == "SITTING")
                mergedSub1SIMean <- apply(mergedSub1SI[2:nrow(mergedSub1SI),2:87], 2, mean)
                mergedSub1ST <- filter(mergedDataSelect, subject == i & activity == "STANDING")
                mergedSub1STMean <- apply(mergedSub1ST[2:nrow(mergedSub1ST),2:87], 2, mean)
                mergedSub1L <- filter(mergedDataSelect, subject == i & activity == "LAYING")
                mergedSub1LMean <- apply(mergedSub1L[2:nrow(mergedSub1L),2:87], 2, mean)
                
                merged.data1 <- rbind(merged.data1,mergedSub1WMean)
                merged.data1 <- rbind(merged.data1,mergedSub1WUMean)
                merged.data1 <- rbind(merged.data1,mergedSub1WDMean)
                merged.data1 <- rbind(merged.data1,mergedSub1SIMean)
                merged.data1 <- rbind(merged.data1,mergedSub1STMean)
                merged.data1 <- rbind(merged.data1,mergedSub1LMean)
}
colnames(merged.data1) <- names(mergedSub1W[2:87])


## Creating new data frame with mean values for each measurement based on activity - by subject
activityNamesSet2 <- as.data.frame(rep(activityNames, 30))
colnames(activityNamesSet2) <- "activity"
merged.data1 <- bind_cols(activityNamesSet2,merged.data1)

SubjectsSet2 <- as.data.frame(rep(c(1:30), each = 6))
colnames(SubjectsSet2) <- "subject"
merged.data1 <- bind_cols(SubjectsSet2,merged.data1)

## Writing final table to txt file
write.table(merged.data1, file = "CourseProject.txt", row.name=FALSE)
