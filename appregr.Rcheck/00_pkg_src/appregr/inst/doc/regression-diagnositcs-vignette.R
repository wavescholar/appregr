## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(appregr)
library(pander)

## ------------------------------------------------------------------------
mdf <- appregr::getmodel('prostate')
df <- mdf$data
lm.fit <- mdf$fit

## ------------------------------------------------------------------------
high.leverage <- appregr::checkleverage(lm.fit,df)
pander(high.leverage, caption = "High Leverage Data Elements")

## ------------------------------------------------------------------------
resutls<- appregr::checkoutliers(lm.fit = lm.fit,df = df)

pander(resutls$residualsrange, caption="Range of Studentized residuals")
pander(resutls$correctedtval, caption = "Bonferroni corrected t-value")
if(nrow(resutls$outliers)>=1)
{
  pander(resutls$outliers, caption = "outliers")
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

