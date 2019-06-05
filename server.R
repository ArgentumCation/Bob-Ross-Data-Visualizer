library("ggplot2")
library("dplyr")
library("shiny")
library ("stringr")

source("joint_freq_server.R")
source("plot2server.R")
source("plot3server.R")

server <- function(input, output) {
  # # Call Plotting Functions Here
  
  output$plot1 <- renderPlot(joint_freq(input$jointCheck))
  output$plot2 <- renderDataTable(getEpisode(input$checkGroup))
  output$plot3 <- renderPlot(getCounts(input$checkGroup2))

}