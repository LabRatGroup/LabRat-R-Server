model <- dfParams[row, "tune"]$model$value
winnow <- dfParams[row, "tune"]$winnow$value

trials.min <- dfParams[row, "tune"]$trials$min
trials.max <- dfParams[row, "tune"]$trials$max
trials.step <- dfParams[row, "tune"]$trials$step

grid <- expand.grid(
  model = model,
  winnow = winnow,
  trials = seq(from = trials.min, to = trials.max, by = trials.step)
)
