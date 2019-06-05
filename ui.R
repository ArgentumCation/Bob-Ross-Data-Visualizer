library('shiny')
library(stringr)

source("plot2ui.R")

ui <- fluidPage(
  titlePanel('Ott Toomet\'s Fan Club Presents Bob Ross'),
  tags$b(tags$i(tags$u('End my suffering'))),
  
  tabsetPanel(
    tabPanel("Background",
             img(src = "Bob_Ross_2.jpg")),
    tabPanel("Plot 1"),
    plot2ui,
    tabPanel("Plot 3")
  )
)
