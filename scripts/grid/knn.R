k.min <- as.numeric(dfParams$tune[[index]]$k$min)
k.max <- as.numeric(dfParams$tune[[index]]$k$max)
k.step <- as.numeric(dfParams$tune[[index]]$k$step)

grid <- expand.grid(
  k = seq(from = k.min, to = k.max, by = k.step)
)
