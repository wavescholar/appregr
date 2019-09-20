# appregr

[![logo](logo.png)](logo.png)

[![DOI](https://zenodo.org/badge/195104416.svg)](https://zenodo.org/badge/latestdoi/195104416)

[![codecov](https://codecov.io/gh/brucebcampbell/appregr/branch/master/graph/badge.svg)](https://codecov.io/gh/brucebcampbell/appregr)

[![TravisCI](https://travis-ci.com/brucebcampbell/appregr.svg?branch=master)](https://travis-ci.com/brucebcampbell/appregr.svg?branch=master)

[![PyPI license](https://img.shields.io/pypi/l/ansicolortags.svg)](https://pypi.python.org/pypi/ansicolortags/)

This package is holds some regression vignettes and R functions for regression diagnostics.    

## Installation

You can install the released version of appregr with:

``` r
install.packages("remotes")
remotes::install_github("brucebcampbell/appregr")
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
=======

## Devops Notes

TravisCI has trouble building the rstan and rstanarm libraries. Also the vignettes for the Bayesian models take a long time to build which can couse a timeout with travis. For those reasons we've removed the gh-pages deploy of the documentation.  This is the travis yaml that was redacted.

```
before_install:
- Rscript -e 'install.packages(c("bayesm","lattice","lme4","lmtest","R2jags","bayesplot","caret","GGally","ggplot2","hexbin","latex2exp","papeR","parallel","rstan","rstanarm"," sandwich","sqldf","coda"),dependencies = TRUE)'

after_success:
- Rscript -e 'pkgdown::build_site()'

deploy:
provider: pages
skip_cleanup: true
github_token: $GITHUB_TOKEN  # Set in the settings page of your repository, as a secure variable
local_dir: "docs"
keep_history: true
on:
  branch: master

  ```
