library('shiny')

ui <- fluidPage(titlePanel('Ott Toomet\'s Fan Club Presents Bob Ross'), tags$b(tags$i(tags$u('End my suffering'))),
                sidebarLayout(sidebarPanel(
                  'Sidebar'
                ),mainPanel(
                  'Main')))
