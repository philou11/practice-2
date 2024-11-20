#' Download WWF WildFinder dataset
#'
#' @description 
#' This function downloads the WWF WildFinder dataset (World Wildlife Fund 2006)
#' hosted on the GitHub repository <https://github.com/rdatatoolbox/datarepo/>. 
#' The files won't be downloaded if already exist locally (except if 
#' `overwrite = TRUE`).
#' 
#' Three `.csv` files will be saved in `data/wildfinder/`:
#'   - `wildfinder-ecoregions_list.csv` 
#'   - `wildfinder-ecoregions_species.csv`
#'   - `wildfinder-mammals_list.csv`
#'   
#' The folder `data/wildfinder/` will be created if required.
#' 
#' @param overwrite a `logical`. If `TRUE`, the files will be downloaded again 
#'   and the previous versions will be erased. Default is `FALSE`.
#'
#' @return No return value.
#' 
#' @export
#' 
#' @references
#' World Wildlife Fund (2006) WildFinder: Online database of species 
#' distributions. Version Jan-06. 
#' URL: <https://www.worldwildlife.org/pages/wildfinder-database>.
#' 
#' @examples 
#' dl_wildfinder_data()

dl_wildfinder_data <- function(overwrite = FALSE) {
  
  # Define destination directory ---- 
  
  path <- here::here("data", "wildfinder")
  
  
  # Create destination directory ----
  
  dir.create(path, showWarnings = FALSE, recursive = TRUE)
  
  
  # Name of files to download ----
  
  filenames <- c("wildfinder-ecoregions_list.csv", 
                 "wildfinder-ecoregions_species.csv", 
                 "wildfinder-mammals_list.csv")
  
  
  # Build GitHub base URL ----
  
  base_url <- paste0("https://raw.githubusercontent.com/rdatatoolbox/datarepo/",
                     "main/data/wildfinder/")
  
  
  # Loop on files ----
  
  for (filename in filenames) {
    
    
    ## Build local file path ----
    
    dest_file <- file.path(path, filename)
    
    
    ## Check if the file already exists ----
    
    if (file.exists(dest_file) && !overwrite) {
      
      
      ## Inform the user ----
      
      message("The filename '", filename, "' already exists. Use ", 
              "'overwrite = TRUE' to download it again and erase the previous ",
              "version.")


    } else {
      
      
      ## Build GitHub full URL ----
      
      full_url <- paste0(base_url, filename)
      
      
      ## Download file ----
      
      utils::download.file(url      = full_url,
                           destfile = dest_file,
                           mode     = "wb")
    }
  }
  
  invisible(NULL) 
}
