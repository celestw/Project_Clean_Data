fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileURL, 'UCI-HAR-dataset.zip', method='curl')
unzip('./UCI-HAR-dataset.zip')
file.rename('./UCI HAR dataset','./UCI')

#1. Merges the training and the test sets to create one data set.
x.train <- read.table('./UCI/train/X_train.txt')
x.test <- read.table('./UCI/test/X_test.txt')
x <- rbind(x.train, x.test)

sub.train <- read.table('./UCI/train/subject_train.txt')
sub.test <- read.table('./UCI/test/subject_test.txt')
sub <- rbind(sub.train, sub.test)
colnames(sub) <- 'subject'

y.train <- read.table('./UCI/train/y_train.txt')
y.test <- read.table('./UCI/test/y_test.txt')
y <- rbind(y.train, y.test)
colnames(y) <- 'activity'

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
features<-read.table('./UCI/features.txt')
col <- grep("-mean\\(\\)|-std\\(\\)", features$V2)
meanorsd <- x[, col]
names(meanorsd) <- features$V2[col]

#3.Uses descriptive activity names to name the activities in the data set
act<- read.table('./UCI/activity_labels.txt')
y$V1 <- act[y$V1,2]


#4.Appropriately labels the data set with descriptive variable names.
data <- cbind(sub, x.meanorsd, y)
write.table(data, './UCI/1_merged.txt', row.name=FALSE)

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(plyr)
ave<- aggregate(. ~subject + activity, data, mean)
drops <- c("activity","subject")
ave<-ave[ , !(names(ave) %in% drops)]
write.table(ave, './UCI/2_average.txt', row.name=FALSE)
