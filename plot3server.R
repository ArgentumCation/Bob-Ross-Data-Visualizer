raw_data <-
  read.csv("cleaned_data.csv") # Original DataFrame from csv file

empty_plot <- ggplot(data.frame()) +
  geom_bar(stat = "identity", position = "dodge") + 
  theme(legend.position="none",
        panel.background = element_rect(fill = "white"),
        panel.grid.major.y = element_line(size = 0.5, linetype = "solid", colour = "grey95"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor = element_blank()) + 
  ggtitle("Guest Work") +
  ylim(0,100) +
  ylab("Percent of Apperance (%)") +
  xlab("Features")

getGuestCounts <- function (features) {
  if (length(features) < 1) {
    return(empty_plot + ggtitle("Guest Work"))
  }
  
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
  names <- data.frame("Features" = features, "Percent" = count / nrow(guest_data) * 100)
  plot <- ggplot(data = names, aes(x = Features, y = Percent, fill = Features)) + 
    geom_bar(stat = "identity") + 
    theme(legend.position="none",
          panel.background = element_rect(fill = "white"),
          panel.grid.major.y = element_line(size = 0.5, linetype = "solid", colour = "grey95"),
          panel.grid.major.x = element_blank(),
          panel.grid.minor = element_blank()) + 
    ggtitle("Guest Work") +
    ylim(0,100) +
    ylab("Percent of Apperance (%)") +
    xlab("Features")
  
  return(plot)
}

#features <- c("BEACH", "CLIFF", "CLOUDS")
#getCounts(features)

getBobCounts <- function (features) {
  if (length(features) < 1) {
    return(empty_plot + ggtitle("Bob's Work"))
  }
  
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

  names <- data.frame("Features" = features, "Percent" = count / nrow(guest_data) * 100)
  plot <- ggplot(data = names, aes(x = Features, y = Percent, fill = Features)) + 
    geom_bar(stat = "identity") + 
    theme(legend.position="none",
          panel.background = element_rect(fill = "white"),
          panel.grid.major.y = element_line(size = 0.5, linetype = "solid", colour = "grey95"),
          panel.grid.major.x = element_blank(),
          panel.grid.minor = element_blank()) + 
    ggtitle("Bob's Work") +
    ylim(0,100) +
    ylab("Percent of Apperance (%)") +
    xlab("Features")

  return(plot)
}
