c.min <- dfParams[row, "tune"]$C$min
c.max <- dfParams[row, "tune"]$C$max
c.step <- dfParams[row, "tune"]$C$step

sigma.min <- dfParams[row, "tune"]$sigma$min
sigma.max <- dfParams[row, "tune"]$sigma$max
sigma.step <- dfParams[row, "tune"]$sigma$step

grid <- expand.grid(
  C = seq(from = c.min, to = c.max, by = c.step),
  sigma = seq(from = sigma.min, to = sigma.max, by = sigma.step)
)
