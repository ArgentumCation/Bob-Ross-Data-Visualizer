# add any libraries we need
library("ggplot2")
library("dplyr")
library("shiny")
library("stringr")


source("joint_freq_server.R")
source("plot2server.R")
source("plot3server.R")

raw_data <- read.csv("cleaned_data.csv")
features <- gsub('_', ' ', colnames(as.data.frame(guest_data)))
features <- features[4:(length(features) - 1)]

server <- function(input, output, session) {
  
  observe({
    if (input$select_type == "All") {
      updateCheckboxGroupInput(session=session, inputId="checkGroup2", choices=features, selected=features)
    }
    else if (input$select_type == "Manual Select") {
      updateCheckboxGroupInput(session=session, inputId="checkGroup2", choices=features, selected=NULL)
    }
  })
  
  # # Call Plotting Functions Here
  
  output$plot1 <- renderPlot(joint_freq(input$jointCheck))
  output$plot2 <- renderDataTable(getEpisode(input$checkGroup))
  output$plot3Guest <- renderPlot(getGuestCounts(input$checkGroup2))
  output$plot3Bob <- renderPlot(getBobCounts(input$checkGroup2))

}