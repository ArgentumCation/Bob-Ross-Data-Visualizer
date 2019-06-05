# Main code for creating graphs
# Make sure "elements-by-episode.csv" is inside your working directory

# Loads the required libraries.
# Feel free to add more libraries to the "libs" list if necessary
source("plot2server.R")

libs = c("ggplot2", "dplyr", "shiny", "stringr")

for (i in libs) {
  if (!is.element(i, .packages(all.available = TRUE))) {
    install.packages(i)
  }
  library(i, character.only = TRUE)
}




server <- function(input, output) {
  # # Call Plotting Functions Here
  #   #output is a table for debugging purposes
  #   reactive(print(input$checkGroup))
  #   output$plot <- renderDataTable(
  #     #select(raw_data, input$checkGroup)
  #  )
  output$plot2 <- renderDataTable(getEpisode(input$checkGroup))
}