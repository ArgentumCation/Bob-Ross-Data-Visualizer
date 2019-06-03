library(stringr)

raw_data <- read.csv("elements-by-episode.csv",stringsAsFactors = FALSE) # Original DataFrame from csv file
features <- str_to_title( gsub('_',' ',colnames(as.data.frame(raw_data))))
print(features[3:length(features)])