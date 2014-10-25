Course project: Getting and Cleaning data
=======

Repo for course project of Getting and cleaning data. It contains R file for runing Samsung data under my personal working directoty "./dataloc/UCI HAR Dataset/". 

You will find :
  * run_analysis.R:
      This file run Sumsung data where it will generate the outpu dataset name "sensor_avg_by_act_sub.txt".
  * Codebook:
      A description of variables in  "sensor_avg_by_act_sub.txt" file

How the script work:
--------
The original data has been seperate for traing and testing while we need to combine these two dataset together and create a tidy data.

1. Each dataset: train and test will be processed first. There are 3 files related with prefix: X, Y, and Subject for both train and test data. These three files will combine together in order to be able to identify each observation by subjectID and activityLabel by using cbind() function. 
2. After both train and test were processed, then both dataset will combine together with rbind() function.
3. Since we need to extract only Mean and standard deviation value of each measurement, we need to know which columns to be extract.
4. Read the feature file to get all measurements items contain in the dataset.
5. Select only items that contains string of character: "mean() or std()".
6. Then we get a vector which is the position number of columns we want to collect.
7. Subset the data frame by that vector, plus the last two columns which are subjectID and activityLabel.
8. Then set the column name by the vector that created in step 6.
9. Label the activity by merge the activityID from activity_labels.txt with our dataset.
10. Use aggregate function to calculate the average value of each measurement item by subject and activity.
11. Since I can done step 10 one by one and we have 79 items, so I loop them and merge them into one data frame.
12. At the end we will get "finalDataset" as a data frame where it will be writen to a text file name "sensor_avg_by_act_sub.txt".

Enjoy and Have a nice time. :)


