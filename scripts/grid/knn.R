k.min <- dfParams$tune[[1]]$k$min
k.max <- dfParams$tune[[1]]$k$max
k.step <- dfParams$tune[[1]]$k$step

grid <- expand.grid(
  k = seq(from = k.min, to = k.max, by = k.step)
)
