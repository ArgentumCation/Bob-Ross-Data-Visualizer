library("ggplot2")
library("dplyr")
library("shiny")
library ("stringr")

source("plot2server.R")




server <- function(input, output) {
  # # Call Plotting Functions Here
  #   #output is a table for debugging purposes
  #   reactive(print(input$checkGroup))
  #   output$plot <- renderDataTable(
  #     #select(raw_data, input$checkGroup)
  #  )
  output$plot2 <- shiny::renderDataTable(getEpisode(input$checkGroup))
  output$plot3 <- shiny::renderPlot(getCounts(input$checkGroup2))
}