library(tidyverse)

injury_df <- read.csv("injury_reserve_cleaned.csv")
injury_df$Notes <- gsub("[^A-Za-z\\s]", " ", injury_df$Notes)

injury_df$Notes <- strsplit(tolower(injury_df$Notes), " ")


note_list <- unlist(injury_df$Notes)

unique_injury_keywords <- unique(note_list)
#Give table of most common words
unique_freq <- as.data.frame(table(note_list))



injury_df$Notes %>% filter(. != "injury")


injury_df$Notes <- tolower(injury_df$Notes)
sum(str_detect(injury_df$Notes, 'knee'))



filter_by_injury <- function(df, col, injury){
  injury_count <- sum(str_detect(df[[col]], injury))
  print(paste("The injury Occured", injury_count, "times"))
  df[[str_detected]] <- str_detect(df[[col]], injury)
  filtered_df <- filter(df,str_detected == TRUE)  
}


filter_by_injury(injury_df, 'Notes', 'knee')
