library(shiny)
library(ggplot2)
library(gapminder)

# fluid에 2개의 param 부여
ui <- fluidPage(
  plotOutput("plot",
             click = "plot_click"),
  tableOutput("data")
)
