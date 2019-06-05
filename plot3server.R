raw_data <-
  read.csv("cleaned_data.csv") # Original DataFrame from csv file

getGuestCounts <- function (features) {
  guest_data <- raw_data[raw_data$GUEST == 1,]
  filteredList = vector()
  
  for (val in features) {
    #Get data frames where all elements have 1 in the right column
    temp <- list(guest_data[guest_data[val] == 1, ])
    #add that to our list
    filteredList <- c(filteredList , temp)
  }
  count <- vector()
  for (val in filteredList) {
    count <- c(count, nrow(val))
  }
  #print(nrow(features))
  if (length(features) < 1) {
    plot <- "No data to display :("
  }
  else {
    names <- data.frame("Features" = features, "Counts" = count)
    plot <- ggplot(data = names, aes(x = Features, y = Counts, fill = Features)) + geom_bar(stat =
                                                                                              "identity", position = "dodge") + theme(legend.position="none") + ggtitle("Guest Work")
  }
  
  return(plot)
}

#features <- c("BEACH", "CLIFF", "CLOUDS")
#getCounts(features)

getBobCounts <- function (features) {
  guest_data <- raw_data[raw_data$GUEST == 0,]
  filteredList = vector()
  
  for (val in features) {
    #Get data frames where all elements have 1 in the right column
    temp <- list(guest_data[guest_data[val] == 1, ])
    #add that to our list
    filteredList <- c(filteredList , temp)
  }
  count <- vector()
  for (val in filteredList) {
    count <- c(count, nrow(val))
  }
  #print(nrow(features))
  if (length(features) < 1) {
    plot <- "No data to display :("
  }
  else {
    names <- data.frame("Features" = features, "Counts" = count)
    plot <- ggplot(data = names, aes(x = Features, y = Counts, fill = Features)) + geom_bar(stat =
                                                                                              "identity", position = "dodge") + theme(legend.position="none") + ggtitle("Bob's Work")
  }
  
  return(plot)
}