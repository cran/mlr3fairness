## ----setup-knitr, include = FALSE---------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup-load, echo = FALSE, message = FALSE--------------------------------
library(mlr3)
library(mlr3fairness)
td = "../docs/articles"
if (!dir.exists(td)) dir.create(td, recursive = TRUE)
report_dirs = c("datasheet", "modelcard", "fairness")
unlink(paste0(td, "/", report_dirs), recursive = TRUE)

## ----eval_false_example_for_vignette, eval = FALSE, results = 'hide', message = FALSE----
#  library(mlr3fairness)
#  rmdfile = report_datasheet()
#  rmarkdown::render(rmdfile)

## ----build_modelcard_example_for_vignette, echo = FALSE, results = 'hide', message = FALSE----
rmdfile = report_modelcard(paste0(td, "/modelcard"))
rmarkdown::render(rmdfile)

## ----build_datasheet_example_for_vignette, echo = FALSE, results = 'hide', message = FALSE----
rmdfile = report_datasheet(paste0(td, "/datasheet"))
rmarkdown::render(rmdfile)

## ----build_fairness_example_for_vignette, echo = FALSE, results = 'hide', message = FALSE, warning = FALSE, error = FALSE----
task = tsk("adult_train")$filter(1:700)$select(c("age", "education", "marital_status", "sex", "race"))
learner = lrn("classif.rpart", predict_type = "prob")
rr = resample(task, learner, rsmp("cv", folds = 5))
rmdfile = report_fairness(paste0(td, "/fairness"), list(task = task, resample_result = rr))
rmarkdown::render(rmdfile)

