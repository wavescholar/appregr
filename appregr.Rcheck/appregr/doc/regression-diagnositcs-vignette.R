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
prr <- appregr::partialregression(lm.fit = lm.fit,df=df)

predictors <-names(prr)
for(i in 1:length(predictors))
{
  predictor <- predictors[i]
  responseresiduals <-prr[[predictor]]$responseresiduals
  covariateresiduals<- prr[[predictor]]$covariateresiduals
  plot(covariateresiduals,responseresiduals,xlab=paste(predictor, " residuals",sep=''),ylab="response residuals",main = paste("Partial regression plot for " , predictor,sep=''))

}

