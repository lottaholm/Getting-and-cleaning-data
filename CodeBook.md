#Codeboook for run_analysis.r

author: "Lotta Holm"
date: "22.11.2015"

*This codebook describes the data, the variables, their units,  all transformations, summaries and other work 
that my script (run__analysis.r) does to perform the clean up. Please refer to 
README.md for more information about the performance of the script.*


## Project Description
The course assignment was to create a script that merges two large datasets 
test and train data)of accelerometer data from Samsung Galaxy S smartphones and 
then tidies the data according to a set of instructions. 

##Study design and data processing

###The raw data
The data was provided as part of the course project assignment as a zip-file. The 
original data had been obtained from this website where you also can find a full 
description of the data gathering:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The zip file containing the raw data consisted of a folder named UCI HAR Dataset. 
Within this folder there was a set of files. Of these files, the files 
*activity_labels.txt* and *features.txt* are needed to complete the assignment. 
The folder also contained two subfolders, *test* and *train*. Their structures 
were identical and from each folder the script run__analysis.r uses the files 
*subject_test.txt*, *X_test.txt* and *Y_test.txt* as well as *subject_train.txt*, 
*X_train.txt* and *Y_train.txt* respectively. The test and train folder also 
contained additional files that were not needed for this assignment and are thus 
not covered by this codebook.


###Notes on the raw data 
The files used by the script contain the following information:

*X_test.txt*: The accelerometer data collected for the test set. 2947 rows of 
observations. Each row is one observation. The 561 columns contain the different 
features that are measured or calculated for each observation.
*X_train.txt*: The same as above, only with 7352 rows for all observations in the train set.

*subject_test.txt*: Contains 2947 rows, and one column. The number in the column 
is the id for each subject (test person) that is measured. The order of the 
entries corresponds to the order of observations in the actual data set, *X_test.txt*.
*subject_test.txt*: The same as above, only with 7352 rows matching the rows of *Y_test.txt*.

*Y_test.txt*: Contains 2947 rows, and one column. The number in the column is 
the id for the activities perfomed. The order of the entries corresponds to the 
order of observations in the actual data set, *X_test.txt*.
*Y_train.txt*: The same as above, only with 7352 rows matching the rows of *X_train.txt*.

*activity_labels.txt*: Contains the labels for the activities performed. The file 
contains six rows of activity ids ranging from 1 to 6 and their corresponding labels.

*features.txt*: Contains the labels for the 561 columns in the *X_test.txt* and 
*X_train.txt* data sets.

###The units of the raw data
The units of the raw data are listed in the table below that describs all variables.


##Creating the tidy datafile

###Guide to create the tidy data file
The assumption is that the set of files provided for this course assignment are 
downloaded and saved using the original structure in your working directory. 
Thereafter the following steps are applied:
1. All relevant files are read into R
2. Merge the files for the test set
3. Merge the files for the train set
4. Merge the test data set with the train data set
6. Name the variables in the data set
7. Select the variabels needed
8. Rename the value labels for the activities using descriptive names
9. Make a tidy data set containing only one row  per observed activity per person reporting the mean for each measurement

###Cleaning of the data
The cleaning script merges a total of seven files into one dataset with dimensions 
10299 x 81. Then it assigns descriptive activity names to name the activities in 
the data set. Finally it makes a tidy data set containing only one row  per 
observed activity per person reporting the mean for each measurement.

See the README.md-file for more details.


##Description of the variables in the tidydata.txt file
The tidydata.txt which is the output of the script is a dataframe of dimensions
180 x 81. It contains six observations each of different activities of 30 test 
persons. For each observation there are 79 measurements of either mean or 
frequency. In addition to this one column contains the id of the test person 
and one column contain information on which activity the observation is for.

###The units of the tidy data
The units of the tidy data are the same as the units for the raw data and are 
listed in the table below that describs all variables.


##The variables present in the datasets are the following:

The variable names follow a schema; the first letter in the name denotes whether
the variable belongs to the time domain (t) or the frequency domain (f). This is 
followed by a combination of "Body" (for body acceleration measurements), "Gravity"
 (for gravity acceleration measurements), "Acc" (for acceleration measurements), 
 "Jerk" (for Jerk signals), "Mag" (for Magnitude) and "Gyro" (for Gyroscope).
 


|Variable name in raw data:	|Variable name in tidy_data.txt	|Type	|Time or Frequency	|Body or Gravity	|What was Measured	|Function Applied	| Axis	|Unit of measurement|
|---	|---	|---	|---	|---	|---	|---	|---	|---|
|Subject                        	|Subject                        	|int	|NA	|NA	|NA	|NA	|NA	|NA|
|Activity                       	|Activity                       	|chr	|NA	|NA	|NA	|NA	|NA	|NA|
|tBodyAcc-mean()-X	| tBodyAcc.mean...X              	|num	|Time	|Body	|Acceleration	|Mean	|X	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAcc-mean()-Y              	| tBodyAcc.mean...Y              	|num	|Time	|Body	|Acceleration	|Mean	|Y	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAcc-mean()-Z              	| tBodyAcc.mean...Z              	|num	|Time	|Body	|Acceleration	|Mean	|Z	|Standard gravity (g = 9.80665 m/s2)|
|tGravityAcc-mean()-X           	| tGravityAcc.mean...X           	|num	|Time	|Gravity	|Acceleration	|Mean	|X	|Standard gravity (g = 9.80665 m/s2)|
|tGravityAcc-mean()-Y           	| tGravityAcc.mean...Y           	|num	|Time	|Gravity	|Acceleration	|Mean	|Y	|Standard gravity (g = 9.80665 m/s2)|
|tGravityAcc-mean()-Z           	| tGravityAcc.mean...Z           	|num	|Time	|Gravity	|Acceleration	|Mean	|Z	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAccJerk-mean()-X          	| tBodyAccJerk.mean...X          	|num	|Time	|Body	|Acceleration jerk	|Mean	|X	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAccJerk-mean()-Y          	| tBodyAccJerk.mean...Y          	|num	|Time	|Body	|Acceleration jerk	|Mean	|Y	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAccJerk-mean()-Z          	| tBodyAccJerk.mean...Z          	|num	|Time	|Body	|Acceleration jerk	|Mean	|Z	|Standard gravity (g = 9.80665 m/s2)|
|tBodyGyro-mean()-X             	| tBodyGyro.mean...X             	|num	|Time	|Body	|Gyroscope	|Mean	|X	|Rad/sec|
|tBodyGyro-mean()-Y             	| tBodyGyro.mean...Y             	|num	|Time	|Body	|Gyroscope	|Mean	|Y	|Rad/sec|
|tBodyGyro-mean()-Z             	| tBodyGyro.mean...Z             	|num	|Time	|Body	|Gyroscope	|Mean	|Z	|Rad/sec|
|tBodyGyroJerk-mean()-X         	| tBodyGyroJerk.mean...X         	|num	|Time	|Body	|Gyroscope jerk	|Mean	|X	|Rad/sec|
|tBodyGyroJerk-mean()-Y         	| tBodyGyroJerk.mean...Y         	|num	|Time	|Body	|Gyroscope jerk	|Mean	|Y	|Rad/sec|
|tBodyGyroJerk-mean()-Z         	| tBodyGyroJerk.mean...Z         	|num	|Time	|Body	|Gyroscope jerk	|Mean	|Z	|Rad/sec|
|tBodyAccMag-mean()             	| tBodyAccMag.mean..             	|num	|Time	|Body	|Acceleration magnitude	|Mean	|NA	|Standard gravity (g = 9.80665 m/s2)|
|tGravityAccMag-mean()          	| tGravityAccMag.mean..          	|num	|Time	|Gravity	|Acceleration magnitude	|Mean	|NA	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAccJerkMag-mean()         	| tBodyAccJerkMag.mean..         	|num	|Time	|Body	|Acceleration jerk magnitude	|Mean	|NA	|Standard gravity (g = 9.80665 m/s2)|
|tBodyGyroMag-mean()            	| tBodyGyroMag.mean..            	|num	|Time	|Body	|Gyroscope magnitude	|Mean	|NA	|Rad/sec|
|tBodyGyroJerkMag-mean()        	| tBodyGyroJerkMag.mean..        	|num	|Time	|Body	|Gyroscope jerk magnitude	|Mean	|NA	|Rad/sec|
|fBodyAcc-mean()-X              	| fBodyAcc.mean...X              	|num	|Frequency	|Body	|Acceleration	|Mean	|X	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAcc-mean()-Y              	| fBodyAcc.mean...Y              	|num	|Frequency	|Body	|Acceleration	|Mean	|Y	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAcc-mean()-Z              	| fBodyAcc.mean...Z              	|num	|Frequency	|Body	|Acceleration	|Mean	|Z	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAccJerk-mean()-X          	| fBodyAccJerk.mean...X          	|num	|Frequency	|Body	|Acceleration jerk	|Mean	|X	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAccJerk-mean()-Y          	| fBodyAccJerk.mean...Y          	|num	|Frequency	|Body	|Acceleration jerk	|Mean	|Y	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAccJerk-mean()-Z          	| fBodyAccJerk.mean...Z          	|num	|Frequency	|Body	|Acceleration jerk	|Mean	|Z	|Standard gravity (g = 9.80665 m/s2)|
|fBodyGyro-mean()-X             	| fBodyGyro.mean...X             	|num	|Frequency	|Body	|Gyroscope	|Mean	|X	|Rad/sec|
|fBodyGyro-mean()-Y             	| fBodyGyro.mean...Y             	|num	|Frequency	|Body	|Gyroscope	|Mean	|Y	|Rad/sec|
|fBodyGyro-mean()-Z             	| fBodyGyro.mean...Z             	|num	|Frequency	|Body	|Gyroscope	|Mean	|Z	|Rad/sec|
|fBodyAccMag-mean()             	| fBodyAccMag.mean..             	|num	|Frequency	|Body	|Acceleration magnitude	|Mean	|NA	|Standard gravity (g = 9.80665 m/s2)|
|fBodyBodyAccJerkMag-mean()     	| fBodyBodyAccJerkMag.mean..     	|num	|Frequency	|Body	|Acceleration jerk magnitude	|Mean	|NA	|Standard gravity (g = 9.80665 m/s2)|
|fBodyBodyGyroMag-mean()        	| fBodyBodyGyroMag.mean..        	|num	|Frequency	|Body	|Gyroscope magnitude	|Mean	|NA	|Rad/sec|
|fBodyBodyGyroJerkMag-mean()    	| fBodyBodyGyroJerkMag.mean..    	|num	|Frequency	|Body	|Gyroscope jerk magnitude	|Mean	|NA	|Rad/sec|
|tBodyAcc-std()-X               	| tBodyAcc.std...X               	|num	|Time	|Body	|Acceleration	|Standard deviation	|X	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAcc-std()-Y               	| tBodyAcc.std...Y               	|num	|Time	|Body	|Acceleration	|Standard deviation	|Y	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAcc-std()-Z               	| tBodyAcc.std...Z               	|num	|Time	|Body	|Acceleration	|Standard deviation	|Z	|Standard gravity (g = 9.80665 m/s2)|
|tGravityAcc-std()-X            	| tGravityAcc.std...X            	|num	|Time	|Gravity	|Acceleration	|Standard deviation	|X	|Standard gravity (g = 9.80665 m/s2)|
|tGravityAcc-std()-Y            	| tGravityAcc.std...Y            	|num	|Time	|Gravity	|Acceleration	|Standard deviation	|Y	|Standard gravity (g = 9.80665 m/s2)|
|tGravityAcc-std()-Z            	| tGravityAcc.std...Z            	|num	|Time	|Gravity	|Acceleration	|Standard deviation	|Z	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAccJerk-std()-X           	| tBodyAccJerk.std...X           	|num	|Time	|Body	|Acceleration jerk	|Standard deviation	|X	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAccJerk-std()-Y           	| tBodyAccJerk.std...Y           	|num	|Time	|Body	|Acceleration jerk	|Standard deviation	|Y	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAccJerk-std()-Z           	| tBodyAccJerk.std...Z           	|num	|Time	|Body	|Acceleration jerk	|Standard deviation	|Z	|Standard gravity (g = 9.80665 m/s2)|
|tBodyGyro-std()-X              	| tBodyGyro.std...X              	|num	|Time	|Body	|Gyroscope	|Standard deviation	|X	|Rad/sec|
|tBodyGyro-std()-Y              	| tBodyGyro.std...Y              	|num	|Time	|Body	|Gyroscope	|Standard deviation	|Y	|Rad/sec|
|tBodyGyro-std()-Z              	| tBodyGyro.std...Z              	|num	|Time	|Body	|Gyroscope	|Standard deviation	|Z	|Rad/sec|
|tBodyGyroJerk-std()-X          	| tBodyGyroJerk.std...X          	|num	|Time	|Body	|Gyroscope jerk	|Standard deviation	|X	|Rad/sec|
|tBodyGyroJerk-std()-Y          	| tBodyGyroJerk.std...Y          	|num	|Time	|Body	|Gyroscope jerk	|Standard deviation	|Y	|Rad/sec|
|tBodyGyroJerk-std()-Z          	| tBodyGyroJerk.std...Z          	|num	|Time	|Body	|Gyroscope jerk	|Standard deviation	|Z	|Rad/sec|
|tBodyAccMag-std()              	| tBodyAccMag.std..              	|num	|Time	|Body	|Acceleration magnitude	|Standard deviation	|NA	|Standard gravity (g = 9.80665 m/s2)|
|tGravityAccMag-std()           	| tGravityAccMag.std..           	|num	|Time	|Gravity	|Acceleration magnitude	|Standard deviation	|NA	|Standard gravity (g = 9.80665 m/s2)|
|tBodyAccJerkMag-std()          	| tBodyAccJerkMag.std..          	|num	|Time	|Body	|Acceleration jerk magnitude	|Standard deviation	|NA	|Standard gravity (g = 9.80665 m/s2)|
|tBodyGyroMag-std()             	| tBodyGyroMag.std..             	|num	|Time	|Body	|Gyroscope magnitude	|Standard deviation	|NA	|Rad/sec|
|tBodyGyroJerkMag-std()         	| tBodyGyroJerkMag.std..         	|num	|Time	|Body	|Gyroscope jerk magnitude	|Standard deviation	|NA	|Rad/sec|
|fBodyAcc-std()-X               	| fBodyAcc.std...X               	|num	|Frequency	|Body	|Acceleration	|Standard deviation	|X	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAcc-std()-Y               	| fBodyAcc.std...Y               	|num	|Frequency	|Body	|Acceleration	|Standard deviation	|Y	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAcc-std()-Z               	| fBodyAcc.std...Z               	|num	|Frequency	|Body	|Acceleration	|Standard deviation	|Z	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAccJerk-std()-X           	| fBodyAccJerk.std...X           	|num	|Frequency	|Body	|Acceleration jerk	|Standard deviation	|X	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAccJerk-std()-Y           	| fBodyAccJerk.std...Y           	|num	|Frequency	|Body	|Acceleration jerk	|Standard deviation	|Y	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAccJerk-std()-Z           	| fBodyAccJerk.std...Z           	|num	|Frequency	|Body	|Acceleration jerk	|Standard deviation	|Z	|Standard gravity (g = 9.80665 m/s2)|
|fBodyGyro-std()-X              	| fBodyGyro.std...X              	|num	|Frequency	|Body	|Gyroscope	|Standard deviation	|X	|Rad/sec|
|fBodyGyro-std()-Y              	| fBodyGyro.std...Y              	|num	|Frequency	|Body	|Gyroscope	|Standard deviation	|Y	|Rad/sec|
|fBodyGyro-std()-Z              	| fBodyGyro.std...Z              	|num	|Frequency	|Body	|Gyroscope	|Standard deviation	|Z	|Rad/sec|
|fBodyAccMag-std()              	| fBodyAccMag.std..              	|num	|Frequency	|Body	|Acceleration magnitude	|Standard deviation	|NA	|Standard gravity (g = 9.80665 m/s2)|
|fBodyBodyAccJerkMag-std()      	| fBodyBodyAccJerkMag.std..      	|num	|Frequency	|Body	|Acceleration jerk magnitude	|Standard deviation	|NA	|Standard gravity (g = 9.80665 m/s2)|
|fBodyBodyGyroMag-std()         	| fBodyBodyGyroMag.std..         	|num	|Frequency	|Body	|Gyroscope magnitude	|Standard deviation	|NA	|Rad/sec|
|fBodyBodyGyroJerkMag-std()     	| fBodyBodyGyroJerkMag.std..     	|num	|Frequency	|Body	|Gyroscope jerk magnitude	|Standard deviation	|NA	|Rad/sec|
|fBodyAcc-meanFreq()-X          	| fBodyAcc.meanFreq...X          	|num	|Frequency	|Body	|Acceleration	|Mean	|X	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAcc-meanFreq()-Y          	| fBodyAcc.meanFreq...Y          	|num	|Frequency	|Body	|Acceleration	|Mean	|Y	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAcc-meanFreq()-Z          	| fBodyAcc.meanFreq...Z          	|num	|Frequency	|Body	|Acceleration	|Mean	|Z	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAccJerk-meanFreq()-X      	| fBodyAccJerk.meanFreq...X      	|num	|Frequency	|Body	|Acceleration jerk	|Mean	|X	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAccJerk-meanFreq()-Y      	| fBodyAccJerk.meanFreq...Y      	|num	|Frequency	|Body	|Acceleration jerk	|Mean	|Y	|Standard gravity (g = 9.80665 m/s2)|
|fBodyAccJerk-meanFreq()-Z      	| fBodyAccJerk.meanFreq...Z      	|num	|Frequency	|Body	|Acceleration jerk	|Mean	|Z	|Standard gravity (g = 9.80665 m/s2)|
|fBodyGyro-meanFreq()-X         	| fBodyGyro.meanFreq...X         	|num	|Frequency	|Body	|Gyroscope	|Mean	|X	|Rad/sec|
|fBodyGyro-meanFreq()-Y         	| fBodyGyro.meanFreq...Y         	|num	|Frequency	|Body	|Gyroscope	|Mean	|Y	|Rad/sec|
|fBodyGyro-meanFreq()-Z         	| fBodyGyro.meanFreq...Z         	|num	|Frequency	|Body	|Gyroscope	|Mean	|Z	|Rad/sec|
|fBodyAccMag-meanFreq()         	| fBodyAccMag.meanFreq..         	|num	|Frequency	|Body	|Acceleration magnitude	|Mean	|NA	|Standard gravity (g = 9.80665 m/s2)|
|fBodyBodyAccJerkMag-meanFreq() 	| fBodyBodyAccJerkMag.meanFreq.. 	|num	|Frequency	|Body	|Acceleration jerk magnitude	|Mean	|NA	|Standard gravity (g = 9.80665 m/s2)|
|fBodyBodyGyroMag-meanFreq()    	| fBodyBodyGyroMag.meanFreq..    	|num	|Frequency	|Body	|Gyroscope magnitude	|Mean	|NA	|Rad/sec|
|fBodyBodyGyroJerkMag-meanFreq()	| fBodyBodyGyroJerkMag.meanFreq..	|num	|Frequency	|Body	|Gyroscope jerk magnitude	|Mean	|NA	|Rad/sec|

 
