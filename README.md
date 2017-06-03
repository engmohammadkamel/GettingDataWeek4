# GettingDataWeek4
Getting and Cleaning Data Course: week 4 assignment 

# Backgroung about the original experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window)

From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

# the data cleaning done on the original raw data
the R script called "run_analysis.R" reads the raw data, does some data cleaning, and then write the output dataset to the working directory as a text file called "Features Average.txt". please refer to the file "CodeBook.md" that descripes the variables and the analysis done to genertate the final dataset.

#### in order to be able to run the script successfully please note the below:
- The script assumes that the raw data folder called "UCI HAR Dataset" is existing in the working directory.
- The script will write the output file called "Features Average.txt" to the working directory
- to read the output file/data set into R please use the below command

####    read.table("Features Average.txt", header = T)

- Refer to the file "CodeBook.md" that descripes the variables and the analysis done to genertate the final dataset

###NOTE
all the variables/features that have the word "mean" are considered Mean features, this includes the angle() features.
