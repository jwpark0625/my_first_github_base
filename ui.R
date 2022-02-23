library(shiny)

# ./shiny.1/ui.R
ui <- fluidPage(
  selectInput("dataset", 
              label = "데이터셋", 
              choices = ls("package:datasets")), #여기에 따로 데이터셋만 넣으면 그것만 뜸
  verbatimTextOutput("summary"),
  tableOutput("table")
)