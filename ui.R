library("shiny")
library(shinythemes)


source("plot2ui.R")
source("plot3ui.R")
ui <- navbarPage(theme=shinytheme('flatly'),
  'Ott Toomet\'s Fan Club Presents: Bob Ross',
  
  
  
    tabPanel("Background",
             img(src = "Bob_Ross_2.jpg")),
    tabPanel("Plot 1"),
    plot2ui,
    plot3ui

  
)
