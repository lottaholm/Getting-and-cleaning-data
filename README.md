#README.md

This README-file explains how all of the scripts work and how they are connected.

The objective of run_analysis.r is to construct one tidy dataset from several files.
The files were downloaded as a zip-package structured as follows:

One folder named *UCI HAR Dataset* containig:
*Folders:
  *test
  *train
*Files: 
  *activity_labels.txt
  *features.txt
  *features_info.txt
  *README.txt

NB! The srcipt *run_analysis.r* will work if the files are saved in your working directory using the same 
folder structure that was used in the original zip-file provided for this project.
  
##Walk-through of the run_analysis.r-script:
  
  
**Start by loading the packages needed for the script:**
library(data.table) 
library(plyr)
library(dplyr)
library(reshape2)


**The following step is to read in the six data files we need to run the script and complete the assignment.**

From the test folder:
./UCI HAR Dataset/test/X_test.txt
./UCI HAR Dataset/test/subject_test.txt
./UCI HAR Dataset/test/Y_test.txt

From the train folder:
./UCI HAR Dataset/train/X_train.txt
./UCI HAR Dataset/train/subject_train.txt
./UCI HAR Dataset/train/Y_train.txt

** Next we want to merge the data sets as follows: 

All three files from the test-folder are merged into one data set called *DT_test_complete*. 
All three files from the train-folder are merged into one data set called *DT_train_complete*. 

Now we have two datasets with the data, the subject and the activities. Next we want 
to merge these into one dataframe. We do this using the rbind() function and end 
up with one data frame called *DT_all* with the dimensions 10299x563.

**Assigning names to the variables:
First we want to assign variable names to the columns. The variable names for the 
first 561 columns (the actual data) are found in the *features.txt* -file, we start 
by reading it in to a variable called *variable_names*.

As variable_names is now a data frame, we change this to a simple 
character vector called *v_names*. Then we append the names for the two columns 
containing information about the subjects and activities. We simply call the 
*Subject* and *Activity*. Then we assign the character vector's values to the 
column (variable) names of our dataset *DT_all*.

**Selecting only the columns we need:
We need only the columns containing measurements of mean and standard deviation. 
Thus we select only the columns containing either "mean()", "std()" or "meanFreq()"
in the variable name. Once we are done selecting, we clean the variable names to
mke syntactically valid names.

**Assigning descriptive labels:
Next we change the content in the Activity-variable to more descriptive labels 
using the value labels listed in the *activity_labels.txt* file.

**Creating one dataset with means for each pairs of subject-activity: 
We use the ddply function to calculate the means for each of the 79 measurements 
for each subject (test person) and each activity. As we have 30 persons that 
have performed six activities each, we will have 180 rows of observations. This 
is the tidy data we need to complete the assignment.

**Writing the data to a tabdelimited textfile:
When we are done, we write the data frame with the tidy data to a tab-delimited 
text file using the write.table -function.





  
