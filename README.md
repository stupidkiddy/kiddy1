To make a tidy dataset, 

First,  call in all the needed files

then, change the column names of the two files: y_test and sub_test into "aitvity" and "ID" for later use

with this, Uses descriptive activity names to name the activities in the data set change the y_test set
and, change the y_train set
and combine the subject ID with activity they made to make a factor variable

Then, with the request of project,  combine subject_activityID with test set and change the first column names to coincide with the train set, same task for train set.

With similar variables, now can combine the test and train sets

Here, start to calculate the "subject-activity" sepecific mean for all columns by using a for loop

Finally, a data set include only mean and sd data is formed. 

Adding the variable name, write out to a new text data file: "exercise7.txt", job completed
