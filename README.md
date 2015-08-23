# coursera-getdata-031

## Purpose

This project contains R scripts to clean gyroscopic data from a Samsung Wearable Device for further analysis in form of
summary data for means and standard deviation

The original dataset can be found: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The cached dataset used to validate this project is found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Files

### README.md
This file

### codebook.md
The codebook describing the variables in cleaned and output summary set.

### run_analysis.R


Usage

  1. Extract the getdata-projectfiles-UCI HAR Dataset.zip into the working directory, retaining directory structure
  2. run the script with source('run_analyis.R') the script.
  3. the script will attempt to install dependent packages automatically on first use (gdata, plyr, dplyr)

Actions performed
 1. Merges the training and the test sets to create one data set.
 2. Appropriately labels the data set with descriptive variable names.
 3. Creates an independent tidy data on measurements on the mean and standard deviation for each measurement
    and exports the set with the average of each variable for each activity and each subject into tidy-summary.txt

Output
  A single text file containing the requested 'tidy' dataset
