library(plotly)

animals <- data.frame(
  type = c("cows", "ducks", "spiders", "ants", "crab"),
  quantity = c(8, 12, 4, 6, 2),
  legs = c(4, 2, 8, 6, 10)
) %>% mutate(total_legs = quantity * legs)

y <- c("Quantity", "Total Legs")

data <- data.frame(y)

for (i in seq_len(nrow(animals))) {
  type <- animals$type[i]
  quantity <- animals$quantity[i]
  total_legs <- animals$total_legs[i]

  data[[type]] <- c(quantity, total_legs)
}

p <- plot_ly(data, type = "bar", orientation = "h")

for (animal_type in animals$type) {
  p <- p %>% add_trace(
    y = ~y, x = as.formula(paste0("~", animal_type)),
    name = animal_type,
    color = sample(colors(), 1)
  )
}

p <- p %>% layout(
  title = "Animals", barmode = "stack",
  xaxis = list(title = "Quantity"), yaxis = list(title = "")
)
