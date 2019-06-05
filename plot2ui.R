raw_data <- read.csv("cleaned_data.csv", stringsAsFactors = FALSE)

features <- gsub('_', ' ', colnames(as.data.frame(raw_data)))
features <- features[4:(length(features) - 1)]

plot2ui <- tabPanel(
  "Plot 2",
  sidebarPanel(
    checkboxGroupInput(
      "checkGroup",
      label = h3("Features"),
      choices = features
    )
  ),
  mainPanel(
    #output is a table for debugging purposes
    shiny::dataTableOutput(outputId = "plot2"),
    shiny::hr(),
    "Episodes can be found at:",
    a(href = "https://www.youtube.com/channel/UCxcnsr1R5Ge_fbTu5ajt8DQ", 'Youtube'),
    a(href = "https://www.twitch.tv/bobross", "Twitch"),
    a(href = "https://www.netflix.com/", "Netflix")
  )
)