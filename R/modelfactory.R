#' Returns common models
#' @param modelname character 
#' @return list(lm.fit,df) an object of type lm and the training data
#' @export
getmodel <- function(modelname) {

    ## error handling
    if (!( is.character(modelname))) {
        stop('Wrong object type, only character is supported.')
    }

    if (modelname=='prostate')
    {
        df <-faraway::prostate
        lm.fit <- stats::lm(lpsa ~ ., data=df)
        results <- list(fit=lm.fit,data=df)
        return(results)
    }
    if (modelname=='gala')
    {
        df <-faraway::gala
        lm.fit <- stats::lm(Species ~ Area + Elevation + Nearest + Scruz  + Adjacent, data=df)
        results <- list(fit=lm.fit,data=df)
        return(results)
    }
}

listavailable <-function(){
    available <- list()
    dictelem <- c(key='prostate',val="The prostate data frame has 97 rows and 9 columns.
                                A study on 97 men with prostate cancer who were due to receive a radical prostatectomy.")

    available = c(available,dictelem)

    dictelem <- c(key='gala',val="Species diversity on the Galapagos Islands There are 30 Galapagos islands and 7 variables in the dataset.
                                  The relationship between the number of plant species and several geographic variables is of interest.
                                  The original dataset contained several missing values which have been filled for convenience.")

    available = c(available,dictelem)

    print(available)
}
