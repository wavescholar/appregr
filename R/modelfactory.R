#' Returns common models
#' @param modelname character or
#' @return list(lm.fit,df) an object of type lm and the training data
#' @export
getmodel <- function(modelname) {

    ## error handling
    if (!( is.character(modelname))) {
        stop('Wrong object type, only character is supported.')
    }

    if (modelname=='prostate')
    {
        library(faraway)
        data(prostate, package="faraway")
        df <-prostate
        lm.fit <- lm(lpsa ~ ., data=df)
        results <- list(fit=lm.fit,data=df)
        return(results)
    }
}

listavailable <-function(){
    available <- list()
    dictelem <- c(key='prostate',val="The prostate data frame has 97 rows and 9 columns. A study on 97 men with prostate cancer who were due to receive a radical prostatectomy.")

    available = c(available,dictelem)

    dictelem <- c(key='count-data',val="Synthetic Count Data.")

    available = c(available,dictelem)

    print(available)
}
