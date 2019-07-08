## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(appregr)
library(pander)

## ------------------------------------------------------------------------
library(faraway)
data(prostate, package="faraway")
df <-prostate 
lm.fit <- lm(lpsa ~ ., data=df)

## ------------------------------------------------------------------------
numPredictors <- ( ncol(df)-1)
hatv <- hatvalues(lm.fit)
lev.cut <- (numPredictors+1) *2 * 1/ nrow(df)
high.leverage <- df[hatv > lev.cut,]
pander(high.leverage, caption = "High Leverage Data Elements")

## ------------------------------------------------------------------------
studentized.residuals <- rstudent(lm.fit)
max.residual <- studentized.residuals[which.max(abs(studentized.residuals))]
range.residuals <- range(studentized.residuals)
names(range.residuals) <- c("left", "right")
pander(data.frame(range.residuals=t(range.residuals)), caption="Range of Studentized residuals")
p<-numPredictors+1
n<-nrow(df)
t.val.alpha <- qt(.05/(n*2),n-p-1)
pander(data.frame(t.val.alpha = t.val.alpha), caption = "Bonferroni corrected t-value")

outlier.index <- abs(studentized.residuals) > abs(t.val.alpha)

outliers <- df[outlier.index==TRUE,]

if(nrow(outliers)>=1)
{
  pander(outliers, caption = "outliers")
}


## ------------------------------------------------------------------------
plot(lm.fit,which =4)
plot(lm.fit,which = 5)

## ------------------------------------------------------------------------

predictors <-names(lm.fit$coefficients)
predictors <- predictors[2:length(predictors)]

for(i in 1:length(predictors))
{
  predictor <- predictors[i]
  
  plot(df[,predictor],residuals(lm.fit),xlab=,ylab="Residuals",main = paste(predictor, " versus residuals", sep = ''))

}


## ------------------------------------------------------------------------
predictors <-names(lm.fit$coefficients)
predictors <- predictors[2:length(predictors)]

lm.formula <- formula(lm.fit)
response <- lm.formula[[2]] 

for(i in 1:length(predictors))
{
  predictor <- predictors[i]
  others <- predictors[  which(predictors != predictor) ]
  d.formula <-paste(response, " ~ ",sep='')
  m.formula <-paste(predictor, " ~ ",sep='')
  
  for(j in 1:(length(others)-1))
  { 
    d.formula <-paste(d.formula, others[j]," + ", sep='')
    m.formula <-paste(m.formula, others[j]," + ", sep='')
  }
  d.formula <-paste(d.formula, others[length(others)], sep='')
  d.formula <-formula(d.formula)

  m.formula <-paste(m.formula, others[length(others)], sep='')
  m.formula <-formula(m.formula)

  d <- residuals(lm(d.formula,df))
  
  m <- residuals(lm(m.formula,df))
  
  plot(m,d,xlab=paste(predictor, " residuals",sep=''),ylab="response residuals",main = paste("Partial regression plot for " , predictor,sep=''))

}

