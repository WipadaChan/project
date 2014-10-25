Codebook for the outpu dataset "sensor_avg_by_act_sub"
------------
It is a dataset that sumatisedthe average of each variable for each activity and each subject.
It original dataset are from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

###The file contains 180 observations with 81 variables###

**Subjectid**

      Subject Identification number (range from 1-30)

**Activity**  

      Activity types: 
       * LAYING
       * SITTING
       * STANDING
       * WALKING
       * WALKING_DOWNSTAIRS
       * WALKING_UPSTAIRS

Plus 79 variables that contains average value of each measurment by each subject in each activity 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation


