grid <- expand.grid(
  model = data.params$tune$model$value,
  winnow = data.params$tune$winnow$value,
  trials = seq(from = data.params$tune$trials$mix, to = data.params$tune$trials$max, by = data.params$tune$trials$step)
)
