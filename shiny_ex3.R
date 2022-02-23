library(shiny)

ui <- pageWithSidebar(
  # 1. 헤더 패널
  headerPanel(h1("Hello, Shiny!")),
  # 2. 사이드바 패널
  sidebarPanel(
    sliderInput("count", 
                "Number of values: ",
                min = 1, 
                max = 10000,
                value = 5000)),
  # 3. 메인 패널
  mainPanel(
    plotOutput("distPlot"))
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    dist <- rnorm(input$count)
    hist(dist, col = "steelblue", breaks = 50)
  })
}

shinyApp(ui, server)