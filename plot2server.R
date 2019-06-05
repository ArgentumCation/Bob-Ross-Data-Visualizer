raw_data <-
  read.csv("cleaned_data.csv") # Original DataFrame from csv file

getEpisode <- function (features) {
  filteredList = vector()
  
  for (val in features) {
    #Get data frames where all elements have 1 in the right column
    temp <- list(raw_data[raw_data[val] == "Yes",])
    #add that to our list
    filteredList <- c(filteredList , temp)
  }
  # merge the list of data frames into one (Set AND)
  result <-
    filteredList %>% Reduce(function(d1, d2)
      merge(d1, d2), .)
  # Get Relevant Columns
  result <- result[c(2, 3)]
  # Make Pretty
  result$TITLE <- str_to_title(result$TITLE)
  return (result)
  
  
}