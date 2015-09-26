---
title: "Codebook Human Activity Recognition Using Smartphones"
author: Liesbeth Dusink
date: 26-09-2015
---

## Project Description
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors

##Study design and data processing

###Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Notes on the original (raw) data 
The original raw data can be found on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
The data for this project where extracted from above site and placed in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Creating the tidy datafile

###Guide to create the tidy data file
1. download the zip-file
2. extract the zip-file in your working directory, thus creating a subdirectory named "UCI HAR Dataset"
3. load run_analysis.R in R
4. run run_analysis.R
5. the tidy data file "tidy.txt" should now be created in your working directory

###Cleaning of the data
 [link to the readme document that describes the code in greater detail](https://github.com/Liesbeth1957/CleaningData/blob/master/README.md)
 
 run_analysis.R:
   *  Merges the training and the test sets from "UCI HAR Dataset" to create one data set.
   *  Extracts only the measurements on the mean and standard deviation for each measurement. 
   * Uses descriptive activity names to name the activities in the data set
   * Appropriately labels the data set with descriptive variable names
   * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
   * Writes that data set in a file named "tidy.txt" in the working directory

##Description of the variables in the tidy.txt file
 
 tidy.txt contains 180 observations of 68 variables

 subjectID                        : int
 
 activity                         : Factor w/ 6 levels
 
 average.tBodyAcc.mean.X          : num
 
 average.tBodyAcc.mean.Y          : num
 
 average.tBodyAcc.mean.Z          : num
 
 average.tBodyAcc.std.X           : num
 
 average.tBodyAcc.std.Y           : num
 
 average.tBodyAcc.std.Z           : num
 
 average.tGravityAcc.mean.X       : num
 
 average.tGravityAcc.mean.Y       : num
 
 average.tGravityAcc.mean.Z       : num
 
 average.tGravityAcc.std.X        : num
 
 average.tGravityAcc.std.Y        : num
 
 average.tGravityAcc.std.Z        : num
 
 average.tBodyAccJerk.mean.X      : num
 
 average.tBodyAccJerk.mean.Y      : num
 
 average.tBodyAccJerk.mean.Z      : num
 
 average.tBodyAccJerk.std.X       : num
 
 average.tBodyAccJerk.std.Y       : num
 
 average.tBodyAccJerk.std.Z       : num
 
 average.tBodyGyro.mean.X         : num
 
 average.tBodyGyro.mean.Y         : num
 
 average.tBodyGyro.mean.Z         : num
 
 average.tBodyGyro.std.X          : num
 
 average.tBodyGyro.std.Y          : num
 
 average.tBodyGyro.std.Z          : num
 
 average.tBodyGyroJerk.mean.X     : num
 
 average.tBodyGyroJerk.mean.Y     : num
 
 average.tBodyGyroJerk.mean.Z     : num
 
 average.tBodyGyroJerk.std.X      : num
 
 average.tBodyGyroJerk.std.Y      : num
 
 average.tBodyGyroJerk.std.Z      : num
 
 average.tBodyAccMag.mean         : num
 
 average.tBodyAccMag.std          : num
 
 average.tGravityAccMag.mean      : num
 
 average.tGravityAccMag.std       : num
 
 average.tBodyAccJerkMag.mean     : num
 
 average.tBodyAccJerkMag.std      : num
 
 average.tBodyGyroMag.mean        : num
 
 average.tBodyGyroMag.std         : num
 
 average.tBodyGyroJerkMag.mean    : num
 
 average.tBodyGyroJerkMag.std     : num
 
 average.fBodyAcc.mean.X          : num
 
 average.fBodyAcc.mean.Y          : num
 
 average.fBodyAcc.mean.Z          : num
 
 average.fBodyAcc.std.X           : num
 
 average.fBodyAcc.std.Y           : num
 
 average.fBodyAcc.std.Z           : num
 
 average.fBodyAccJerk.mean.X      : num
 
 average.fBodyAccJerk.mean.Y      : num
 
 average.fBodyAccJerk.mean.Z      : num
 
 average.fBodyAccJerk.std.X       : num
 
 average.fBodyAccJerk.std.Y       : num
 
 average.fBodyAccJerk.std.Z       : num
 
 average.fBodyGyro.mean.X         : num
 
 average.fBodyGyro.mean.Y         : num
 
 average.fBodyGyro.mean.Z         : num
 
 average.fBodyGyro.std.X          : num
 
 average.fBodyGyro.std.Y          : num
 
 average.fBodyGyro.std.Z          : num
 
 average.fBodyAccMag.mean         : num
 
 average.fBodyAccMag.std          : num
 
 average.fBodyBodyAccJerkMag.mean : num
 
 average.fBodyBodyAccJerkMag.std  : num
 
 average.fBodyBodyGyroMag.mean    : num
 
 average.fBodyBodyGyroMag.std     : num
 
 average.fBodyBodyGyroJerkMag.mean: num
 
 average.fBodyBodyGyroJerkMag.std : num

###Variable 1 subjectID
subjectID denotes which subject readings belongs to.
---
class: int
values: 1..30
unit: no unit
name schema: none
---

####Notes on variable 1:
order is still the original order with first all the subjects from the training set (first 126 rows) and then the subjects form the testset

###Variable 2  activity
activity is a factor which describes which activity the subject did when collecting the belonging measures 
---
class: Factor w/ 6 levels 
values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
unit: no unit
name schema: none
---

####Notes on variable 2:
The numbers denoting the activities in the original data set were replaced with the descriptive factors, using activity_labels.txt

###Variable 3 and on
variable 3 and on describe the average of the measurement of a subject during an activity.
---
class: num
values: [-1:+1]
unit: no unit
name schema: see below
---
* average: calculated by grouping each subject/activity in the raw data and then using the mean() over every measurement; 
* t/f: t to denote time, f to denote frequency domain signals; 
* BodyAcc/GravityAcc: acceleration split in body and gravity; 
* Acc/Gyro: accelerometer, gyroscope; 
* Mag/Jerk: magnitude, Jerk;
* X/Y/Z: the dimension; 
* mean()/std(): the mean value and standard deviation

The average was calculated by grouping each subject/activity in the raw data and then using the mean() over every measurement

####Notes on variable 3 and on:
all readings were normalized in the raw data set, so no units present.
For a complete description of how the raw data were sampled see the readme in the zip-file below


##Sources
[original study](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
[data for project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
[template for codebook](https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41)

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
