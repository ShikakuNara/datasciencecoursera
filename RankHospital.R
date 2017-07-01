X<-read.csv("outcome-of-care-measures.csv",header=TRUE)
X<-split(X,X$State)
RankHospital<-function(state,outcome,num=1)
{
  outcome<-paste("Hospital.30.Day.Death..Mortality..Rates.from.",outcome,sep="")
  
  if(!(state %in% names(X)))
  {
    stop("invalid state!")
  }
  else if(!(outcome %in% colnames(X[[state]])))
  {
    stop("invalid outcome!")
  }
  
  vect<-X[[state]][,outcome]
  vect<-as.vector(vect)
  vect<-as.numeric(vect)
  r<-rank(vect,na.last="keep",ties.method="first")

  X[[state]][match(num,r),2]
}