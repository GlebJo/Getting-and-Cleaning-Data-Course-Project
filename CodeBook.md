<h2>Getting and Cleaning Data Course Project</h2>

Experimental data from <b>Human Activity Recognition Using Smartphones Dataset</b> was used in this project as raw data.
Original <b>test</b> and <b>train</b> datasets was joined, and derived dataset was eliminated by selection of columns named like ...mean()... and ...std()...<br>
Then 3 columns: subject_id, activity_id and activity_name wad added to this dataset.<br>
Columns names for new dataset was received from original <b>features.txt</b> file,<br> 
subject_id - from original <b>subject_train.txt</b> (subject_test.txt) files,<br> 
activity_id - from original <b>y_train.txt</b> (y_test.txt) files,<br>
activity_names - from original <b>activity_labels.txt</b> file.

New dataset consists of 10299 rows and 51 columns:
<ol>
<li><b>subject_id 
<li>activity_id 
<li>activity_name</b>
<li>tBodyAcc-mean()-X 
<li>tBodyAcc-mean()-Y 
<li>tBodyAcc-mean()-Z 
<li>tBodyAcc-std()-X
<li>tBodyAcc-std()-Y 
<li>tBodyAcc-std()-Z 
<li>tGravityAcc-mean()-X
<li>tGravityAcc-mean()-Y 
<li>tGravityAcc-mean()-Z 
<li>tGravityAcc-std()-X 
<li>tGravityAcc-std()-Y 
<li>tGravityAcc-std()-Z 
<li>tBodyAccJerk-mean()-X
<li>tBodyAccJerk-mean()-Y 
<li>tBodyAccJerk-mean()-Z 
<li>tBodyAccJerk-std()-X 
<li>tBodyAccJerk-std()-Y 
<li>tBodyAccJerk-std()-Z 
<li>tBodyGyro-mean()-X 
<li>tBodyGyro-mean()-Y 
<li>tBodyGyro-mean()-Z 
<li>tBodyGyro-std()-X 
<li>tBodyGyro-std()-Y 
<li>tBodyGyro-std()-Z 
<li>tBodyGyroJerk-mean()-X
<li>tBodyGyroJerk-mean()-Y 
<li>tBodyGyroJerk-mean()-Z 
<li>tBodyGyroJerk-std()-X 
<li>tBodyGyroJerk-std()-Y 
<li>tBodyGyroJerk-std()-Z 
<li>fBodyAcc-mean()-X
<li>fBodyAcc-mean()-Y 
<li>fBodyAcc-mean()-Z 
<li>fBodyAcc-std()-X 
<li>fBodyAcc-std()-Y 
<li>fBodyAcc-std()-Z 
<li>fBodyAccJerk-mean()-X
<li>fBodyAccJerk-mean()-Y 
<li>fBodyAccJerk-mean()-Z 
<li>fBodyAccJerk-std()-X 
<li>fBodyAccJerk-std()-Y 
<li>fBodyAccJerk-std()-Z 
<li>fBodyGyro-mean()-X
<li>fBodyGyro-mean()-Y 
<li>fBodyGyro-mean()-Z 
<li>fBodyGyro-std()-X 
<li>fBodyGyro-std()-Y 
<li>fBodyGyro-std()-Z
</ol>
Each row in new dataset presents mean and st. deviation features from original data. 

This new dataset was transformed by calculation of average values of each column, grouping by subject and activity.

Result dataset consist of 180 rows (6 activities for each of 30 subjects) and 51 columns:

first 3 column: <b>subject_id, activity_id, activity_name</b> - grouping factors and last 48 rows - average value of original data for each feature and each subject/activity combination.

New average columns receive descriptive names:
<ol>
<li>average(tBodyAcc-mean()-X)
<li>average(tBodyAcc-mean()-Y) 
<li>average(tBodyAcc-mean()-Z)
<li>average(tBodyAcc-std()-X)
<li>average(tBodyAcc-std()-Y)
<li>average(tBodyAcc-std()-Z)
<li>average(tGravityAcc-mean()-X)
<li>average(tGravityAcc-mean()-Y)
<li>average(tGravityAcc-mean()-Z) 
<li>average(tGravityAcc-std()-X) 
<li>average(tGravityAcc-std()-Y) 
<li>average(tGravityAcc-std()-Z) 
<li>average(tBodyAccJerk-mean()-X)
<li>average(tBodyAccJerk-mean()-Y) 
<li>average(tBodyAccJerk-mean()-Z) 
<li>average(tBodyAccJerk-std()-X) 
<li>average(tBodyAccJerk-std()-Y) 
<li>average(tBodyAccJerk-std()-Z) 
<li>average(tBodyGyro-mean()-X) 
<li>average(tBodyGyro-mean()-Y) 
<li>average(tBodyGyro-mean()-Z) 
<li>average(tBodyGyro-std()-X) 
<li>average(tBodyGyro-std()-Y) 
<li>average(tBodyGyro-std()-Z) 
<li>average(tBodyGyroJerk-mean()-X)
<li>average(tBodyGyroJerk-mean()-Y) 
<li>average(tBodyGyroJerk-mean()-Z) 
<li>average(tBodyGyroJerk-std()-X) 
<li>average(tBodyGyroJerk-std()-Y) 
<li>average(tBodyGyroJerk-std()-Z) 
<li>average(fBodyAcc-mean()-X)
<li>average(fBodyAcc-mean()-Y) 
<li>average(fBodyAcc-mean()-Z) 
<li>average(fBodyAcc-std()-X) 
<li>average(fBodyAcc-std()-Y) 
<li>average(fBodyAcc-std()-Z) 
<li>average(fBodyAccJerk-mean()-X)
<li>average(fBodyAccJerk-mean()-Y) 
<li>average(fBodyAccJerk-mean()-Z) 
<li>average(fBodyAccJerk-std()-X) 
<li>average(fBodyAccJerk-std()-Y) 
<li>average(fBodyAccJerk-std()-Z) 
<li>average(fBodyGyro-mean()-X)
<li>average(fBodyGyro-mean()-Y) 
<li>average(fBodyGyro-mean()-Z) 
<li>average(fBodyGyro-std()-X) 
<li>average(fBodyGyro-std()-Y) 
<li>average(fBodyGyro-std()-Z)
</ol>
