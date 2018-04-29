c.min <- dfParams[row, "tune"]$C$min
c.max <- dfParams[row, "tune"]$C$max
c.step <- dfParams[row, "tune"]$C$step

grid <- expand.grid(
  C = seq(from = c.min, to = c.max, by = c.step)
)
