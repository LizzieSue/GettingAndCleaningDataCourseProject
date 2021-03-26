###------------------------------------------###
### Getting and Cleaning Data Course Project ###
###------------------------------------------###

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with 
    #the average of each variable for each activity and each subject.

#features
features<-read.table("./UCI HAR Dataset/features.txt", header=FALSE)

#test data
test_data<-read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
colnames(test_data)<-features[,2]
test_labels<-read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
colnames(test_labels)<-"activity"
test<-cbind(test_data,test_labels)
test_subj<-read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)

#train data
train_data<-read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
colnames(train_data)<-features[,2]
train_labels<-read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
colnames(train_labels)<-"activity"
train<-cbind(train_data,train_labels)
train_subj<-read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)

#combine data
full<-rbind(train,test)
meanstd<-grep("mean|std",names(full))
subset<-full[,meanstd]
labels<-rbind(train_labels,test_labels)
sublab<-cbind(subset,labels)
subjects<-rbind(train_subj,test_subj)
colnames(subjects)<-"subject"
sublab<-cbind(sublab,subjects)

#relabel activity variable
library(dplyr)
sublab<-sublab %>% mutate(activity=recode(activity,"1"="walking","2"="walking_upstairs",
                                          "3"="walking_downstairs","4"="sitting",
                                          "5"="standing","6"="laying"))

#create long dataset for dif values of subject/activity
library(reshape2)
long<-melt(sublab,id=names(sublab[1:79]),measure.vars = c("activity","subject"))

#create new matrix with average of each feature by activity and subject
row_names<-colnames(long[1:79])
col_names<-sort(unique(long$value))
averages<-matrix(nrow=79,ncol=36,dimnames = list(row_names,col_names))
for (i in 1:79){
  means<-tapply(long[,i],long$value,mean)
  averages[i,]<-means
}
averages<-as.data.frame(averages)
averages$feature<-rownames(averages)

#return to a long dataset by gathering average columns together
library(tidyr)
averages2<-gather(averages,subject_activity,average,-feature)

#tidy data output for submission
write.table(averages2,file="./CourseProjectOut.txt",row.names = FALSE)
