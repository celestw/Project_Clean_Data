Objectives (From assigment page)
-----------------

`run_analysis.R` performs the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

run_analysis.R
-----------------
This is how it has the data cleaned and results generated
1. It read each files into a dataset seperately. At this step It temporarily grouped data into 3 datasets x, y and sub (one for each subfolder)
2. It obtained columns containing mean and std in their names using regular expression operations. It only read in those columns whose names are qualified.
3. It read activity labels from the corresponding .txt and replace numbers in Y with proper labels.
4. It combined all datasets (x,y,sub) into one clean dataset and save it to a .txt file 1_merge.txt
5. It uses aggregate() from library(plyr) to calculate the mean of the clean dataset by "subject" and "activity"
6. It dropped column "subject" and "activity" as they only contain "NA". The final result is writen to 2_average.txt

List of references
-----------------
https://github.com/foxyreign/Getting-and-Cleaning-Data/blob/master/run_analysis.R
https://rstudio-pubs-static.s3.amazonaws.com/37290_8e5a126a3a044b95881ae8df530da583.html

