complete<-function(directory,id=1:332)
{
  setwd(directory)
  
  completecase<-data.frame(ID=integer(),nobs=integer(), stringsAsFactors=FALSE)
  
  count<-1
  
  for(i in id)
  {
    if(id[count]<10)
       file<-paste("00",id[count],".csv",sep="")
     else if(id[count]<100 & id[count]>=10)
             file<-paste("0",id[count],".csv",sep="")
           else 
               file<-paste(id[count],".csv",sep="")
   
    temptable<-read.csv(file, header = TRUE, sep = ",", quote = "\"",dec = ".", fill = TRUE,col.names=c("Date","sulfate","nitrate","ID"))
      
    nob<-complete.cases(temptable)
    nob<-sum(nob)
    
    completecase[nrow(completecase)+1,1]<-i
    completecase[nrow(completecase),2]<-nob
      
    count<-count+1  
  }
  
  completecase
}