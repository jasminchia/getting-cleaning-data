library(plyr)
#Set to working directory
setwd('/Users/chiahsoo/project/R/module 3/project/UCI HAR Dataset/');

#Read in features as column names
featureTable <- read.table("./features.txt", header=FALSE)
xColNames <- as.vector(featureTable[,2])

#Read in activity labels as column names
activityRef <- read.table("./activity_labels.txt", header=FALSE)
names(activityRef) <- c("ActivityID", "Activity Action")

#Read in the subject data from test directory
testSubject <- read.table("./test/subject_test.txt", header=FALSE)
names(testSubject) <- c("SubjectID")

#Read in the x data from test directory
xTest <- read.table("./test/x_test.txt", header=FALSE)
names(xTest) <- xColNames

#Read in the y data from test directory
yTest <- read.table("./test/y_test.txt", header=FALSE)
names(yTest) <- c("ActivityID")

#Create the test data set by merging testSubject, yTest and xTest
testData <- cbind(testSubject, yTest, xTest)

#Read in the subject data from train directory
trainSubject <- read.table("./train/subject_train.txt", header=FALSE)
names(trainSubject) <- c("SubjectID")

#Read in the X train data from train directory
xTrain <- read.table("./train/X_train.txt", header=FALSE)
names(xTrain) <- xColNames

#Read in the Y train data from train directory
yTrain <- read.table("./train/y_train.txt", header=FALSE)
names(yTrain) <- c("ActivityID")

#Create the train data by merging trainSubject, yTrain and xTrain
trainData <- cbind(trainSubject, yTrain, xTrain)

#1. Merges the training and the test sets to create one data set 
finalData <- rbind(testData, trainData)

#2. Extracts only the measurements on the mean and standard deviation
#   for each measurement

mean_std_data <- finalData[,grepl("mean|std|SubjectID|ActivityID", colnames(finalData))]

#3. Uses descriptive activity names to name the activities in the data set

for(n in 1:nrow(mean_std_data)) {
  value <- as.numeric(mean_std_data[n,2])
  mean_std_data[n,2] <- toString(activityRef[value,2])
}

#4. Appropriately labels the data set with descriptive names

# Remove parentheses
names(mean_std_data) <- gsub('\\(|\\)',"",names(mean_std_data), perl = TRUE)
# Make syntactically valid names
names(mean_std_data) <- make.names(names(mean_std_data))
# Replace abbreviation with full titles
names(mean_std_data) <- gsub('Acc',"Acceleration",names(mean_std_data))
names(mean_std_data) <- gsub('GyroJerk',"AngularAcceleration",names(mean_std_data))
names(mean_std_data) <- gsub('Gyro',"AngularSpeed",names(mean_std_data))
names(mean_std_data) <- gsub('Mag',"Magnitude",names(mean_std_data))
names(mean_std_data) <- gsub('^t',"TimeDomain.",names(mean_std_data))
names(mean_std_data) <- gsub('^f',"FrequencyDomain.",names(mean_std_data))
names(mean_std_data) <- gsub('\\.mean',".Mean",names(mean_std_data))
names(mean_std_data) <- gsub('\\.std',".StandardDeviation",names(mean_std_data))
names(mean_std_data) <- gsub('Freq\\.',"Frequency.",names(mean_std_data))
names(mean_std_data) <- gsub('Freq$',"Frequency",names(mean_std_data))

#5. Create a second, independent tidy data set with the average

full_sensor_data <- ddply(mean_std_data, c("SubjectID","ActivityID"), numcolwise(mean))
write.table(full_sensor_data, file <- "full_sensor_data.txt")
