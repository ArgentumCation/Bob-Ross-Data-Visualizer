library("shiny")
library(shinythemes)

source("joint_freq_ui.R")
source("plot2ui.R")
source("plot3ui.R")

raw_data <- read.csv("cleaned_data.csv", stringsAsFactors = FALSE)

features <- gsub('_', ' ', colnames(as.data.frame(raw_data)))
features <- features[4:(length(features) - 1)]

ui <- navbarPage(theme=shinytheme('flatly'),
  'Ott Toomet\'s Fan Club Presents: Bob Ross',

    tabPanel("Background",
             img(src = "Bob_Ross_2.jpg")),
    plot1ui, #joint frequency plot
    plot2ui, #episode search with tag
    plot3ui #compare bob and guests
)
