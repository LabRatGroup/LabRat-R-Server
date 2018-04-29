k.min <- dfParams[row, "tune"]$k$min
k.max <- dfParams[row, "tune"]$k$max
k.step <- dfParams[row, "tune"]$k$step

grid <- expand.grid(
  k = seq(from = k.min, to = k.max, by = k.step)
)
