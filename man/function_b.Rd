% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/paper.R
\name{function_b}
\alias{function_b}
\title{calculating mean of groups}
\usage{
function_b(df)
}
\arguments{
\item{df}{first collum is assumed group, second should be numeric}
}
\value{
vector of mean
}
\description{
calculating mean of groups
}
\examples{
df=data.frame(type=c("gr", "s", "gr", "s"), finds=c(2, 6, 3, 9))
function_b(df)
}
