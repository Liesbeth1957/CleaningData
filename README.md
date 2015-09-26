# run_analysis.R 
run_analysis.R contains one script conform the description from the [rubric](https://class.coursera.org/getdata-032/human_grading/view/courses/975116/assessments/3/submissions) of the course project for Getting and Cleaning Data.

The script assumes that it will be run with the working directory set to the directory in which the [zipfile](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) was unzipped. Thus the working directory contains a subdirectory "UCI HAR Dataset"

The script first reads the files subject_... x_... and  y_... from UCI HAR Dataset/test and from UCI HAR Dataset/train to create 2 dataframes with subjectID's, measurements and activity. Those two dataframes are combined to give the required dataset for step 1 from the rubric

The script then reads features.txt into a dataframe to be able to find which columns contain measurements with mean or standard deviation. I choose for only those measurements which had mean in their name which had a belonging standard deviation. The columnnumbers where used to extract the right columns from the dataframe from step one, resulting in the requested result for step two.

The script then reads activity_labels into a dataframe to be able to find which number corresponds with which activity and uses that information to replace the numbers in the dataframe from step two with the description of the activity. Thus resulting in the requested dataframe for step three.

The script then re-uses the the dataframe with features to label the dataframe from step three with descriptive variable names, thus resulting in the requested dataframe for step four.

For step 5, the independent tidy data set with the average of each variable for each activity and each subject the average was calculated for each measurement column, grouped by activity and subject as a new column. The original measurementcolumns were dropped, duplicate rows removed and the columnnames from step 4 were reused with a pasted "average"

As last step, a tidy data text file is written with write.table, row.names=FALSE. All the other options are defaulted. To read the tidy.txt in in R, read.table("tidy.txt",header=TRUE)

This tidy data text file meets the principles of every measured variable in one column, each observation in one row. Those principles were stated in lesson 1 of the course. The first is obvious from the columnnames (plus explanation about their names in the codebook), the second is clear because each combination subjectid/activity consists only once, thus the average for that combination is in one row only.

The [codebook](https://github.com/Liesbeth1957/CleaningData/blob/master/CODEBOOK.md) contains the specific description of the filecontent and the relation between the original dataset and the tidy data text file.


