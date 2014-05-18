#   RUN_ANALYSIS
#   
#   Function run_analyses(): 
#   read data and prepare combined data table from TEST and TRAIN datasets,
#   select subset of data columns from combined data table and calculate average value of
#   each column from this subset grouped by subjet and activity values
#   
# 
#   function RUN_ANALYSIS
#   
#     libraries:    data.table, sqldf
#     data folder:  /UCI HAR Dataset/
#     usage:        run_analysis()
#   
#     input data: 
#       /UCI HAR Dataset/test/X_test.txt
#       /UCI HAR Dataset/test/Y_test.txt
#       /UCI HAR Dataset/train/X_train.txt
#       /UCI HAR Dataset/train/Y_train.txt
# 
#     output data: 
#       ./result.txt
# 
#     using function makeData()  
# 
#     returns:
#       combined and groued data table with average value in each column
# 
# 
# 
run_analysis<-function(){
  
  library(data.table)
  library(sqldf)
  
#   Headers for input data tables
#   
  headers<-read.table("./UCI HAR Dataset/features.txt")
  headers1<-headers
  headers1[,2] <-sapply(headers1[,2], FUN=function(i){gsub("[()]","",gsub("[-,]","_",i))})  
  names(headers)<-c("id", "header")
  names(headers1)<-c("id", "header")
  headers<-sqldf("select a.id, a.header as rawheader, b.header from headers a, headers1 b where a.id = b.id")

#   Data for activity column in result table
# 
  activity <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("id", "activity_name"), nrow=-1)

#   read data from test dataset
# 
test <- makeData(
    path="./UCI HAR Dataset/test/", 
    "X_test.txt", 
    yFile="Y_test.txt", 
    subjectFile="subject_test.txt",  
    headers=headers, 
    activity=activity
  )

#   read data from train dataset
# 
  train <- makeData(
    path="./UCI HAR Dataset/train/",  
    xFile="X_train.txt", 
    yFile="Y_train.txt", 
    subjectFile="subject_train.txt", 
    headers=headers, 
    activity=activity
  )

#   combine data table from test and trein data 
# 
  data <- sqldf("select * from test union all select * from train")

#   prepare set of data columns for result data table
# 
  trueHeaders <- sqldf("select * from headers where replace(header,'_','-') like '%-mean-%' or replace(header,'_','-') like '%-std-%'")

#   prepare query string for reslt data table used AVG() SQL function
# 
  queryString <- paste("AVG(",trueHeaders[1,3],") as AVG_", trueHeaders[1,3], sep="")
  nn <- nrow(trueHeaders)
  for (i in 2:nn){
    queryString <- paste(queryString,", AVG(", trueHeaders[i,3],") as AVG_", trueHeaders[i,3], sep="")
  }
  queryString <- paste( 
    "select subject_id, activity_id, activity_name, ", queryString, 
    " from data group by subject_id, activity_id, activity_name", 
    sep=""
  )

#   avgData - result table
# 
  avgData <- sqldf(queryString)

#   prepare column headers for result table
# 
  trueHeaders <- data.table(trueHeaders)
  trueHeaders[,newheader:=paste("average(", rawheader, ")", sep="")]

#   assign column headers to result data table
# 
  names(avgData) <- c("subject_id", "activity_id", "activity_name", trueHeaders$newheader)

#   output tables
#
##   write.table(avgData, "./tidy_data.txt", row.names = FALSE)
#   
  return(avgData)

}

#   Function MAKEDATA
#   
#   Parameters:
#       path          - data folder (test or train)
#       xFile         - input data 
#       yFile         - acivities for input data
#       subjectFile   - subjects for input data
#       headers       - headers for output table 
#       activity      - name for activity list (yFile)
#
#   Output:
#       output data table columns:
#         - subject ID (from subjectFile table)
#         - activity ID (from yFile table)
#         - activity name (from activity table)
#         - data columns from input data
# 
makeData <- function(path="", xFile, yFile="", subjectFile="", headers, activity){

   xFile <- paste(path, xFile, sep="")
   yFile <- paste(path, yFile, sep="")
   subjectFile <- paste(path, subjectFile, sep="")
   
#   read input data
#
   dataX <- read.table(xFile, col.names=headers[,3], nrows = -1)
   dataY <- read.table(yFile, col.names=c("activity_id"), nrow = -1)
   subjects <- read.table(subjectFile, col.names=c("subject_id"), nrow = -1)

#   input data with activity column 
# 
   dataSYX <- cbind(subjects,dataY,dataX)
   data <- sqldf("select b.activity_name, a.* from dataSYX a, activity b where a.activity_id = b.id")

#   select all column headers with name like ...mean()... or ...std()...
#
   trueHeaders <- sqldf("select * from headers where replace(header,'_','-') like '%-mean-%' or replace(header,'_','-') like '%-std-%'")

#   prepare query string true column selection
# 
  queryString <- paste("[",trueHeaders[1,3],"]", sep="")
   nn <- nrow(trueHeaders)
   for( i in 2:nn) {
     queryString <- paste(queryString, ",[", trueHeaders[i,3],"]", sep="" )
   }
   queryString<-paste("select subject_id, activity_id, activity_name, ", queryString, " from data", sep="")

   return(sqldf(queryString[1]))
  
}

