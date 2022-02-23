library(shiny)

ui <- pageWithSidebar(
  headerPanel(h1("Miles Per Gallon")),
  sidebarPanel(
    selectInput("variable", 
                "선택해봐바",
                list("Cylinders" = "cyl",
                     "Transmission" = "am",
                     "Gears" = "gear")),
    checkboxInput("outliers",
                  "이상치도 보여주까?",
                  FALSE)),
  mainPanel(
    h3("formula: "),
    h3(textOutput("caption")),
    plotOutput("mpgPlot"))
)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))
server <- function(input, output) {
  formulaText <- reactive({
    paste("mpg~", input$variable)
  })
  output$caption <- renderText({
    formulaText()
  })
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data <- mpgData,
            outline = input$outliers,
            col = "lightyellow")
  })
}

shinyApp(ui, server)