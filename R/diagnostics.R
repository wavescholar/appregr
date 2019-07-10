#' Gets high leverage elements 
#' @param model dataframe
#' @return data frame with high leverage data points
#' @export
checkleverage <- function(lm.fit,df)
{
  
  numPredictors <- ( ncol(df)-1)
  hatv <- hatvalues(lm.fit)
  lev.cut <- (numPredictors+1) *2 * 1/ nrow(df)
  high.leverage <- df[hatv > lev.cut,]
  return(high.leverage)
}

#' Gets outliers 
#' @param model dataframe
#' @return list with outliers residual range, and bonferroni corrected t vals
#' @export
checkoutliers <- function(lm.fit,df)
{
  studentized.residuals <- rstudent(lm.fit)
  max.residual <- studentized.residuals[which.max(abs(studentized.residuals))]
  residualsrange <- range(studentized.residuals)
  names(residualsrange) <- c("left", "right")
  residualsrange=t(residualsrange)
  p<-numPredictors+1
  n<-nrow(df)
  t.val.alpha <- qt(.05/(n*2),n-p-1)
  #bonferroni corrected t val
  correctedtval <- data.frame(t.val.alpha = t.val.alpha)
  
  outlier.index <- abs(studentized.residuals) > abs(t.val.alpha)
  
  outliers <- df[outlier.index==TRUE,]
  
  results <- list(residualsrange=residualsrange, outliers=outliers,correctedtval=correctedtval)
  return(results)
  
}