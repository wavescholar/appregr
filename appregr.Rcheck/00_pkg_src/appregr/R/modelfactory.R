#' Returns a linear model and the dataframe of data
#' @param modelname character model to get
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

#' Returns a list of available datasets
#' @return a list with descriptions - use names(returnvalue) to get valid names to pass into getmodel function.
#' @export
listavailable <-function(){
    available <- list()
    available[['prostate']]<-"97 men with prostate cancer who were due to receive a radical prostatectomy."

    available[['gala']]<-"Species diversity on the Galapagos Islands dataset"
    
    return(available)
}

#' Returns a description of requested dataset
#' @param modelname name of model to describe
#' @return String with data description
#' @export
modeldesc <-function(modelname){
    
    available<-appregr::listavailable()
    

    available[[modelname]]
    
    return(available)
}
