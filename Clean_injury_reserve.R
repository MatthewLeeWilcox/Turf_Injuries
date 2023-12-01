library(tidyverse)
library(janitor)
library(stringr)
injury_df <- read.csv("injury_reserve.csv")

# Dropping NA from Relenquished. This is when player gets back from injury reserve.
injury_df <- injury_df[!injury_df$Relinquished == "",]

# Dropping Missing for Team, These players are Free Agents
#Test test 123
injury_df <- injury_df[!injury_df$Team == "",] %>%
  select(Date, Team, Acquired, Relinquished, Notes)

injury_df$estimated_length <- str_extract(string = injury_df$Notes,
                                         pattern = "(?<=\\().*(?=\\))")
injury_df$Notes <- gsub("\\([^\\)]+\\)", "", injury_df$Notes)
