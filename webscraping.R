# IMPORTING LIBRARIES
library(rvest)
library(dplyr)

# SCRAPPING WEBSITE
link <- "https://www.91mobiles.com/top-10-mobiles-in-india"

# ALLOWABILITY
#path = paths_allowed(link)

# HTML ELEMENTS FROM WEBSITE
web <- read_html(link)

# SEGREGATING NAME
name <- web %>% html_nodes(".name") %>% html_text()

# VIEWING NAME LIST
View(name)

RAM <- web %>% html_nodes(".specs_li:nth-child(1) label:nth-child(5)") %>% html_text()

# VIEWING YEAR LIST
View(RAM)

# SEGREGATING RATEING
price <- web %>% html_nodes(".price_float , .price_padding") %>% html_text()

# VIEWING RATING LIST
View(price)

mobiles <- data.frame(name , RAM ,price)

View(mobiles)

write.csv(mobiles,"my mobiles data.csv")