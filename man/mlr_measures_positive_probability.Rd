% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MeasurePositiveProbability.R
\name{mlr_measures_positive_probability}
\alias{mlr_measures_positive_probability}
\alias{MeasurePositiveProbability}
\title{Positive Probability Measure}
\description{
Return the probabiliy of a positive prediction, often known as 'Calders-Wevers' gap.
This is defined as count of positive predictions divided by the number of observations.
}
\examples{
\dontshow{if (rlang::is_installed("rpart")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
library("mlr3")
# Create Positive Probability Measure
t = tsk("adult_train")
learner = lrn("classif.rpart", cp = .01)
learner$train(t)
measure = msr("classif.pp")
predictions = learner$predict(t)
predictions$score(measure, task = t)
\dontshow{\}) # examplesIf}
}
\section{Super class}{
\code{\link[mlr3:Measure]{mlr3::Measure}} -> \code{MeasurePositiveProbability}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-MeasurePositiveProbability-new}{\code{MeasurePositiveProbability$new()}}
\item \href{#method-MeasurePositiveProbability-clone}{\code{MeasurePositiveProbability$clone()}}
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
\if{html}{\out{<a id="method-MeasurePositiveProbability-new"></a>}}
\if{latex}{\out{\hypertarget{method-MeasurePositiveProbability-new}{}}}
\subsection{Method \code{new()}}{
Initialize a Measure Positive Probability Object
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MeasurePositiveProbability$new()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-MeasurePositiveProbability-clone"></a>}}
\if{latex}{\out{\hypertarget{method-MeasurePositiveProbability-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MeasurePositiveProbability$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
