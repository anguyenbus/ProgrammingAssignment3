library(dplyr)

# TRAIN DADTA
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# TEST DATA
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# DATA DESCRIPTION TO VARIABLE NAMES
variable_names <- read.table("./UCI HAR Dataset/features.txt")

# ACTIVITY LABEL
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selected_variable <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_total <- X_total[,selected_variable[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(X_total) <- variable_names[selected_variable[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.

colnames(Sub_total) <- "subject"
total <- cbind(X_total, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_all(funs(mean))

write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
write.table("## Activites :",file = "CodeBook.txt",col.names = F,row.names = F)
write.table(activity_labels, file = "CodeBook.txt", row.names = FALSE, col.names = F,append = TRUE)
write.table("## 68 Variables :",file = "CodeBook.txt",col.names = F,row.names = F,append = TRUE)
variable_names_list <- variable.names(total_mean) %>% write.table(file = "CodeBook.txt",append = TRUE, sep = " ",row.names = FALSE,col.names = FALSE)
summarised_data <- summary(data.frame(total_mean)) %>% write.table(file = "SummaryData.txt",row.names = TRUE,col.names = TRUE)