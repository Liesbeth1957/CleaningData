## site from which the data were got for the course "getting and cleaning data"
##http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## link to data for the course project
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##  TO DO
##  1) Merges the training and the test sets to create one data set.
##  2) Extracts only the measurements on the mean and standard deviation for each measurement. 
##  3) Uses descriptive activity names to name the activities in the data set
##  4) Appropriately labels the data set with descriptive variable names. 

##  5) From the data set in step 4, creates a second, independent tidy data set 
##  with the average of each variable for each activity and each subject.



##  1) Merges the training and the test sets to create one data set.

## read for train and test the files with subjectid (ie subject_train.txt), 
## measurements (ie X_train.txt) and activity (ie y_train.txt)
## assuming the zip is unzipped in the working directory

library("utils")
subjectIDtrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subjectIDtrain)<-c("subjectID")
measurementTrain<-read.table("UCI HAR Dataset/train/X_train.txt")
activityTrain<-read.table("UCI HAR Dataset/train/y_train.txt")
colnames(activityTrain)<-c("activity")

subjectIDtest<-read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(subjectIDtest)<-c("subjectID")
measurementTest<-read.table("UCI HAR Dataset/test/X_test.txt")
activityTest<-read.table("UCI HAR Dataset/test/y_test.txt")
colnames(activityTest)<-c("activity")

## combine subjectid with measurement and activity for train and independently for test 
## with cbind() in trainCombined and testCombined
train<-cbind(subjectIDtrain,measurementTrain,activityTrain)
test<-cbind(subjectIDtest,measurementTest,activityTest)

## combine trainCombined and testCombined with rbind() 
## in combinedDataSet to create the required dataset
combinedDataSet<-rbind(train,test)


##  2) Extracts only the measurements on the mean and standard deviation for each measurement.
##  only means with a belonging standard deviation are choosen

## read features.txt which contains columnnumbers with the measurement
columnLabel<-read.table("UCI HAR Dataset/features.txt")
colnames(columnLabel)<-c("columnnumber","measurement")

## extract columnnumbers of columns which contain mean and standard deviation
library(dplyr)
meanStdColumnLabel<-columnLabel[grep("[-][Mm][Ee][Aa][Nn][^F]|[Ss][Tt][Dd]",columnLabel$measurement),]
meanStdColums<-meanStdColumnLabel[,1]
## shift all column positions 1 up, because subjectID will come up front
meanStdColums<-meanStdColums+1

##combine with subjectID, first column, and activity, last column
columnsToBeSelected<-c(1,meanStdColums,563)
## select the right (=containing mean/sdv) columns from combindDataSet
selectedDataSet<-select(combinedDataSet,columnsToBeSelected)


##  3) Uses descriptive activity names to name the activities in the data set

## read activity_labels.txt and swaps the numbers in de DT with the corresponding names
activityDescription<-read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
colnames(activityDescription)<-c("activityNumber","activityDescription")
selectedDataSet$activity <- activityDescription[selectedDataSet$activity,2]


##  4) Appropriately labels the data set with descriptive variable names. 

## reuse of the DT from step 2
## make the names acceptable for R
colNames<-  make.names(meanStdColumnLabel[,2])
## tidy the resulting names
colNames<-gsub("...",".",colNames,fixed=TRUE)
colNames<-gsub("..","",colNames, fixed=TRUE)
colNamesNew<-c("subjectID",as.character(colNames),"activity")
## set the names as columnnames
names(selectedDataSet)<-colNamesNew


##  5) From the data set in step 4, creates a second, independent tidy data set 
##  with the average of each variable for each activity and each subject.

## calculate average of each variable for each activity and each subject
## resulting average comes in new columns
library(data.table)
newDT<-as.data.table(selectedDataSet)
for(i in 2:67){
  tij<-colNamesNew[i]
  testDT<-newDT[,paste("V",i,sep="") :=mean(get(tij)),by=list(activity,subjectID)]
}
## drop the original measurements
testDT<-subset(testDT,select = -c(2:67))
## only one average per activity/per subject
tidy<-unique(testDT)
## give nice columnnames
tidyNames<-paste("average.",colNames, sep="")
setnames(tidy,3:68,tidyNames)

## write result for grading
write.table(tidy, "tidy.txt", row.names=FALSE)
