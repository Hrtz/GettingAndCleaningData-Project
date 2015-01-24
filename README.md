## GettingAndCleaningData-Project

<b>Explanation of run_analysis.R code</b>

Note:
dplyr package is used

* From the feature.txt file measurement data labels are extracted. Since those labels are later used as column names code is designed to tidy this data first.

* Train set data (X_train.txt) is then imported. Tidied feature labels are then assigned as column names.
Subject list (from file subject_train.txt) column is placed as first column of new X Train data.

* Then test set data (X_test.txt) is being imported. Tidied feature labels are also assigned as column names.
Subject list column (subject_test.txt) is placed as first column of new X Test data.

* Both new data sets are merged into mergedData data set. Data is arranged by subject numbers.

* From this data set new data set is created (mergedDataSelect) by extracting columns which contain “mean”, “std” and “subject” strings.

* I couldn’t figure out which activity was measured for each subject (there are different number of rows for some subjects). I decided to spread activity labels (from activity_labels.txt) over all the rows.
This probably makes final results incorrect, but I hope I’ve at least made code steps and overall logic behind it good.

* Code then calculates mean for each activity by each subject.
New data set is created – merged.data1.

* This table is then exported as “CourseProject.txt” file.
