library(reshape2)

#Prior to analysis, download and unzip data, and set folder as working directory.

getwd()

# Load activity labels + features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation
newFeatures <- grep(".*mean.*|.*std.*", features[,2])
newFeatures.names <- features[newFeatures,2]
newFeatures.names = gsub('-mean', 'Mean', newFeatures.names)
newFeatures.names = gsub('-std', 'Std', newFeatures.names)
newFeatures.names <- gsub('[-()]', '', newFeatures.names)


# Load the datasets
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")[newFeatures]
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(subject_train, Y_train, X_train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[newFeatures]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
data <- rbind(train, test)
colnames(data) <- c("subject", "activity", newFeatures.names)

# turn activities & subjects into factors
data$activity <- factor(data$activity, levels = activityLabels[,1], labels = activityLabels[,2])
data$subject <- as.factor(data$subject)

dataMelted <- melt(data, id = c("subject", "activity"))
dataMean <- dcast(dataMelted, subject + activity ~ variable, mean)

#print tidy dataset to .txt
write.table(dataMean, "tidy.txt", row.names = FALSE, quote = FALSE)

#make codebook
##str(dataMean)
##key(dataMean)
##summary(dataMean)
##dataMean[, .N, by=c(names(data.mean)[grep("^feat", names(dataMean))])]
##write.table(dataMean, "codebook.txt", quote=FALSE, sep="\t", row.names=FALSE)
