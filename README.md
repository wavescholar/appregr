# appregr
[![DOI](https://zenodo.org/badge/195104416.svg)](https://zenodo.org/badge/latestdoi/195104416)

[![codecov](https://codecov.io/gh/brucebcampbell/appregr/branch/master/graph/badge.svg)](https://codecov.io/gh/brucebcampbell/appregr)

[![TravisCI](https://travis-ci.com/brucebcampbell/appregr.svg?branch=master)](https://travis-ci.com/brucebcampbell/appregr.svg?branch=master)

[![PyPI license](https://img.shields.io/pypi/l/ansicolortags.svg)](https://pypi.python.org/pypi/ansicolortags/)

This package is holds some regression vignettes and R functions for regression diagnostics.    

## Installation

You can install the released version of appregr from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("appregr")
```

## Example

This is a basic example which shows you how to get the leverage of a linear model:

``` r
high.leverage <- appregr::checkleverage(lm.fit,df)
pander(high.leverage, caption = "High Leverage Data Elements")
```

Check for outliers:

```{r}
resutls<- appregr::checkoutliers(lm.fit = lm.fit,df = df)
```
