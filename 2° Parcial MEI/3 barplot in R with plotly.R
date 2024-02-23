# La paquetería "plotly" es una biblioteca de visualización interactiva en R que
# permite crear gráficos interactivos y dinámicos. Proporciona una interfaz para
# crear gráficos de alta calidad y personalizables que se pueden explorar y
# manipular fácilmente.
library(plotly)

# La paquetería "dplyr" es una biblioteca de manipulación de datos en R, que
# proporciona una gramática consistente y fácil de usar para realizar
# operaciones comunes en datos, como filtrar, ordenar, agrupar y resumir.
# Permite realizar transformaciones y manipulaciones de datos de manera
# eficiente y sencilla.
library(dplyr)

# Gráfica de barras básica
fig <- plot_ly(
  x = c("jirafas", "orangutanes", "monos"),
  y = c(20, 14, 23),
  name = "SF Zoo",
  type = "bar"
)

fig

# Gráfica de barras agrupada
animals <- c("giraffes", "orangutans", "monkeys")
sf_zoo <- c(20, 14, 23)
la_zoo <- c(12, 18, 29)
data <- data.frame(animals, sf_zoo, la_zoo)

fig <- plot_ly(data, x = ~animals, y = ~sf_zoo, type = "bar", name = "SF Zoo")
fig <- fig %>% add_trace(y = ~la_zoo, name = "LA Zoo")
fig <- fig %>% layout(yaxis = list(title = "Count"), barmode = "group")

fig

# Gráfica de barras apilada
animals <- c("giraffes", "orangutans", "monkeys")
sf_zoo <- c(20, 14, 23)
la_zoo <- c(12, 18, 29)
data <- data.frame(animals, sf_zoo, la_zoo)

fig <- plot_ly(data, x = ~animals, y = ~sf_zoo, type = "bar", name = "SF Zoo")
fig <- fig %>% add_trace(y = ~la_zoo, name = "LA Zoo")
fig <- fig %>% layout(yaxis = list(title = "Count"), barmode = "stack")

fig

# Gráfico de barras con texto flotante
x <- c("Product A", "Product B", "Product C")
y <- c(20, 14, 23)
text <- c("27% market share", "24% market share", "19% market share")
data <- data.frame(x, y, text)

fig <- plot_ly(data,
  x = ~x, y = ~y, type = "bar", text = text,
  marker = list(
    color = "rgb(158,202,225)",
    line = list(
      color = "rgb(8,48,107)",
      width = 1.5
    )
  )
)
fig <- fig %>% layout(
  title = "January 2013 Sales Report",
  xaxis = list(title = ""),
  yaxis = list(title = "")
)

fig

# Gráfico de barras con etiquetas directas
x <- c("Product A", "Product B", "Product C")
y <- c(20, 14, 23)
text <- c("27% market share", "24% market share", "19% market share")
data <- data.frame(x, y, text)

fig <- plot_ly(data,
  x = ~x, y = ~y, type = "bar",
  text = y, textposition = "auto",
  marker = list(
    color = "rgb(158,202,225)",
    line = list(color = "rgb(8,48,107)", width = 1.5)
  )
)
fig <- fig %>% layout(
  title = "January 2013 Sales Report",
  xaxis = list(title = ""),
  yaxis = list(title = "")
)

fig

# Gráfico de barras agrupadas con etiquetas directas
x <- c("Product A", "Product B", "Product C")
y <- c(20, 14, 23)
y2 <- c(16, 12, 27)
text <- c("27% market share", "24% market share", "19% market share")
data <- data.frame(x, y, y2, text)

fig <- data %>% plot_ly()
fig <- fig %>% add_trace(
  x = ~x, y = ~y, type = "bar",
  text = y, textposition = "auto",
  marker = list(
    color = "rgb(158,202,225)",
    line = list(color = "rgb(8,48,107)", width = 1.5)
  )
)
fig <- fig %>% add_trace(
  x = ~x, y = ~y2, type = "bar",
  text = y2, textposition = "auto",
  marker = list(
    color = "rgb(58,200,225)",
    line = list(color = "rgb(8,48,107)", width = 1.5)
  )
)
fig <- fig %>% layout(
  title = "January 2013 Sales Report",
  barmode = "group",
  xaxis = list(title = ""),
  yaxis = list(title = "")
)

fig

# Etiquetas de gráficos de barras con rotación
x <- c(
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
)
y1 <- c(20, 14, 25, 16, 18, 22, 19, 15, 12, 16, 14, 17)
y2 <- c(19, 14, 22, 14, 16, 19, 15, 14, 10, 12, 12, 16)
data <- data.frame(x, y1, y2)

# The default order will be alphabetized unless specified as below:
data$x <- factor(data$x, levels = data[["x"]])

fig <- plot_ly(
  data,
  x = ~x,
  y = ~y1,
  type = "bar",
  name = "Primary Product",
  marker = list(color = "rgb(49,130,189)")
)
fig <- fig %>% add_trace(
  y = ~y2,
  name = "Secondary Product",
  marker = list(color = "rgb(204,204,204)")
)
fig <- fig %>% layout(
  xaxis = list(title = "", tickangle = -45),
  yaxis = list(title = ""),
  margin = list(b = 100),
  barmode = "group"
)

fig

# Personalización del color de la barra
x <- c("Feature A", "Feature B", "Feature C", "Feature D", "Feature E")
y <- c(20, 14, 23, 25, 22)
data <- data.frame(x, y)

fig <- plot_ly(data, x = ~x, y = ~y, type = "bar", color = I("black"))
fig <- fig %>% layout(
  title = "Features",
  xaxis = list(title = ""),
  yaxis = list(title = "")
)

fig

# Personalización de colores de barras individuales
x <- c("Feature A", "Feature B", "Feature C", "Feature D", "Feature E")
y <- c(20, 14, 23, 25, 22)
data <- data.frame(x, y)

fig <- plot_ly(data,
  x = ~x, y = ~y, type = "bar",
  marker = list(color = c(
    "rgba(204,204,204,1)", "rgba(222,45,38,0.8)",
    "rgba(204,204,204,1)", "rgba(204,204,204,1)",
    "rgba(204,204,204,1)"
  ))
)
fig <- fig %>% layout(
  title = "Least Used Features",
  xaxis = list(title = ""),
  yaxis = list(title = "")
)

fig

# Personalización de anchos de barras individuales
x <- c(1, 2, 3, 5.5, 10)
y <- c(10, 8, 6, 4, 2)
width <- c(0.8, 0.8, 0.8, 3.5, 4)
data <- data.frame(x, y, width)

fig <- plot_ly(data)
fig <- fig %>% add_bars(
  x = ~x,
  y = ~y,
  width = ~width
)

fig

# Personalización de la base de la barra individual
fig <- plot_ly()
fig <- fig %>% add_bars(
  x = c("2016", "2017", "2018"),
  y = c(500, 600, 700),
  base = c(-500, -600, -700),
  marker = list(
    color = "red"
  ),
  name = "expenses"
)
fig <- fig %>% add_bars(
  x = c("2016", "2017", "2018"),
  y = c(300, 400, 700),
  base = 0,
  marker = list(
    color = "blue"
  ),
  name = "revenue"
)

fig

# Mapeo de una variable de color
fig <- ggplot2::diamonds
fig <- fig %>% count(cut, clarity)
fig <- fig %>% plot_ly(x = ~cut, y = ~n, color = ~clarity, type = "bar")

fig

# Gráfico de barras coloreado y con estilo
x <- c(
  1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003,
  2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012
)
row <- c(
  219, 146, 112, 127, 124, 180, 236, 207, 236,
  263, 350, 430, 474, 526, 488, 537, 500, 439
)
china <- c(
  16, 13, 10, 11, 28, 37, 43, 55, 56,
  88, 105, 156, 270, 299, 340, 403, 549, 499
)
data <- data.frame(x, row, china)

fig <- plot_ly(data,
  x = ~x, y = ~row, type = "bar", name = "Rest of the World",
  marker = list(color = "rgb(55, 83, 109)")
)
fig <- fig %>% add_trace(
  y = ~china,
  name = "China",
  marker = list(color = "rgb(26, 118, 255)")
)
fig <- fig %>% layout(
  title = "US Export of Plastic Scrap",
  xaxis = list(
    title = "",
    tickfont = list(
      size = 14,
      color = "rgb(107, 107, 107)"
    )
  ),
  yaxis = list(
    title = "USD (millions)",
    titlefont = list(
      size = 16,
      color = "rgb(107, 107, 107)"
    ),
    tickfont = list(
      size = 14,
      color = "rgb(107, 107, 107)"
    )
  ),
  legend = list(
    x = 0,
    y = 1,
    bgcolor = "rgba(255, 255, 255, 0)",
    bordercolor = "rgba(255, 255, 255, 0)"
  ),
  barmode = "group", bargap = 0.15
)

fig

# Gráfico de barras en cascada
x <- c(
  "Product<br>Revenue", "Services<br>Revenue", "Total<br>Revenue",
  "Fixed<br>Costs", "Variable<br>Costs", "Total<br>Costs", "Total"
)
y <- c(400, 660, 660, 590, 400, 400, 340)
base <- c(0, 430, 0, 570, 370, 370, 0)
revenue <- c(430, 260, 690, 0, 0, 0, 0)
costs <- c(0, 0, 0, 120, 200, 320, 0)
profit <- c(0, 0, 0, 0, 0, 0, 370)
text <- c("$430K", "$260K", "$690K", "$-120K", "$-200K", "$-320K", "$370K")
data <- data.frame(x, base, revenue, costs, profit, text)

# The default order will be alphabetized unless specified as below:
data$x <- factor(data$x, levels = data[["x"]])

fig <- plot_ly(
  data,
  x = ~x,
  y = ~base,
  type = "bar",
  marker = list(color = "rgba(1,1,1, 0.0)")
)
fig <- fig %>% add_trace(y = ~revenue, marker = list(
  color = "rgba(55, 128, 191, 0.7)",
  line = list(
    color = "rgba(55, 128, 191, 0.7)",
    width = 2
  )
))
fig <- fig %>% add_trace(y = ~costs, marker = list(
  color = "rgba(219, 64, 82, 0.7)",
  line = list(
    color = "rgba(219, 64, 82, 1.0)",
    width = 2
  )
))
fig <- fig %>% add_trace(y = ~profit, marker = list(
  color = "rgba(50, 171, 96, 0.7)",
  line = list(
    color = "rgba(50, 171, 96, 1.0)",
    width = 2
  )
))
fig <- fig %>% layout(
  title = "Annual Profit - 2015",
  xaxis = list(title = ""),
  yaxis = list(title = ""),
  barmode = "stack",
  paper_bgcolor = "rgba(245, 246, 249, 1)",
  plot_bgcolor = "rgba(245, 246, 249, 1)",
  showlegend = FALSE
)
fig <- fig %>% add_annotations(
  text = text,
  x = x,
  y = y,
  xref = "x",
  yref = "y",
  font = list(
    family = "Arial",
    size = 14,
    color = "rgba(245, 246, 249, 1)"
  ),
  showarrow = FALSE
)

fig

# Gráficos de barras horizontales en R
fig <- plot_ly(
  x = c(20, 14, 23),
  y = c("giraffes", "orangutans", "monkeys"),
  type = "bar",
  orientation = "h"
)

fig

# Gráfico de barras horizontales de colores
y <- c("giraffes", "orangutans", "monkeys")
sf_zoo <- c(20, 14, 23)
la_zoo <- c(12, 18, 29)
data <- data.frame(y, sf_zoo, la_zoo)

fig <- plot_ly(data,
  x = ~sf_zoo, y = ~y, type = "bar", orientation = "h", name = "SF Zoo",
  marker = list(
    color = "rgba(246, 78, 139, 0.6)",
    line = list(
      color = "rgba(246, 78, 139, 1.0)",
      width = 3
    )
  )
)
fig <- fig %>% add_trace(
  x = ~la_zoo, name = "LA Zoo",
  marker = list(
    color = "rgba(58, 71, 80, 0.6)",
    line = list(
      color = "rgba(58, 71, 80, 1.0)",
      width = 3
    )
  )
)
fig <- fig %>% layout(
  barmode = "stack",
  xaxis = list(title = ""),
  yaxis = list(title = "")
)

fig

# Paleta de colores para gráfico de barras
y <- c(
  "The course was effectively<br>organized",
  "The course developed my<br>abilities and skills for<br>the subject",
  "The course developed my<br>ability to think critically about<br>the subject",
  "I would recommend this<br>course to a friend"
)
x1 <- c(21, 24, 27, 29)
x2 <- c(30, 31, 26, 24)
x3 <- c(21, 19, 23, 15)
x4 <- c(16, 15, 11, 18)
x5 <- c(12, 11, 13, 14)

data <- data.frame(y, x1, x2, x3, x4, x5)

top_labels <- c(
  "Strongly<br>agree", "Agree", "Neutral", "Disagree", "Strongly<br>disagree"
)

fig <- plot_ly(data,
  x = ~x1, y = ~y, type = "bar", orientation = "h",
  marker = list(
    color = "rgba(38, 24, 74, 0.8)",
    line = list(color = "rgb(248, 248, 249)", width = 1)
  )
)
fig <- fig %>% add_trace(
  x = ~x2, marker = list(color = "rgba(71, 58, 131, 0.8)")
)
fig <- fig %>% add_trace(
  x = ~x3, marker = list(color = "rgba(122, 120, 168, 0.8)")
)
fig <- fig %>% add_trace(
  x = ~x4, marker = list(color = "rgba(164, 163, 204, 0.85)")
)
fig <- fig %>% add_trace(
  x = ~x5, marker = list(color = "rgba(190, 192, 213, 1)")
)
fig <- fig %>% layout(
  xaxis = list(
    title = "",
    showgrid = FALSE,
    showline = FALSE,
    showticklabels = FALSE,
    zeroline = FALSE,
    domain = c(0.15, 1)
  ),
  yaxis = list(
    title = "",
    showgrid = FALSE,
    showline = FALSE,
    showticklabels = FALSE,
    zeroline = FALSE
  ),
  barmode = "stack",
  paper_bgcolor = "rgb(248, 248, 255)", plot_bgcolor = "rgb(248, 248, 255)",
  margin = list(l = 120, r = 10, t = 140, b = 80),
  showlegend = FALSE
)
# labeling the y-axis
fig <- fig %>% add_annotations(
  xref = "paper", yref = "y", x = 0.14, y = y,
  xanchor = "right",
  text = y,
  font = list(
    family = "Arial", size = 12,
    color = "rgb(67, 67, 67)"
  ),
  showarrow = FALSE, align = "right"
)
# labeling the percentages of each bar (x_axis)
fig <- fig %>% add_annotations(
  xref = "x", yref = "y",
  x = x1 / 2, y = y,
  text = paste(data[, "x1"], "%"),
  font = list(
    family = "Arial", size = 12,
    color = "rgb(248, 248, 255)"
  ),
  showarrow = FALSE
)
fig <- fig %>% add_annotations(
  xref = "x", yref = "y",
  x = x1 + x2 / 2, y = y,
  text = paste(data[, "x2"], "%"),
  font = list(
    family = "Arial", size = 12,
    color = "rgb(248, 248, 255)"
  ),
  showarrow = FALSE
)
fig <- fig %>% add_annotations(
  xref = "x", yref = "y",
  x = x1 + x2 + x3 / 2, y = y,
  text = paste(data[, "x3"], "%"),
  font = list(
    family = "Arial", size = 12,
    color = "rgb(248, 248, 255)"
  ),
  showarrow = FALSE
)
fig <- fig %>% add_annotations(
  xref = "x", yref = "y",
  x = x1 + x2 + x3 + x4 / 2, y = y,
  text = paste(data[, "x4"], "%"),
  font = list(
    family = "Arial", size = 12,
    color = "rgb(248, 248, 255)"
  ),
  showarrow = FALSE
)
fig <- fig %>% add_annotations(
  xref = "x", yref = "y",
  x = x1 + x2 + x3 + x4 + x5 / 2, y = y,
  text = paste(data[, "x5"], "%"),
  font = list(
    family = "Arial", size = 12,
    color = "rgb(248, 248, 255)"
  ),
  showarrow = FALSE
)
# labeling the first Likert scale (on the top)
fig <- fig %>% add_annotations(
  xref = "x", yref = "paper",
  x = c(
    21 / 2, 21 + 30 / 2, 21 + 30 + 21 / 2, 21 + 30 + 21 + 16 / 2,
    21 + 30 + 21 + 16 + 12 / 2
  ),
  y = 1.15,
  text = top_labels,
  font = list(
    family = "Arial", size = 12,
    color = "rgb(67, 67, 67)"
  ),
  showarrow = FALSE
)

fig

# Gráfico de barras con trazado de líneas
y <- c(
  "Japan", "United Kingdom", "Canada", "Netherlands",
  "United States", "Belgium", "Sweden", "Switzerland"
)
x_saving <- c(
  1.3586, 2.2623000000000002, 4.9821999999999997, 6.5096999999999996,
  7.4812000000000003, 7.5133000000000001, 15.2148, 17.520499999999998
)
x_net_worth <- c(
  93453.919999999998, 81666.570000000007, 69889.619999999995,
  78381.529999999999, 141395.29999999999, 92969.020000000004,
  66090.179999999993, 122379.3
)
data <- data.frame(y, x_saving, x_net_worth)

fig1 <- plot_ly(
  x = ~x_saving, y = ~ reorder(y, x_saving),
  name = "Household savings, percentage of household disposable income",
  type = "bar", orientation = "h",
  marker = list(
    color = "rgba(50, 171, 96, 0.6)",
    line = list(color = "rgba(50, 171, 96, 1.0)", width = 1)
  )
)
fig1 <- fig1 %>% layout(
  yaxis = list(
    showgrid = FALSE,
    showline = FALSE,
    showticklabels = TRUE,
    domain = c(0, 0.85)
  ),
  xaxis = list(
    zeroline = FALSE,
    showline = FALSE,
    showticklabels = TRUE,
    showgrid = TRUE
  )
)
fig1 <- fig1 %>% add_annotations(
  xref = "x1", yref = "y",
  x = x_saving * 2.1 + 3, y = y,
  text = paste(round(x_saving, 2), "%"),
  font = list(family = "Arial", size = 12, color = "rgb(50, 171, 96)"),
  showarrow = FALSE
)

fig2 <- plot_ly(
  x = ~x_net_worth, y = ~ reorder(y, x_saving),
  name = "Household net worth, Million USD/capita",
  type = "scatter", mode = "lines+markers",
  line = list(color = "rgb(128, 0, 128)")
)
fig2 <- fig2 %>% layout(
  yaxis = list(
    showgrid = FALSE, showline = TRUE, showticklabels = FALSE,
    linecolor = "rgba(102, 102, 102, 0.8)", linewidth = 2,
    domain = c(0, 0.85)
  ),
  xaxis = list(
    zeroline = FALSE, showline = FALSE, showticklabels = TRUE, showgrid = TRUE,
    side = "top", dtick = 25000
  )
)
fig2 <- fig2 %>% add_annotations(
  xref = "x2", yref = "y",
  x = x_net_worth, y = y,
  text = paste(x_net_worth, "M"),
  font = list(family = "Arial", size = 12, color = "rgb(128, 0, 128)"),
  showarrow = FALSE
)

fig <- subplot(fig1, fig2)
fig <- fig %>% layout(
  title = "Household savings & net worth for eight OECD countries",
  legend = list(
    x = 0.029, y = 1.038,
    font = list(size = 10)
  ),
  margin = list(l = 100, r = 20, t = 70, b = 70),
  paper_bgcolor = "rgb(248, 248, 255)",
  plot_bgcolor = "rgb(248, 248, 255)"
)
fig <- fig %>% add_annotations(
  xref = "paper", yref = "paper",
  x = -0.14, y = -0.15,
  text = paste(
    "OECD (2015), Household savings (indicator),",
    "Household net worth (indicator). doi: 10.1787/cfc6f499-en",
    "(Accessed on 05 June 2015)"
  ),
  font = list(family = "Arial", size = 10, color = "rgb(150,150,150)"),
  showarrow = FALSE
)

fig
