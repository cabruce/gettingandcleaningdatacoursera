
#Getting and Cleaning Data Course Project

###Objectives:
You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


###How run_analysis.R works:

1. First, the activity labels and features are loaded, then the data on means and standard deviations.
2. The datasets are then loaded.
3. The datasets are then cleaned and merged.
4. Finally, the new tidy dataset is exported to a txt file.
5. If desired, a codebook is produced.
