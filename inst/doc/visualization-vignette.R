## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(mlr3fairness)
library(mlr3learners)
library(mlr3)

## -----------------------------------------------------------------------------
t = tsk("adult_train")
t$col_roles$pta

## -----------------------------------------------------------------------------
task = tsk("adult_train")$filter(1:5000)
learner = lrn("classif.ranger", predict_type = "prob")
learner$train(task)
predictions = learner$predict(tsk("adult_test")$filter(1:5000))

## -----------------------------------------------------------------------------
predictions$confusion

## -----------------------------------------------------------------------------
design = benchmark_grid(
  tasks = tsk("adult_train")$filter(1:5000),
  learners = lrns(c("classif.ranger", "classif.rpart"),
                  predict_type = "prob"),
  resamplings = rsmps("cv", folds = 3)
)

bmr = benchmark(design)

## -----------------------------------------------------------------------------
fairness_prediction_density(predictions, task)

## -----------------------------------------------------------------------------
fairness_prediction_density(bmr)

## -----------------------------------------------------------------------------
fairness_accuracy_tradeoff(bmr, msr("fairness.fpr"))

## -----------------------------------------------------------------------------
compare_metrics(predictions, msrs(c("fairness.fpr", "fairness.tpr")), task)

## -----------------------------------------------------------------------------
compare_metrics(bmr, msrs(c("classif.ce", "fairness.fpr", "fairness.tpr")))

## -----------------------------------------------------------------------------
bmr$score(msr("fairness.tpr"))

