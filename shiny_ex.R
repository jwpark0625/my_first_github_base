# install.packages("shiny")
library(shiny)



# ./shiny.1/ui.R
ui <- fluidPage(
  selectInput("dataset", 
              label = "데이터셋", 
              choices = ls("package:datasets")), #여기에 따로 데이터셋만 넣으면 그것만 뜸
  verbatimTextOutput("summary"),
  tableOutput("table")
)

# ./shiny.1/server.R
server <- function(input, output) {
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}

shinyApp(ui = ui, server = server)