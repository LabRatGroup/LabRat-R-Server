#fl.min <- dfParams[row, "tune"]$fl$min
#fl.max <- dfParams[row, "tune"]$fl$max
#fl.step <- dfParams[row, "tune"]$fl$step

#usekernel <- dfParams[row, "tune"]$usekernel$value

#adjust.min <- dfParams[row, "tune"]$adjust$min
#adjust.max <- dfParams[row, "tune"]$adjust$max
#adjust.step <- dfParams[row, "tune"]$adjust$step

fl.min <- dfParams$tune[[1]]$fl$min[1]
fl.max <- dfParams$tune[[1]]$fl$max[1]
fl.step <- dfParams$tune[[1]]$fl$step[1]

usekernel <- dfParams$tune[[1]]$usekernel$value[2]

adjust.min <- dfParams$tune[[1]]$adjust$min[3]
adjust.max <- dfParams$tune[[1]]$adjust$max[3]
adjust.step <- dfParams$tune[[1]]$adjust$step[3]

grid <- expand.grid(
  fL = seq(from = fl.min, to = fl.max, by = fl.step),
  usekernel= usekernel,
  adjust = seq(from = adjust.min, to = adjust.max, by = adjust.step)
)
