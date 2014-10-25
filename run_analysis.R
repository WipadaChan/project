# Course project Getting and cleaning data
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set

# read the training data
train<-read.table("./dataloc/UCI HAR Dataset/train/X_train.txt")
trainLabel<-read.table("./dataloc/UCI HAR Dataset/train/Y_train.txt")
trainSub<-read.table("./dataloc/UCI HAR Dataset/train/subject_train.txt")




#rename column in subject train dataset
colnames(trainSub)<-"subjecid"
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
colnames(testSub)<-"subjecid"
colnames(testLabel)<-"activityLabel"

# add Subject Identification to the test dataset
test<-cbind(test,testSub)
test<-cbind(test,testLabel)

# creat combine dataset from train and test data
fulldata<-rbind(train,test)

featurs<-read.table("./dataloc/UCI HAR Dataset/features.txt")
key<-mean()
featurs[grep("mean()|std()", featurs$V2), "sel2"] <- 1
table(featurs$sel2)
tem<-ifelse(featurs$sel2==1,featurs$V1,NA)
sel<- tem[!is.na(tem)]
varnames<-featurs[sel,2]

sel<-c(sel,562, 563)
# dataset with only mean() and std() of each measurement
meanStd<-fulldata[,sel]
colnames(meanStd)<-varnames
colnames(meanStd)[80]<- "subjectid"
colnames(meanStd)[81]<- "activityLabel"

# add label to activities
activity<-read.table("./dataloc/UCI HAR Dataset/activity_labels.txt")
mergelable=merge(meanStd,activity,by.x="activityLabel", by.y="V1",all=FALSE)
sort(mergelable$activityLabel,mergelable$subjectid)
tapply(mergelable$activityLabel,mergelable$subjectid, mergelable$tBodyAcc-mean()-X,avg)