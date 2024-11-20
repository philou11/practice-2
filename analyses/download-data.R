# Download PanTHERIA dataset ----


## Destination path ---- 

path <- here::here("data", "pantheria")


## Create destination directory ----

dir.create(path, showWarnings = FALSE, recursive = TRUE)


## File name ----

filename <- "PanTHERIA_1-0_WR05_Aug2008.txt"


## GitHub base URL ----

base_url <- "https://raw.githubusercontent.com/rdatatoolbox/datarepo/main/data/pantheria/"


## Build full URL ----

full_url <- paste0(base_url, filename)


## Build full path ----

dest_file <- file.path(path, filename)


## Download file ----

utils::download.file(url      = full_url,
                     destfile = dest_file,
                     mode     = "wb")


# Download WWF WildFinder dataset ----


## Destination path ---- 

path <- here::here("data", "wildfinder")


## Create destination directory ----

dir.create(path, showWarnings = FALSE, recursive = TRUE)


## File names ----

filenames <- c("wildfinder-ecoregions_list.csv",
               "wildfinder-ecoregions_species.csv",
               "wildfinder-mammals_list.csv")


## GitHub base URL ----

base_url <- "https://raw.githubusercontent.com/rdatatoolbox/datarepo/main/data/wildfinder/"


## Loop on files ----

for (filename in filenames) {
  
  ### Build full URL ----
  
  full_url <- paste0(base_url, filename)
  
  
  ### Build full path ----
  
  dest_file <- file.path(path, filename)
  
  
  ### Download file ----
  
  utils::download.file(url      = full_url,
                       destfile = dest_file,
                       mode     = "wb")
}
