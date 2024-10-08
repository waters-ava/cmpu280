# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)
library(polite)

# function: scrape_pac ---------------------------------------------------------

scrape_pac <- function(bow, path) {
  
  # agree session modification with the host
  session <- nod(bow, path=path)
  
  # read the page
  page <- scrape(session)
  
  # extract the table
  pac <-  page %>%
    # select node .DataTable (identified using the SelectorGadget)
    html_node(".DataTable-Partial") %>%
    # parse table at node td into a data frame
    #   table has a head and empty cells should be filled with NAs
    html_table(header = TRUE) %>%
    # convert to a tibble
    as_tibble()
  
  # rename variables
  pac <- pac %>%
    # rename columns
    rename(
      name = "PAC Name (Affiliate)" ,
      country_parent = "Country of Origin/Parent Company",
      total = "Total",
      dems = "Dems",
      repubs = "Repubs"
    )
  
  # fix name
  pac <- pac %>%
    # remove extraneous whitespaces from the name column
    mutate(name = str_squish(name))
  
  # add year
  pac <- pac %>%
    # extract last 4 characters of the URL and save as year
    mutate(year = str_sub(path, -4))
  
  # return data frame
  pac
  
}

# test function ----------------------------------------------------------------

bow <- bow("https://www.opensecrets.org")

url_2022 <- "https://www.opensecrets.org/political-action-committees-pacs/foreign-connected-pacs/2022"
pac_2022 <- scrape_pac(bow, url_2022)

url_2020 <- "https://www.opensecrets.org/political-action-committees-pacs/foreign-connected-pacs/2020"
pac_2020 <- scrape_pac(bow, url_2020)

url_2000 <- "https://www.opensecrets.org/political-action-committees-pacs/foreign-connected-pacs/2000"
pac_2000 <- scrape_pac(bow, url_2000)

# list of urls -----------------------------------------------------------------

# first part of url
root <- "https://www.opensecrets.org/political-action-committees-pacs/foreign-connected-pacs/"

# second part of url (election years as a sequence)
year <- seq(from = 2000, to = 2022, by = 2)

# construct urls by pasting first and second parts together
urls <- paste0(root, year)

# map the scrape_pac function over list of urls --------------------------------

pac_all <- map_df(urls, scrape_pac, bow = bow)

# write data -------------------------------------------------------------------

write_csv(pac_all, file = here::here("data/pac-all.csv"))
