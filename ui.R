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
             shiny::img(src = "Bob_Ross_2.jpg"),
             shiny::br(),
             shiny::br(),
             shiny::p(h3(strong("Bob Ross")), "was a painter who hosted step-by-step lessons via television show in the 80's and 90's; 
                tutorials with a different scene each time-- 403 in total. The data our group will be using was 
                originally collected to see what elements were painted in Bob Ross's 11-year television career 
                on his PBS show, \"The Joy of Painting\", and was collected through coding each episode of his series 
                for aspects and content of his paintings. Though Ross's TV show last aired live some 25 years ago, 
                and Ross himself passed away in 1995, his popularity in the last few years has soared."),
             shiny::br(),
             shiny::p("Though Ross is kept alive through his over 400 episodes available online -- the younger generation 
                will never be able to meet him. This project allows individual an avenue to dig deeper into the Bob Ross 
                series: providing ways for individuals to see, large-scale, what Ross loved to paint the most, screen episodes 
                for what they themselves would like to paint \"with\"Ross, and see how Ross's paintings differ when in the presence 
                of others (he seldom had episodes with guests)")),
    plot1ui, #joint frequency plot
    plot2ui, #episode search with tag
    plot3ui, #compare bob and guests
    tabPanel("Works Cited", 
             shiny::p("Bob Ross dataset:", 
                      shiny::a("https://github.com/fivethirtyeight/data/blob/master/bob-ross/elements-by-episode.csv"), 
                      shiny::p("collected and created by Walt Hickey, and accessed from FiveThirtyEight's public Github repository.")),
             shiny::br(),          
             shiny::p("Bob Ross Picture:", 
                      shiny::a("https://www.businessinsider.com.au/amazon-twitch-creative-bob-ross-joy-of-painting-marathon-2015-10")))
)
