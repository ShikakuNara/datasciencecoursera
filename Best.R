X<-read.csv("outcome-of-care-measures.csv",header=TRUE)
X<-split(X,X$State)
best<-function(state,outcome)
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
    
  X[[state]][which.min(X[[state]][,outcome]),2]
  
}