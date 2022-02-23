# install.packages("shiny")
library(shiny)



# ./shiny.1/ui.R
ui <- fluidPage(
  selectInput("data", 
              label = "데이터셋", 
              choices = ls("package:datasets")), #여기에 따로 데이터셋만 넣으면 그것만 뜸
  verbatimTextOutput("result"),
  tableOutput("table")
)

# ./shiny.1/server.R
server <- function(input, output) {
  output$result <- renderPrint({
    data <- get(input$data, "package:datasets")
    summary(data) #여기는 함수로서의 summary라서 바꾸면 안 됨
  })
  output$table <- renderTable({
    data <- get(input$data, "package:datasets")
    data
  })
}

shinyApp(ui = ui, server = server)