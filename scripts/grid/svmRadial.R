#c.min <- dfParams[row, "tune"]$C$min
#c.max <- dfParams[row, "tune"]$C$max
#c.step <- dfParams[row, "tune"]$C$step

#sigma.min <- dfParams[row, "tune"]$sigma$min
#sigma.max <- dfParams[row, "tune"]$sigma$max
#sigma.step <- dfParams[row, "tune"]$sigma$step

c.min <- as.numeric(dfParams$tune[[1]]$C$min[1])
c.max <- as.numeric(dfParams$tune[[1]]$C$min[1])
c.step <- as.numeric(dfParams$tune[[1]]$C$min[1])

sigma.min <- as.numeric(dfParams$tune[[1]]$sigma$min[2])
sigma.max <- as.numeric(dfParams$tune[[1]]$sigma$min[2])
sigma.step <- as.numeric(dfParams$tune[[1]]$sigma$min[2])

grid <- expand.grid(
  C = seq(from = c.min, to = c.max, by = c.step),
  sigma = seq(from = sigma.min, to = sigma.max, by = sigma.step)
)
