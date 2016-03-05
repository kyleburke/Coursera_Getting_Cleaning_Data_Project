# 1. Merges the training and the test sets to create one data set.
training_features <- read.table("UCI HAR Dataset/train/X_train.txt")
training_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
training_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

testing_features <- read.table("UCI HAR Dataset/test/X_test.txt")
testing_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
testing_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# This gives us all the feature data merged into one dataset
merged_features <- rbind(training_features, testing_features)

# This gives us all the label data merged into one dataset
merged_labels <- rbind(training_labels, testing_labels)

# This gives us all the subject data merged into one dataset
merged_subjects <- rbind(training_subjects, testing_subjects)

############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

feature_names <- read.table("UCI HAR Dataset/features.txt")

# get the features with mean or standard deviation in the name
desired_cols <- grep("-(mean|std)\\(\\)", feature_names[, 2])

# get subset with the desired columns
merged_features <- merged_features[, desired_cols]

# set the column names
names(merged_features) <- feature_names[desired_cols, 2]

###########################################################################
# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Give the activities descriptive labels
merged_labels[,1] <- activities[merged_labels[,1], 2]

# Give column descriptive label
names(merged_labels) <- "activities"

##########################################################################
# 4. Appropriately labels the data set with descriptive variable names.

# Set the column name for subjects
names(merged_subjects) <- "subjects"

merged_dataset <- cbind(merged_features, merged_labels, merged_subjects)

###########################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
tidy_data <- ddply(merged_dataset, .(subjects, activities), function(x) colMeans(x[, 1:66]))

# Export the tidy dataset 
write.table(tidy_data, 'tidy_data.txt',row.names=TRUE)

