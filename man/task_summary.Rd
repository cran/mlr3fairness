% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers.R
\name{task_summary}
\alias{task_summary}
\title{Task summary for fairness report}
\usage{
task_summary(task)
}
\arguments{
\item{task}{\link[mlr3:Task]{mlr3::Task}}
}
\value{
\code{data.frame} containing the reported information
}
\description{
Create the general task documentation in a dataframe for fairness report.
The information includes
\itemize{
\item Audit Date
\item Task Name
\item Number of observations
\item Number of features
\item Target Name
\item Feature Names
\item The Protected Attribute
}
}
\examples{
library("mlr3")
task_summary(tsk("adult_train"))
}
