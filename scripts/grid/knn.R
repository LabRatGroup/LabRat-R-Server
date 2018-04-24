grid <- expand.grid(
  k = seq(from = data.params$tune$k$mix, to = data.params$tune$k$max, by = data.params$tune$k$step)
)
