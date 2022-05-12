## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(mlr3fairness)
library(mlr3pipelines)
library(mlr3)

task = tsk("adult_train")

## ---- echo = FALSE------------------------------------------------------------
library(mlr3misc)
dt = as.data.table(mlr_pipeops)
knitr::kable(dt[map_lgl(dt$tags, function(x) "fairness" %in% x)][, c(1,7,8,9,10)])

## -----------------------------------------------------------------------------
p1 = po("reweighing_wts")

## -----------------------------------------------------------------------------
t1 = p1$train(list(task))[[1]]

## -----------------------------------------------------------------------------
set.seed(4321)
learner = lrn("classif.rpart", cp = 0.005)
learner_rw = as_learner(po("reweighing_wts") %>>% learner)
grd = benchmark_grid(list(task), list(learner, learner_rw), rsmp("cv", folds=3))
bmr = benchmark(grd)

## -----------------------------------------------------------------------------
bmr$aggregate(msrs(c("fairness.tpr", "fairness.acc")))

## -----------------------------------------------------------------------------
fairness_accuracy_tradeoff(bmr, msr("fairness.tpr"))

