libs = c("shiny", "shinythemes")

for (i in libs) {
  if (!is.element(i, .packages(all.available = TRUE))) {
    install.packages(i)
  }
  library(i, character.only = TRUE)
}

source("plot2ui.R")

ui <- fluidPage(theme=shinytheme('cerulean'),
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
