# GettingAndCleaningDataCourseProject
Final course project for Coursera class Getting and Cleaning Data as part of Data Science Specialization offered by Johns Hopkins University

Original Dataset: Human Activity Recognition Using Smartphones Dataset, Version 1.0
==================================================================
Source: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The original dataset was created by the following means:
--------------------------------------------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it was provided:
-------------------------------
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Dataset files used in this analysis:
------------------------------------
-"README.txt"
-"features.txt": list of features
-"activity_labels.txt": list to link class labels with activity name
-"train/X_train.txt": training set
-"train/y_train.txt": training labels
-"train/subject_train.txt": subject who performed the activity in training set (range 1-30)
-"test/X_test.txt": test set
-"test/y_test.txt": test labels
-"test/subject_test.txt": subject who performed the activity in test set (range 1-30)

Data files were analyzed using the following methods:
-----------------------------------------------------
-above files were read into RStudio using R version 4.0.4
-column names were added to the X files according to the features file
-test and training X files were combined
-only column names/features containing "mean" or "std" were kept in the dataset
-columns for activity labels and subject id were added to the subsetted data
-activity was recoded with the activity name rather than class label
-dataset was reshaped to become a long dataset for different values of activity and subject
-feature average was calculated over each value of activity and subject
-dataset again reshaped to gather averages into one column for tidy dataset
-final tidy dataset was written out as a text file
