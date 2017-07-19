#' Funktion a
#'
#' @param x = numerical variable or vector
#'
#' @return x
#' @export
#'
#' @examples
#' function_a(5)


function_a <- function(x){
  x*3
}


#' calculating mean of groups
#'
#' @param df first collum is assumed group, second should be numeric
#'
#' @return vector of mean
#' @export
#' @import tidyverse
#'
#' @examples
#' df=data.frame(type=c("gr", "s", "gr", "s"), finds=c(2, 6, 3, 9))
#' function_b(df)

function_b <- function(df){
  res <-
  df %>%
    group_by(df[,1]) %>%
    summarise(me=mean(df[,2])) %>%
    as.data.frame
  return(res$me)
}

