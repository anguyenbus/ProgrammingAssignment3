###Getting and Cleaning Data Week 4 Assignment

##Data Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

##Assignment 


First, download and unzip the data file into your R working directory. 

Second, download the R source code into your R working directory. Finally, execute R source code to generate tidy data file.

Data Description The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

Code Explanation The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

New Dataset The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects

The code was written based on the instruction of this assignment -Read training and test dataset into R environment. -Read variable names into R envrionment. -Read subject index into R environment.

Merges the training and the test sets to create one data set. Use command rbind to combine training and test set