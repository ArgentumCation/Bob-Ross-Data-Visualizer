raw_data <-
  read.csv("cleaned_data.csv") # Original DataFrame from csv file

getCounts <- function (features) {
  filteredGuest = vector()
  guest_data <- (raw_data) %>% filter(GUEST != "0") 
  guest_data <- guest_data[, colSums(guest_data != 0) > 0]
  
  for (val in features) {
    #Get guest data fram where all elements have 1 in the right column
    guest_val <- list(guest_data[guest_data[val] == 1, ])
    #add that to our list
    filteredGuest <- c(filteredGuest , guest_val)
  }
  guest_count <- vector()
  for (val in filteredGuest) {
    guest_count <- c(guest_count, nrow(val))
  }

  
  #print(nrow(features))
  if (length(features) < 1) {
    plot <- "No data to display :("
  }
  else {
    names <- data.frame("Features" = features, "Guest" = guest_count)
    plot <- ggplot(data = names, aes(x = Features, y = Guest, fill = Features)) + geom_bar(stat =
                                                                                                         "identity", position = "dodge") + theme(legend.position="none")
  }
  
  return(plot)
}

getBobCounts <- function (bob_features) {
filteredBob = vector()
bob_data <- (raw_data) %>% filter(GUEST != "1")
bob_data <- bob_data[, colSums(bob_data != 0) > 0]

for (val in bob_features) {
  bob_val <- list(bob_data[bob_data[val] == 1, ])
  filteredBob <- c(filteredBob, bob_val)
}
bob_count <- vector()
for (val in filteredBob) {
  bob_count <- c(bob_count, nrow(val))
}


if (length(bob_features) < 1) {
  plot <- "No data to display :("
}
else {
  names <- data.frame("Features" = bob_features, "Bob Ross" = bob_count)
  bob_plot <- ggplot(data = names, aes(x = Features, y = "Bob Ross"), fill = Features) + geom_bar(stat =
                                                                                                       "identity", position = "dodge") + theme(legend.position="none")
}

return(bob_plot)
}

features <- c("BEACH", "CLIFF", "CLOUDS")
getCounts(features)

#raw_data <- read.csv("cleaned_data.csv",stringsAsFactors = FALSE)

#guest_vs_solo <- function(features) {
#guest_data <- (raw_data) %>% filter(GUEST != "0") %>%
#   mutate(add_row())
#
#
#
# bob_data <- (raw_data) %>% filter(GUEST != "1") %>% select(-X, -EPISODE, -TITLE)
#
# }
