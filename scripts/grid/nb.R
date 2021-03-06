#fl.min <- dfParams[row, "tune"]$fl$min
#fl.max <- dfParams[row, "tune"]$fl$max
#fl.step <- dfParams[row, "tune"]$fl$step

#usekernel <- dfParams[row, "tune"]$usekernel$value

#adjust.min <- dfParams[row, "tune"]$adjust$min
#adjust.max <- dfParams[row, "tune"]$adjust$max
#adjust.step <- dfParams[row, "tune"]$adjust$step

fl.min <- as.numeric(dfParams$tune[[index]]$fl$min[1])
fl.max <- as.numeric(dfParams$tune[[index]]$fl$max[1])
fl.step <- as.numeric(dfParams$tune[[index]]$fl$step[1])

usekernel <- dfParams$tune[[index]]$usekernel$value[2]

adjust.min <- as.numeric(dfParams$tune[[index]]$adjust$min[3])
adjust.max <- as.numeric(dfParams$tune[[index]]$adjust$max[3])
adjust.step <- as.numeric(dfParams$tune[[index]]$adjust$step[3])

grid <- expand.grid(
  fL = seq(from = fl.min, to = fl.max, by = fl.step),
  usekernel= usekernel,
  adjust = seq(from = adjust.min, to = adjust.max, by = adjust.step)
)
