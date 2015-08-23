#codebook.md

## Required Data
- The Human Activity Recognition Using Smartphones Dataset Version 1.0 (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Study Design
- The raw data was downloaded and extracted to the working directory with directory structure retained
- The script run_analyis.R is run.

The script performs the following steps:

- Loading Test and Training set data ignoring inconsequential Inertial Signals.
- Merging test and training set to a new superset.
- Converting variable names to be self describing. (see codebook details)
- Any column with standard deviation or mean value is extracted from the original set and grouped by activity and subject
  before written out at tidy-summary.txt

# CodeBook

This codebook applies describes the changes, additions and transformations applied by run_analyis.R
to the original study found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variable name improvements

The original variable names found in the dataset are not self describing. The script attempts to rectify this by applying
the following substitution table on variable names:

  'Acc'     -> accelleration

  'arCoeff' -> autoRegressionCoefficients

  'Freq'    -> frequency

  'Gyro'    -> gyroscope

  'sma'     -> signalMagnitudeArea

  'iqr'     -> interquartileRange

  'maxIndx' -> maxFrequencyMagnitudeIndex

  'mad'     -> medialAbsoluteDeviation

  'Mag'     -> magnitude

  'std'     -> standard


Additionally any measurement starting with 't' is prefixed timeDomainMeasure and any measurement starting with 'f'
is prefixed with fastFourierTransform.

Finally, any excess whitespaces and punctuation are stripped from variable names


## Output data

The tidy summary exports the following data, which is grouped

  "activity_name" - Name of the activity (SITTING, WALKING, ETC).
  "subject"       - The test subject .

### Statistical Means (Time Domain)  

  - "timeDomainMeasureBodyaccelleration.mean.X"  
  - "timeDomainMeasureBodyaccelleration.mean.Y"  
  - "timeDomainMeasureBodyaccelleration.mean.Z"  
  - "timeDomainMeasureGravityaccelleration.mean.X"
  - "timeDomainMeasureGravityaccelleration.mean.Y"
  - "timeDomainMeasureGravityaccelleration.mean.Z"
  - "timeDomainMeasureBodyaccellerationJerk.mean.X"
  - "timeDomainMeasureBodyaccellerationJerk.mean.Y"
  - "timeDomainMeasureBodyaccellerationJerk.mean.Z"
  - "timeDomainMeasureBodygyroscope.mean.X"
  - "timeDomainMeasureBodygyroscope.mean.Y"
  - "timeDomainMeasureBodygyroscope.mean.Z"
  - "timeDomainMeasureBodygyroscopeJerk.mean.X"
  - "timeDomainMeasureBodygyroscopeJerk.mean.Y"
  - "timeDomainMeasureBodygyroscopeJerk.mean.Z"
  - "timeDomainMeasureBodyaccellerationmagnitude.mean"
  - "timeDomainMeasureGravityaccellerationmagnitude.mean"
  - "timeDomainMeasureBodyaccellerationJerkmagnitude.mean"
  - "timeDomainMeasureBodygyroscopemagnitude.mean"
  - "timeDomainMeasureBodygyroscopeJerkmagnitude.mean"

### Standard Deviations (Time Domain)
  - "timeDomainMeasureBodyaccelleration.standard.X"
  - "timeDomainMeasureBodyaccelleration.standard.Y"
  - "timeDomainMeasureBodyaccelleration.standard.Z"
  - "timeDomainMeasureGravityaccelleration.standard.X"
  - "timeDomainMeasureGravityaccelleration.standard.Y"
  - "timeDomainMeasureGravityaccelleration.standard.Z"
  - "timeDomainMeasureBodyaccellerationJerk.standard.X"
  - "timeDomainMeasureBodyaccellerationJerk.standard.Y"
  - "timeDomainMeasureBodyaccellerationJerk.standard.Z"
  - "timeDomainMeasureBodygyroscope.standard.X"
  - "timeDomainMeasureBodygyroscope.standard.Y"
  - "timeDomainMeasureBodygyroscope.standard.Z"
  - "timeDomainMeasureBodygyroscopeJerk.standard.X"
  - "timeDomainMeasureBodygyroscopeJerk.standard.Y"
  - "timeDomainMeasureBodygyroscopeJerk.standard.Z"
  - "timeDomainMeasureBodyaccellerationmagnitude.standard"
  - "timeDomainMeasureGravityaccellerationmagnitude.standard"
  - "timeDomainMeasureBodyaccellerationJerkmagnitude.standard"
  - "timeDomainMeasureBodygyroscopemagnitude.standard"
  - "timeDomainMeasureBodygyroscopeJerkmagnitude.standard"


### Fast Fourier Transformations (Means)
  - "fastFourierTransformBodyaccelleration.mean.X"
  - "fastFourierTransformBodyaccelleration.mean.Y"
  - "fastFourierTransformBodyaccelleration.mean.Z"
  - "fastFourierTransformBodyaccelleration.meanfrequency.X"
  - "fastFourierTransformBodyaccelleration.meanfrequency.Y"
  - "fastFourierTransformBodyaccelleration.meanfrequency.Z"
  - "fastFourierTransformBodyaccellerationJerk.mean.X"
  - "fastFourierTransformBodyaccellerationJerk.mean.Y"
  - "fastFourierTransformBodyaccellerationJerk.mean.Z"
  - "fastFourierTransformBodyaccellerationJerk.meanfrequency.X"
  - "fastFourierTransformBodyaccellerationJerk.meanfrequency.Y"
  - "fastFourierTransformBodyaccellerationJerk.meanfrequency.Z"
  - "fastFourierTransformBodygyroscope.mean.X"
  - "fastFourierTransformBodygyroscope.mean.Y"
  - "fastFourierTransformBodygyroscope.mean.Z"
  - "fastFourierTransformBodygyroscope.meanfrequency.X"
  - "fastFourierTransformBodygyroscope.meanfrequency.Y"
  - "fastFourierTransformBodygyroscope.meanfrequency.Z"
  - "fastFourierTransformBodyaccellerationmagnitude.mean"
  - "fastFourierTransformBodyaccellerationmagnitude.meanfrequency"
  - "fastFourierTransformBodyBodyaccellerationJerkmagnitude.mean"
  - "fastFourierTransformBodyBodyaccellerationJerkmagnitude.meanfrequency"
  - "fastFourierTransformBodyBodygyroscopemagnitude.mean"
  - "fastFourierTransformBodyBodygyroscopemagnitude.meanfrequency"
  - "fastFourierTransformBodyBodygyroscopeJerkmagnitude.mean"
  - "fastFourierTransformBodyBodygyroscopeJerkmagnitude.meanfrequency"


### Fast Fourier Transformations (Standard Deviation)
  - "fastFourierTransformBodyaccelleration.standard.X"
  - "fastFourierTransformBodyaccelleration.standard.Y"
  - "fastFourierTransformBodyaccelleration.standard.Z"
  - "fastFourierTransformBodyaccellerationJerk.standard.X"
  - "fastFourierTransformBodyaccellerationJerk.standard.Y"
  - "fastFourierTransformBodyaccellerationJerk.standard.Z"
  - "fastFourierTransformBodygyroscope.standard.X"
  - "fastFourierTransformBodygyroscope.standard.Y"
  - "fastFourierTransformBodygyroscope.standard.Z"
  - "fastFourierTransformBodyaccellerationmagnitude.standard"
  - "fastFourierTransformBodyBodyaccellerationJerkmagnitude.standard"
  - "fastFourierTransformBodyBodygyroscopemagnitude.standard"
  - "fastFourierTransformBodyBodygyroscopeJerkmagnitude.standard"



# Original Raw Dataset descriptor

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Notes:
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
