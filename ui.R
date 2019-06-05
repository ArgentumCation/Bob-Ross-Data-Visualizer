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
    plot3ui, #compare bob and guests
    tabPanel("Works Cited", 
             p("Bob Ross dataset:", 
              a("https://github.com/fivethirtyeight/data/blob/master/bob-ross/elements-by-episode.csv"), 
               p("collected and created by Walt Hickey, and accessed from FiveThirtyEight’s public Github repository."))),
            p("Bob Ross Picture:", 
              a("https://www.businessinsider.com.au/amazon-twitch-creative-bob-ross-joy-of-painting-marathon-2015-10"))
)
