library("shiny")
library(shinythemes)

source("joint_freq_ui.R")
source("plot2ui.R")
source("plot3ui.R")
ui <- navbarPage(theme=shinytheme('flatly'),
  'Ott Toomet\'s Fan Club Presents: Bob Ross',
  
  
  
    tabPanel("Background",
             img(src = "Bob_Ross_2.jpg")),
    plot1ui,
    plot2ui,
    plot3ui

  
)
