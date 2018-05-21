#mtry.min <- dfParams[row, "tune"]$mtry$min
#mtry.max <- dfParams[row, "tune"]$mtry$max
#mtry.step <- dfParams[row, "tune"]$mtry$step

mtry.min <- as.numeric(dfParams$tune[[1]]$mtry$min)
mtry.max <- as.numeric(dfParams$tune[[1]]$mtry$max)
mtry.step <- as.numeric(dfParams$tune[[1]]$mtry$step)

grid <- expand.grid(
  mtry = seq(from = mtry.min, to = mtry.max, by = mtry.step)
)
