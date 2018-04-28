grid <- expand.grid(
  size = seq(from = data.params$tune$size$mix, to = data.params$tune$size$max, by = data.params$tune$size$step),
  decay = seq(from = data.params$tune$decay$mix, to = data.params$tune$decay$max, by = data.params$tune$decay$step)
)
