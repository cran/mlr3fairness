% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MeasureSubgroup.R
\name{groupwise_metrics}
\alias{groupwise_metrics}
\title{Evaluate a metric on each protected subgroup in a task.}
\usage{
groupwise_metrics(base_measure, task, intersect = TRUE)
}
\arguments{
\item{base_measure}{(\code{Measure()})\cr
The base metric evaluated within each subgroup.}

\item{task}{\code{\link[mlr3:Task]{mlr3::Task}} \cr
\code{\link[mlr3:Task]{mlr3::Task()}} to instantiate measures for.}

\item{intersect}{\code{\link{logical}} \cr
Should multiple pta groups be intersected? Defaults to \code{TRUE}.
Only relevant if more than one \code{pta} columns are provided.}
}
\value{
\code{list} \cr
List of \link[mlr3:Measure]{mlr3::Measure}s.
}
\description{
Instantiates one new measure per protected attribute group in a task.
Each metric is then evaluated only on predictions made for the given specific subgroup.
}
\examples{
\dontshow{if (rlang::is_installed("rpart")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
  library("mlr3")
  t = tsk("compas")
  l = lrn("classif.rpart")
  m = groupwise_metrics(msr("classif.acc"), t)
  l$train(t)$predict(t)$score(m, t)
\dontshow{\}) # examplesIf}
}
\seealso{
\link{MeasureSubgroup}
}
