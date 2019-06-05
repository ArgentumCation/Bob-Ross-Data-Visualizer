raw_data <- read.csv("cleaned_data.csv")

joint_freq <- function(features) {
  
  if(length(features) < 1) {
    return("No data to display :(")
  }
  
  subset <- raw_data
  for (elem in features) {
    subset <- filter(subset, UQ(as.name(elem)) == 1)
  }
  subset <- select(subset, -features)
  
  if(nrow(subset) < 1) {
    return("No data to display :(")
  }
  
  #empty dataframe with 1 column and number of remaining columns (excluding user-selected columns)
  freq_data <- data.frame(matrix(NA, nrow = ncol(select(subset, -c("X", "EPISODE", "TITLE", "GUEST"))), ncol = 1))
  
  freq_data <- freq_data %>%
    # assign the column names (except the first three) to "tags" column
    mutate(tags = colnames(select(subset, -c("X", "EPISODE", "TITLE", "GUEST")))) %>%
    mutate(freq = 0) %>%
    select(tags, freq)
  
  # counts the frequency of each features and store it into freq_data dataframe
  i <-  1
  for(elem in freq_data$tags) {
    count <- sum(subset %>%
                   select(!!elem))
    freq_data[i, 2] = count
    i <- i + 1
  }
  
  output <- ggplot(freq_data, aes(x=tags, y=freq, fill=tags)) +
    geom_bar(stat = "identity") +
    xlab("Features") +
    ylab("Number of Episodes") +
    coord_flip() +
    theme(panel.background = element_rect(fill = "white"),
          panel.grid.major.x = element_line(size = 0.5, linetype = "solid", colour = "grey95"),
          panel.grid.major.y = element_blank(),
          panel.grid.minor = element_blank()) +
    theme(legend.position="none")
  return(output)
}