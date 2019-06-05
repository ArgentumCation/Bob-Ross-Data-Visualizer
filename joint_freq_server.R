raw_data <- read.csv("cleaned_data.csv")

joint_freq <- function(features) {
  
  subset <- raw_data
  for (elem in features) {
    subset <- filter(subset, UQ(as.name(elem)) == 1)
  }
  subset <- select(subset, -features)
  
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
  
  return(freq_data)
}
