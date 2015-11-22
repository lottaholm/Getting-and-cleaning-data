## Start by loading the packages we need:
library(data.table) 
library(plyr)
library(dplyr)
library(reshape2)

## Reading in the six files we need to run the script and complete the assignment:
 
## (Will work if the files are saved in your working directory using the same 
## folder structure that was used in the original zip-file provided for this project.)
 

DT_test <-fread("./UCI HAR Dataset/test/X_test.txt")
DT_testsubjects <-fread("./UCI HAR Dataset/test/subject_test.txt")
DT_testlabels <-fread("./UCI HAR Dataset/test/Y_test.txt")

DT_train <-fread("./UCI HAR Dataset/train/X_train.txt")
DT_trainsubjects <-fread("./UCI HAR Dataset/train/subject_train.txt")
DT_trainlabels <-fread("./UCI HAR Dataset/train/Y_train.txt")

## First we want to merge the data tables containing the test/trainingsubjects and 
## test/training labels with the actual test/training data, respectively:

DT_test_complete <- cbind(DT_test, DT_testsubjects, DT_testlabels)
DT_train_complete <- cbind(DT_train, DT_trainsubjects, DT_trainlabels)

## Now we have two datasets with the data, the subject and the activities.
## Next we want to merge these into one dataframe. We do this using the rbind()
## function, 

DT_all <- rbind(DT_test_complete, DT_train_complete) 
##  Now we have a data frame of 10299 obs. of  563 variables, 
##  i.e. all the data in ONE dataframe. Next we want to assign variable names 
##  to the columns. The variable names for the first 561 columns (the actual data)
##  are found in the features.txt -file, we start by reading it in:

variable_names <-fread("./UCI HAR Dataset/features.txt")

## variable_names is now a data frame, we change this to a simple 
## character vector

v_names <- variable_names[,V2]

## we need to append two names to the end so that we eventually can assign 
## column names to all columns in DT_all

v_names_complete <- c(v_names, "Subject", "Activity")


## now we assign the character vector v_names to the variable labels (column 
## names) of DT_all.

colnames(DT_all) <- v_names_complete


## select only the columns we want, i.e. those containing either "mean()", "std()"
## or "meanFreq()" in the variable name:
DT_all_selection <- select(DT_all, contains("mean()", ignore.case = TRUE), contains("std()", ignore.case=TRUE), contains("meanFreq()", ignore.case=TRUE), Subject, Activity)

## cleaning up the names of the columns
oldnames <- colnames(DT_all_selection)
newnames <- make.names(oldnames)
colnames(DT_all_selection) <- newnames

## Now we have a dataframe with dimensions 10299 x 81.

## Next we want to change the content in the Activity-variable to more 
## descriptive labels:

DT_all_selection$Activity[DT_all_selection$Activity==1] <- "Walking"
DT_all_selection$Activity[DT_all_selection$Activity==2] <- "Walking_upstairs"
DT_all_selection$Activity[DT_all_selection$Activity==3] <- "Walking_downstairs"
DT_all_selection$Activity[DT_all_selection$Activity==4] <- "Sitting"
DT_all_selection$Activity[DT_all_selection$Activity==5] <- "Standing"
DT_all_selection$Activity[DT_all_selection$Activity==6] <- "Laying"

## Now we want to make a new separate dataset with the average of each variable 
## for each activity and each subject. We use ddply

result <- ddply(DT_all_selection, .(Subject, Activity), colwise(mean))

## Writing the data to a tabdelimited textfile

write.table(result, "./UCI HAR Dataset/tidydata.txt", sep="\t", row.name=FALSE) 





  
