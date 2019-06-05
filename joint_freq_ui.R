plot1ui <- tabPanel(
  "Joint Frequency of Features",
  sidebarPanel(
    checkboxGroupInput(
      "jointCheck",
      label = h3("Features"),
      choices = features
    ),
    p(em("Select features to see the joint frequency plot for selected features")),
    p(strong("Joint Frequency:"), "How many times a combination of multiple conditions happens together")
  ),
  mainPanel(
    plotOutput(outputId = "plot1", height = "600px"),
    hr(),
    "Episodes can be found at:",
    a(href = "https://www.youtube.com/channel/UCxcnsr1R5Ge_fbTu5ajt8DQ", 'Youtube'),
    a(href = "https://www.twitch.tv/bobross", "Twitch"),
    a(href = "https://www.netflix.com/", "Netflix")
  )
)