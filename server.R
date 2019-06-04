# Main code for creating graphs
# Make sure "elements-by-episode.csv" is inside your working directory

# Loads the required libraries.
# Feel free to add more libraries to the "libs" list if necessary 
libs = c("ggplot2", "dplyr", "shiny")
for (i in libs){
  if( !is.element(i, .packages(all.available = TRUE)) ) {
    install.packages(i)
  }
  library(i,character.only = TRUE)
}

raw_data <- read.csv("elements-by-episode.csv") # Original DataFrame from csv file

server <- function(input, output){
# Call Plotting Functions Here
  
}
