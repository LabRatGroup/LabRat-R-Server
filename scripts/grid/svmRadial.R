grid <- expand.grid(
  C = seq(from = data.params$tune$C$mix, to = data.params$tune$C$max, by = data.params$tune$C$step),
  sigma = seq(from = data.params$tune$sigma$mix, to = data.params$tune$sigma$max, by = data.params$tune$sigma$step)
)
