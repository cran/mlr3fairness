% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MeasureFairnessConstraint.R
\name{MeasureFairnessConstraint}
\alias{MeasureFairnessConstraint}
\title{Fairness Constraint Measure}
\description{
This measure allows constructing for 'constraint' measures of the following form:\cr
\deqn{min performance subject to fairness < \epsilon}
}
\section{Protected Attributes}{

The protected attribute is specified as a \code{col_role} in the corresponding \code{\link[mlr3:Task]{mlr3::Task()}}:\cr
\verb{<Task>$col_roles$pta = "name_of_attribute"} \cr
This also allows specifying more than one protected attribute,
in which case fairness will be considered on the level of intersecting groups defined by all columns
selected as a predicted attribute.
}

\examples{
\dontshow{if (rlang::is_installed("rpart")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# Accuracy subject to equalized odds fairness constraint:
library("mlr3")
t = tsk("adult_train")
learner = lrn("classif.rpart", cp = .01)
learner$train(t)
measure = msr("fairness.constraint", id = "acc_tpr", msr("classif.acc"), msr("fairness.tpr"))
predictions = learner$predict(t)
predictions$score(measure, task = t)
\dontshow{\}) # examplesIf}
}
\seealso{
mlr_measures_fairness
}
\section{Super class}{
\code{\link[mlr3:Measure]{mlr3::Measure}} -> \code{MeasureFairnessConstraint}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{performance_measure}}{(\code{Measure()})\cr
The performance measure to be used.}

\item{\code{fairness_measure}}{(\code{Measure()})\cr
The fairness measure to be used.}

\item{\code{epsilon}}{(\code{numeric})\cr
Deviation from perfect fairness that is allowed.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-MeasureFairnessConstraint-new}{\code{MeasureFairnessConstraint$new()}}
\item \href{#method-MeasureFairnessConstraint-clone}{\code{MeasureFairnessConstraint$clone()}}
}
}
\if{html}{\out{
<details open><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="aggregate"><a href='../../mlr3/html/Measure.html#method-Measure-aggregate'><code>mlr3::Measure$aggregate()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="format"><a href='../../mlr3/html/Measure.html#method-Measure-format'><code>mlr3::Measure$format()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="help"><a href='../../mlr3/html/Measure.html#method-Measure-help'><code>mlr3::Measure$help()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="print"><a href='../../mlr3/html/Measure.html#method-Measure-print'><code>mlr3::Measure$print()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="score"><a href='../../mlr3/html/Measure.html#method-Measure-score'><code>mlr3::Measure$score()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-MeasureFairnessConstraint-new"></a>}}
\if{latex}{\out{\hypertarget{method-MeasureFairnessConstraint-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MeasureFairnessConstraint$new(
  id = NULL,
  performance_measure,
  fairness_measure,
  epsilon = 0.01,
  range = c(-Inf, Inf)
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{id}}{(\code{character})\cr
The measure's id. Set to 'fairness.<base_measure_id>' if ommited.}

\item{\code{performance_measure}}{(\code{Measure()})\cr
The measure used to measure performance (e.g. accuracy).}

\item{\code{fairness_measure}}{(\code{Measure()})\cr
The measure used to measure fairness (e.g. equalized odds).}

\item{\code{epsilon}}{(\code{numeric})\cr
Allowed divergence from perfect fairness. Initialized to 0.01.}

\item{\code{range}}{(\code{numeric})\cr
Range of the resulting measure. Defaults to \code{c(-Inf, Inf)}.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-MeasureFairnessConstraint-clone"></a>}}
\if{latex}{\out{\hypertarget{method-MeasureFairnessConstraint-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MeasureFairnessConstraint$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
