 
setwd("/Users/mengmeng/Documents/coursera/dataCleaning/project/UCI HAR Dataset")

# call in all the needed files
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/Y_test.txt")
sub_test <- read.table("test/subject_test.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/Y_train.txt")
sub_train<- read.table("train/subject_train.txt")
feature <- read.table("features.txt")
coding <- read.csv("meanSdCoding3.csv",header=FALSE)

#change the column manes of the teo files
colnames(y_test) = "activity"
colnames(sub_test) = "ID"

#Uses descriptive activity names to name the activities in the data set
# change the y_test set
y_test$activity[y_test$activity == 1] <- "Walking"
y_test$activity[y_test$activity ==2] <- "Walking_Upstairs"
y_test$activity[y_test$activity == 3] <- "Walking_Downstairs"
y_test$activity[y_test$activity == 4] <- "Sitting"
y_test$activity[y_test$activity == 5] <- "Standing"
y_test$activity[y_test$activity == 6] <- "Laying"
sub_test$subjectID <- paste0(sub_test$ID, '',"sub")
# change the y_train set
colnames(y_train) = "activity"
colnames(sub_train) = "ID"
y_train$activity[y_train$activity == 1] <- "Walking"
y_train$activity[y_train$activity ==2] <- "Walking_Upstairs"
y_train$activity[y_train$activity == 3] <- "Walking_Downstairs"
y_train$activity[y_train$activity == 4] <- "Sitting"
y_train$activity[y_train$activity ==5] <- "Standing"
y_train$activity[y_train$activity == 6] <- "Laying"
sub_train$subjectID <- paste0(sub_train$ID, '', "sub")

#combine the subject ID with activity they made to 
    #make a factor variable
sub_test$subAct <- paste0(sub_test$subjectID,'_',y_test$activity)
sub_train$subAct<- paste0(sub_train$subjectID,'_',y_train$activity)

#subset the dataset include only the mean and sd columns
data_test <- x_test[,c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)]
data_train <- x_train[,c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)]

#combine subject_activityID with test set and change the 
   #first column names to coincide with the train set
test <- cbind(sub_test$subAct,data_test)
colnames(test)[1]<- "subAct"
 
# teh same for train set
train <- cbind(sub_train$subAct,data_train)
colnames(train)[1] <- "subAct" 

#bind the test and train datasets
data <- rbind(test,train)

#calculate the "subject-activity" sepecific mean for all
   # columns
n_col <- 67
bb = data.frame(outs) 
  for (i in 2:n_col ){
    spl <- split(data[,i],data$subAct)
    outs<-unlist(lapply(spl,function(x) mean(x)))
    bb = data.frame(bb,outs)
  }
#remove the first redundant column
bb<-bb[,-1]
#add the descriptive column names
colnames(bb) <- coding$V4
# write the .txt file 
write.table(bb,file = "exercise.txt",row.name=FALSE)



