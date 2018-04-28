grid <- expand.grid(
  fL = seq(from = data.params$tune$fl$mix, to = data.params$tune$fl$max, by = data.params$tune$fl$step),
  usekernel= data.params$tune$userkernel$value,
  adjust = seq(from = data.params$tune$adjust$mix, to = data.params$tune$adjust$max, by = data.params$tune$adjust$step)
)
