## ---- include = FALSE---------------------------------------------------------
library(mlr3)
library(mlr3fairness)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = FALSE------------------------------------------------------------
knitr::kable(mlr3fairness:::mlr_measures_fairness)

## -----------------------------------------------------------------------------
library(mlr3fairness)
library(mlr3learners)

t = tsk("adult_train")$filter(1:1000)
t$col_roles$pta

## -----------------------------------------------------------------------------
l = lrn("classif.ranger")
l$train(t)

## -----------------------------------------------------------------------------
test = tsk("adult_test")
prd = l$predict(test)

## -----------------------------------------------------------------------------
prd$score(msr("fairness.tpr"), task = test)

## -----------------------------------------------------------------------------
meas = groupwise_metrics(msr("classif.tpr"), test)
prd$score(meas, task = test)

## -----------------------------------------------------------------------------
# Binary Class false positive rates
msr("classif.fpr")

## -----------------------------------------------------------------------------
m1 = MeasureFairness$new(base_measure = msr("classif.fpr"), operation = function(x) {abs(x[1] - x[2])})
m1

## -----------------------------------------------------------------------------
m2 = msr("fairness", operation = groupdiff_absdiff, base_measure = msr("classif.tpr"))

## -----------------------------------------------------------------------------
m2 = msr("fairness", operation = groupdiff_absdiff, base_measure = msr("regr.mse"))

## -----------------------------------------------------------------------------
ms = list(msr("fairness.fnr"), msr("fairness.tnr"))
ms

m = MeasureFairnessComposite$new(measures = ms, aggfun = mean)

## -----------------------------------------------------------------------------
design = benchmark_grid(
  tasks = tsks("compas"),
  learners = lrns(c("classif.ranger", "classif.rpart"),
    predict_type = "prob", predict_sets = c("train", "predict")),
  resamplings = rsmps("cv", folds = 3)
)

bmr = benchmark(design)

# Operations have been set to `groupwise_quotient()`
measures = list( msr("fairness.tpr"), msr("fairness.npv"), msr("fairness.acc"), msr("classif.acc") )

tab = bmr$aggregate(measures)
tab

## -----------------------------------------------------------------------------
msr("fairness.acc", operation = groupdiff_diff)

## -----------------------------------------------------------------------------
t = tsk("adult_train")$filter(1:1000)
mm = msr("fairness.acc", operation = function(x) {x["Female"]})
l = lrn("classif.rpart")
prds = l$train(t)$predict(t)
prds$score(mm, t)

