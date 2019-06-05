joint_freq <- function(features) {
  
  subset <- raw_data
  
  # if features are selected, retrieve the data for selected features
  # if no features are selected, use the original data
  if(length(features) > 0) {
    for (elem in features) {
      subset <- filter(subset, UQ(as.name(elem)) == 1)
    }
    subset <- select(subset, -features)
  }
  
  #empty dataframe with 1 column and number of remaining columns (excluding user-selected columns)
  freq_data <- data.frame(matrix(NA, nrow = ncol(select(subset, -c("X", "EPISODE", "TITLE", "GUEST"))), ncol = 1))
  
  # if there are episodes with selected features, store the frequency of each features into freq column of freq_data
  # if there are no episodes with selected features, freq column of freq_data only stores 0
  freq_data <- freq_data %>%
    # assign the column names (except the first three) to "tags" column
    mutate(tags = colnames(select(subset, -c("X", "EPISODE", "TITLE", "GUEST")))) %>%
    mutate(freq = 0) %>%
    select(tags, freq)
  
  if(nrow(subset) > 0) {
    # counts the frequency of each features and store it into freq_data dataframe
    i <-  1
    for(elem in freq_data$tags) {
      count <- sum(select(subset, !!elem))
      freq_data[i, 2] = count
      i <- i + 1
    }
  }
  
  output <- ggplot(freq_data, aes(x=tags, y=freq, fill=tags)) +
    geom_bar(stat = "identity") +
    xlab("Features") +
    ylab("Number of Episodes") +
    scale_y_continuous(breaks = function(x) unique(floor(pretty(seq(0, (max(x) + 1) * 1.1))))) +
    coord_flip() +
    theme(panel.background = element_rect(fill = "white"),
          text = element_text(size=15),
          panel.grid.major.x = element_line(size = 0.5, linetype = "solid", colour = "grey95"),
          panel.grid.major.y = element_blank(),
          panel.grid.minor = element_blank()) +
    theme(legend.position="none")
  return(output)
}