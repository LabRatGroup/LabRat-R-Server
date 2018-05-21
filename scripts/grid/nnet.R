#size.min <- dfParams[row, "tune"]$size$min
#size.max <- dfParams[row, "tune"]$size$max
#size.step <- dfParams[row, "tune"]$size$step

#decay.min <- dfParams[row, "tune"]$decay$min
#decay.max <- dfParams[row, "tune"]$decay$max
#decay.step <- dfParams[row, "tune"]$decay$step

size.min <- as.numeric(dfParams$tune[[1]]$size$min[1])
size.max <- as.numeric(dfParams$tune[[1]]$size$max[1])
size.step <- as.numeric(dfParams$tune[[1]]$size$step[1])

decay.min <- as.numeric(dfParams$tune[[1]]$decay$min[2])
decay.max <- as.numeric(dfParams$tune[[1]]$decay$min[2])
decay.step <- as.numeric(dfParams$tune[[1]]$decay$min[2])

grid <- expand.grid(
  size = seq(from = size.min, to = size.max, by = size.step),
  decay = seq(from = decay.min, to = decay.max, by = decay.step)
)
