#c.min <- dfParams[row, "tune"]$C$min
#c.max <- dfParams[row, "tune"]$C$max
#c.step <- dfParams[row, "tune"]$C$step

c.min <- as.numeric(dfParams$tune[[index]]$C$min)
c.max <- as.numeric(dfParams$tune[[index]]$C$min)
c.step <- as.numeric(dfParams$tune[[index]]$C$min)

grid <- expand.grid(
  C = seq(from = c.min, to = c.max, by = c.step)
)
