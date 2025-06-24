## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(mlr3)
library(mlr3fairness)
library(mlr3learners)

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

## -----------------------------------------------------------------------------
set.seed(432L)
library("iml")
library("mlr3fairness")

learner = lrn("classif.rpart", predict_type = "prob")
task = tsk("adult_train")
# Make the task smaller:
task$filter(sample(task$row_ids, 2000))
task$select(c("sex", "relationship", "race", "capital_loss", "age", "education"))
target = task$target_names
learner$train(task)

model = Predictor$new(model = learner,
                      data = task$data()[,.SD, .SDcols = !target],
                      y = task$data()[, ..target])

custom_metric = function(actual, predicted) {
  compute_metrics(
    data = task$data(),
    target = task$target_names,
    protected_attribute = task$col_roles$pta,
    prediction = predicted,
    metrics = msr("fairness.eod")
  )
}

imp <- FeatureImp$new(model, loss = custom_metric, n.repetitions = 5L)
plot(imp)

## -----------------------------------------------------------------------------
data = task$data()
data[, setNames(as.list(summary(relationship)/.N),levels(data$relationship)), by = "sex"]

