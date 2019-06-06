raw_data <- read.csv("cleaned_data.csv", stringsAsFactors = FALSE)
guest_data <- raw_data[raw_data$GUEST == 1,]
features <- gsub('_', ' ', colnames(as.data.frame(guest_data)))
features <- features[4:(length(features) - 1)]

plot3ui <- tabPanel(
  "Ross: Guest vs. Solo",
  sidebarPanel(
    conditionalPanel(
      condition = "input.select_type != 'All'",
        checkboxGroupInput(
        "checkGroup2",
        label = h3("Features"),
        choices = features
      )
    ),
    radioButtons(
      inputId="select_type",
      label="Feature Selection Type:",
      choices=list("All", "Manual Select"),
      selected="All"),
    p(em("Select features to compare Bob and his guests"))
  ),
  mainPanel(
    shiny::plotOutput(outputId = "plot3Guest"),
    shiny::plotOutput(outputId = "plot3Bob"),
    shiny::hr(),
    "Episodes can be found at:",
    a(href = "https://www.youtube.com/channel/UCxcnsr1R5Ge_fbTu5ajt8DQ", 'Youtube'),
    a(href = "https://www.twitch.tv/bobross", "Twitch"),
    a(href = "https://www.netflix.com/", "Netflix")
  )
)

