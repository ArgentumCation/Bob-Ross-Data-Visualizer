# add any libraries we need
libs <- c("ggplot2", "dplyr", "shiny", "stringr")

# Loads libs, installs if not already installed
for (i in libs) {
  if (!is.element(i, .packages(all.available = TRUE))) {
    install.packages(i)
  }
  library(i, character.only = TRUE)
}

source("joint_freq_server.R")
source("plot2server.R")
source("plot3server.R")

raw_data <- read.csv("cleaned_data.csv")

server <- function(input, output) {
  # # Call Plotting Functions Here
  
  output$plot1 <- renderPlot(joint_freq(input$jointCheck))
  output$plot2 <- renderDataTable(getEpisode(input$checkGroup))
  output$plot3 <- renderPlot(getCounts(input$checkGroup2))

}