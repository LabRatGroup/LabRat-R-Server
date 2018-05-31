#mtry.min <- dfParams[row, "tune"]$mtry$min
#mtry.max <- dfParams[row, "tune"]$mtry$max
#mtry.step <- dfParams[row, "tune"]$mtry$step

mtry.min <- as.numeric(dfParams$tune[[index]]$mtry$min)
mtry.max <- as.numeric(dfParams$tune[[index]]$mtry$max)
mtry.step <- as.numeric(dfParams$tune[[index]]$mtry$step)

grid <- expand.grid(
  mtry = seq(from = mtry.min, to = mtry.max, by = mtry.step)
)
