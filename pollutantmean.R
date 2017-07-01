pollutantmean<-function(directory,pollutant,IDs=1:332)
{
  setwd(directory)
  count<-1
  tab<-NA
  for(i in IDs)
  {
    
    if(IDs[count]<10)
       file<-paste("00",IDs[count],".csv",sep="")
      else if(IDs[count]<100 & IDs[count]>=10)
              file<-paste("0",IDs[count],".csv",sep="")
            else 
              file<-paste(IDs[count],".csv",sep="")
            
    temptable<-read.csv(file, header = TRUE, sep = ",", quote = "\"",dec = ".", fill = TRUE,col.names=c("Date","sulfate","nitrate","ID"))
    tab<-c(tab,temptable[pollutant])
    
    count<-count+1
    
  }
  
  tab<-unlist(tab)
  
  selectNA<-is.na(tab)
  tab<-tab[!selectNA]
  
  mean(tab)
  
}
