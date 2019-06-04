library('shiny')
library(stringr)
raw_data <- read.csv("cleaned_data.csv",stringsAsFactors = FALSE)

features <- str_to_title( gsub('_',' ',colnames(as.data.frame(raw_data))))
features <- features[3:length(features)]

ui <- fluidPage(
    titlePanel('Ott Toomet\'s Fan Club Presents Bob Ross'), tags$b(tags$i(tags$u('End my suffering'))),
    sidebarLayout(
      sidebarPanel(
        checkboxGroupInput("checkGroup", label = h3("Checkbox group"), choices = features, selected = 1)
      ),
    mainPanel('Main')
    )
  )
