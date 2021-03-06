# create analysis directory
# create rmd in that directory
# use bookdown to get cap/cross-refs
# write a fn in R
# document your function with roxygen
# use the function in your rmd


#' Title
#'
#' @param a numeric
#'
#' @return a plot
#' @export
#'
#' @examples
#' number_er(9)
#' @import glue



number_er <- function(x){
  glue(x,"er")
  }

myplot <- function(x){
  plot(-1, xlim = c(0,5), ylim = c(0,5))
  curve(5*x^3,add=T)   }    # Plot an equation as a curve





