library(ggplot2)

raw_data <- read.csv("cleaned_data.csv")

features <- c("BEACH", "CLIFF", "CLOUDS")

getEpisode <- function (features) {
  filteredList = vector()
  
  for (val in features) {
    temp <- list(raw_data[raw_data[val] == 1, ])
    filteredList <- c(filteredList , temp)
  }
  
  result <- filteredList %>% Reduce(function(d1, d2)
    merge(d1, d2), .)
  for (col in 4:ncol(result)){
    for(row in 1:nrow(result)){
      result[row,col] = if (result[row,col] == 1) "Yes" else "No"
    } 
  }
  return (result)
  
}

View(getEpisode(features))