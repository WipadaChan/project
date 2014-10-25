# Course project Getting and cleaning data
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set

# read the training data
train<-read.table("./dataloc/UCI HAR Dataset/train/X_train.txt")
trainLabel<-read.table("./dataloc/UCI HAR Dataset/train/Y_train.txt")
trainSub<-read.table("./dataloc/UCI HAR Dataset/train/subject_train.txt")


#rename column in subject train dataset
colnames(trainSub)<-"subjectID"
names(trainSub)
# add Subject Identification to the train dataset
train<-cbind(train,trainSub)
head(train$subjecid)
summary(trainLabel)
colnames(trainLabel)<-"activityLabel"

# final prepare data for train dataset
train<-cbind(train,trainLabel)

# Prepare test dataset
test<-read.table("./dataloc/UCI HAR Dataset/test/X_test.txt")
testLabel<-read.table("./dataloc/UCI HAR Dataset/test/Y_test.txt")
testSub<-read.table("./dataloc/UCI HAR Dataset/test/subject_test.txt")
colnames(testSub)<-"subjectID"
colnames(testLabel)<-"activityLabel"

# add Subject Identification to the test dataset
test<-cbind(test,testSub)
test<-cbind(test,testLabel)

# Step 1:Merges the training and the test sets to create one data set.
# create a combine dataset from train and test data
fulldata<-rbind(train,test)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
#assign label to columns
featurs<-read.table("./dataloc/UCI HAR Dataset/features.txt")
# select only mean and standard diviation column
featurs[grep("mean()|std()", featurs$V2), "sel2"] <- 1
table(featurs$sel2)
tem<-ifelse(featurs$sel2==1,featurs$V1,NA)
# get a vector list of location of which column to be selected
sel<- tem[!is.na(tem)]
# generate a vector list of column name
varnames<-featurs[sel,2]

sel<-c(sel,562, 563)
# dataset with only mean() and std() of each measurement
meanStd<-fulldata[,sel]

# Step 3: Appropriately labels the data set with descriptive variable names. 
colnames(meanStd)<-varnames
colnames(meanStd)[80]<- "subjectID"
colnames(meanStd)[81]<- "activityLabel"


#Step 4: Uses descriptive activity names to name the activities in the data set
# add label to activities
activity<-read.table("./dataloc/UCI HAR Dataset/activity_labels.txt")
mergelable=merge(meanStd,activity,by.x="activityLabel", by.y="V1",all=FALSE)
newdata <- mergelable[order(mergelable$subjectID, mergelable$activityLabel),]


# the 5th step
#Generate first aggregate table for first measurment 
avgData<-aggregate(newdata[,2]~newdata$subjectID+newdata$V2,newdata,mean)
colnames(avgData)[3]<-as.character(varnames[1])

for (i in 3:80){
        tem<-aggregate(newdata[,i]~newdata$subjectID+newdata$V2,newdata,mean)
        colnames(tem)[3]<-as.character(varnames[i-1])
        avgData=merge(avgData,tem,by =c("newdata$subjectID","newdata$V2"),all=TRUE)
}

# order a final dataset
finalDataset <- avgData[order(avgData[,1], avgData[,2]),]
colnames(finalDataset)[1]<-"subjectID"
colnames(finalDataset)[2]<-"Activity"
write.table(finalDataset,file="./dataloc/UCI HAR Dataset/sensor_avg_by_act_sub.txt",row.name=FALSE)