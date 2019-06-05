plot1ui <- tabPanel(
  "Plot 1",
  sidebarPanel(
    checkboxGroupInput(
      "jointCheck",
      label = h3("Features"),
      choices = features
    )
  ),
  mainPanel(
    plotOutput(outputId = "plot1"),
    hr(),
    "Episodes can be found at:",
    a(href = "https://www.youtube.com/channel/UCxcnsr1R5Ge_fbTu5ajt8DQ", 'Youtube'),
    a(href = "https://www.twitch.tv/bobross", "Twitch"),
    a(href = "https://www.netflix.com/", "Netflix")
  )
)