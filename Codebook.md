# Codebook for run_analysis.R
## Variables
* training_features - The features for the training set.
* training_labels - The labels for the training set.
* training_subjects - The subjects for the training set.
* testing_features - The features for the testing set.
* testing_labels - The labels for the testing set.
* merged_features - The feature data merged into one dataset.
* merged_labels - The label data merged into one dataset.
* merged_subject - The subject data merged into one dataset.
* desired_cols - The features with mean and standard deviation in the name.
* merged_dataset - The tidy data set (aka set 1) with features and labels and descriptive column names.
* tidy_data - The tidy data set (aka set 2) with the average of each variable for each activity and each subject.

## Data
  Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
## Tranformations
* Step 1 - We merged the training and the test sets to create one data set.
* Step 2 - We extract only the measurements on the mean and standard deviation for each measurement.
* Step 3 - We applied descriptive activity names to name the activities in the data set.
* Step 4 - We appropriately label the data set with descriptive variable names.
* Step 5 - From the data set in step 4, we create a second, independent tidy data set with the average of each variable for each activity and each subject.
