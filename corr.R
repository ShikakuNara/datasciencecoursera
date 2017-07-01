corr<-function(directory,threshold=0)
{
  setwd(directory)
  source("E:/R Files/complete.R")
  
  table<-data.frame(Date=as.Date(character()),sulfate=numeric(),nitrate=numeric(),ID=integer(),stringsAsFactors=FALSE)
  
  studyfiles <- list.files(path = getwd(), pattern = NULL, all.files = T, full.names = T, recursive = T, ignore.case = T, include.dirs = T) 
 
  count<-1
  thresh<-complete(getwd(),1:332)
   for(i in studyfiles)
  {
     if(thresh[2,count]>threshold)
     {
      temptable<-read.csv(i,header = TRUE,sep = ",", quote = "\"",dec = ".", fill = TRUE, comment.char = "")
      table[seq(nrow(table)+1,nrow(table)+nrow(temptable)),]<-temptable
     }
     count<-count+1
  }
  
  corel<-cor(table[2],y=table[3],use= "na.or.complete",method = c("pearson", "kendall", "spearman"))
}