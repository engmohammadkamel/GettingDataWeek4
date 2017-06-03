
library(data.table)
library(dplyr)
library(tidyr)

##this function takes a character that's either "test" or "train" and 
##returns a data frame with the column names, activity Ids, and subject IDs
prepareDataSet <- function(testOrTrain){
  if(testOrTrain=="test"){
    dataSetPath <- file.path("UCI HAR Dataset","test","X_test.txt")
    activityIdsPath <- file.path("UCI HAR Dataset","test","y_test.txt")
    subjectIdsPath <- file.path("UCI HAR Dataset","test","subject_test.txt")
  }
  else if(testOrTrain=="train"){
    dataSetPath <- file.path("UCI HAR Dataset","train","X_train.txt")
    activityIdsPath <- file.path("UCI HAR Dataset","train","y_train.txt")
    subjectIdsPath <- file.path("UCI HAR Dataset","train","subject_train.txt")
  }
  ##get the data sets
  dataSet <- fread(dataSetPath)
  activityIds <- fread(activityIdsPath)
  subjectIds <- fread(subjectIdsPath)
  ##Variable/column names
  variableNames <- fread(file.path("UCI HAR Dataset","features.txt"))
  names(dataSet) <- variableNames[,V2]
  ## Subjects IDs
  names(subjectIds) <- "subject"
  dataSet <- cbind(subjectIds,dataSet)
  ## ACtivities IDs
  names(activityIds) <- "activityid"
  dataSet <- cbind(activityIds,dataSet)
}

#load the train and test datasets into two dataframes with the variable name, the subject, and the activity IDs
testDataSet <- prepareDataSet("test")
trainDataSet <- prepareDataSet("train")
activityNamesDataset <- fread(file.path("UCI HAR Dataset","activity_labels.txt"))

#merge the test and train datasets
mergedDataSet <- rbind(trainDataSet,testDataSet)


#Get The means and STD columns
meanStdColumns <- grep("[M|m]ean|std",names(mergedDataSet))
meanStdDataSet <- mergedDataSet[,c(1,2,meanStdColumns),with=F]

#Activity Names
meanStdDataSet <- meanStdDataSet %>% 
  merge(activityNamesDataset,by.x="activityid",by.y = "V1",all = T,sort = F) %>% 
  select(activity=V2,everything(),-activityid) 

#the tidy dataset that only includes the mean for each Mean/STD feature for each subject and activity
featuresAverageDataSet <- meanStdDataSet %>% 
  gather(feature,value,-activity,-subject) %>%
  group_by(activity, subject, feature) %>%
  summarise(average = mean(value))

write.table(featuresAverageDataSet,"Features Average.txt", row.names = F)


##rm(testDataSet,trainDataSet,activityNamesDataset,mergedDataSet,meanStdColumns,meanStdDataSet)






