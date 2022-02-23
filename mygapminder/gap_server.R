library(shiny)
library(ggplot2)
library(gapminder)

#res :해상도
server <- function(input, output, session) {
  output$plot <- renderPlot({
    ggplot(gapminder, aes(gdpPercap, lifeExp, 
                          color = continent)) +
      geom_point(alpha = 0.5) +
      scale_x_log10(labels = scales::dollar) +
      theme_classic()
  }, res = 96)
  output$data <- renderTable({
    req(input$plot_click)
    nearPoints(gapminder, input$plot_click)
  })
}