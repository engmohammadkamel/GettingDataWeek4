# GettingDataWeek4 : code book
Getting and Cleaning Data Course: week 4 assignment 

## Notes
- all the variables/features that have the word "mean" are considered Mean features, this includes the angle() features.
- The script assumes that the raw data folder called "UCI HAR Dataset" is existing in the working directory.
- The script will write the output file called "Features Average.txt" to the working directory
- to read the output file/data set into R please use the below command

####    read.table("Features Average.txt", header = T)


## Codebook

The dataset shows the average for the mean and STD features for each subject for each activity, all the features that have the word "mean" are considered Mean Feature including the angle() features.

#### the dataset conssistes of 4 columns as follows:

- activity:

this is the name of the activity for which the varaiable has been measured

- subject:

this is the ID of the volunteer who has done the experiment

- feature:

this is the name of the feature for which the average has been calculated, only the mean and STD features are considered in this dataset, all the features that have the word "mean" are considered Mean Feature including the angle() features.

please See 'features_info.txt' for more details about each feature.

- average:

this is the average of the feature at the subject and activity level.

