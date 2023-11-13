library(rvest)

link <- "https://www.prosportstransactions.com/football/Search/SearchResults.php?Player=&Team=&BeginDate=&EndDate=&InjuriesChkBx=yes&submit=Search&start=100"


scrape_injury_webpage <- function(link){
  scrape_page <- read_html(link)
  table_selector <- "table.datatable.center"
  table_data <- html_table(html_nodes(scrape_page, table_selector), fill = TRUE)[[1]]
  table_data
}

scrape_injury_webpage(link)

base_link <- "https://www.prosportstransactions.com/football/Search/SearchResults.php?Player=&Team=&BeginDate=&EndDate=&InjuriesChkBx=yes&submit=Search&start="

table <- scrape_injury_webpage(paste(base_link, "0", sep = ""))
count = 0
for (i in 1:574){
  key_val <- i * 25
  scrape_link <- paste(base_link, key_val, sep = "")
  temp_table <- scrape_injury_webpage(scrape_link)
  table <- rbind(table, temp_table)
  print((i/574)*100)
}

write.csv(table, file = 'injury_reserve.csv')