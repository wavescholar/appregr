test_that('Check checkoutliers', {  expect_is(
  {
    modelname<-'prostate'
    mdf <- appregr::getmodel(modelname)
    df <- mdf$data
    lm.fit <- mdf$fit
    appregr::checkleverage(lm.fit,df)
  }
  ,'data.frame')     })