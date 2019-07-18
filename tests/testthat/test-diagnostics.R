checkleverage
test_that('Check checkleverage', {  expect_is(
  {
    modelname<-'prostate'
    mdf <- appregr::getmodel(modelname)
    df <- mdf$data
    lm.fit <- mdf$fit
    appregr::checkleverage(lm.fit,df)
  }
  ,'data.frame')     })


test_that('Check checkoutliers', {  expect_is(
  {
    modelname<-'prostate'
    mdf <- appregr::getmodel(modelname)
    df <- mdf$data
    lm.fit <- mdf$fit
    appregr::checkoutliers(lm.fit,df)
  }
  ,'list')     })

test_that('Check partialregression', {  expect_is(
  {
    modelname<-'prostate'
    mdf <- appregr::getmodel(modelname)
    df <- mdf$data
    lm.fit <- mdf$fit
    appregr::partialregression(lm.fit,df)
  }
  ,'list')     })