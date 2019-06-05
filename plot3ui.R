<<<<<<< HEAD
raw_data <- read.csv("cleaned_data.csv", stringsAsFactors = FALSE)

features <- gsub('_', ' ', colnames(as.data.frame(raw_data)))
features <- features[4:(length(features) - 1)]

plot3ui <- tabPanel(
  "Plot 3",
  sidebarPanel(
    checkboxGroupInput(
      "checkGroup2",
      label = h3("Features"),
      choices = features
    )
  ),
  mainPanel(
    #output is a table for debugging purposes
    shiny::dataTableOutput(outputId = "plot3"),
    shiny::hr(),
    "Episodes can be found at:",
    a(href = "https://www.youtube.com/channel/UCxcnsr1R5Ge_fbTu5ajt8DQ", 'Youtube'),
    a(href = "https://www.twitch.tv/bobross", "Twitch"),
    a(href = "https://www.netflix.com/", "Netflix")
  )
)
=======
raw_data <- read.csv("cleaned_data.csv", stringsAsFactors = FALSE)

features <- gsub('_', ' ', colnames(as.data.frame(raw_data)))
features <- features[4:(length(features) - 1)]

plot3ui <- tabPanel(
  "Plot 3",
  sidebarPanel(
    checkboxGroupInput(
      "checkGroup2",
      label = h3("Features"),
      choices = features
    )
  ),
  mainPanel(
    #output is a table for debugging purposes
    shiny::plotOutput(outputId = "plot3"),
    shiny::hr(),
    "Episodes can be found at:",
    a(href = "https://www.youtube.com/channel/UCxcnsr1R5Ge_fbTu5ajt8DQ", 'Youtube'),
    a(href = "https://www.twitch.tv/bobross", "Twitch"),
    a(href = "https://www.netflix.com/", "Netflix")
  )
)

>>>>>>> b755027ef969f4328d80185a60156125cfbab5ec
