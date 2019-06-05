# Main code for creating graphs
# Make sure "elements-by-episode.csv" is inside your working directory

# Loads the required libraries.
# Feel free to add more libraries to the "libs" list if necessary 
libs = c("ggplot2", "dplyr", "shiny","stringr")
for (i in libs){
  if( !is.element(i, .packages(all.available = TRUE)) ) {
    install.packages(i)
  }
  library(i,character.only = TRUE)
}

raw_data <- read.csv("cleaned_data.csv") # Original DataFrame from csv file

for (col in 4:ncol(raw_data)){
  for(row in 1:nrow(raw_data)){
    raw_data[row,col] = if (raw_data[row,col] == 1) "Yes" else "No"
  } 
}



getEpisode <- function (features) {
  filteredList = vector()
  
  for (val in features) {
    #Get data frames where all elements have 1 in the right column
    temp <- list(raw_data[raw_data[val] == "Yes", ])
    #add that to our list
    filteredList <- c(filteredList , temp)
  }
  # merge the list of data frames into one (Set AND)
  result <- filteredList %>% Reduce(function(d1, d2) merge(d1, d2), .)
  # Get Relevant Columns  
  result <- result[c(2,3)]
  # Make Pretty
  result$TITLE <- str_to_title(result$TITLE)
  return (result)
  
  
}



server <- function(input, output){
# # Call Plotting Functions Here
#   #output is a table for debugging purposes
#   reactive(print(input$checkGroup))
#   output$plot <- renderDataTable(
#     #select(raw_data, input$checkGroup)
#  )
  output$plot2 <- renderDataTable(getEpisode(input$checkGroup))
}