fl.min <- dfParams[row, "tune"]$fl$min
fl.max <- dfParams[row, "tune"]$fl$max
fl.step <- dfParams[row, "tune"]$fl$step

usekernel <- dfParams[row, "tune"]$usekernel$value

adjust.min <- dfParams[row, "tune"]$adjust$min
adjust.max <- dfParams[row, "tune"]$adjust$max
adjust.step <- dfParams[row, "tune"]$adjust$step

grid <- expand.grid(
  fL = seq(from = fl.min, to = fl.max, by = fl.step),
  usekernel= usekernel,
  adjust = seq(from = adjust.min, to = adjust.max, by = adjust.step)
)
