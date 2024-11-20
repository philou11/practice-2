#' Download PanTHERIA dataset
#'
#' @description 
#' This function downloads the PanTHERIA dataset (Kate _et al._ 2009) hosted on
#' the GitHub repository <https://github.com/rdatatoolbox/datarepo/>. The file
#' won't be downloaded if already exists locally (except if `overwrite = TRUE`).
#' 
#' The file `PanTHERIA_1-0_WR05_Aug2008.txt` will be stored in 
#' `data/pantheria/`. This folder will be created if required.
#' 
#' @param overwrite a logical. If `TRUE`, the file will be downloaded again and
#'   the previous version will be erased. Default is `FALSE`.
#'
#' @return No return value.
#' 
#' @export
#' 
#' @references
#' Kate EJ, Bielby J, Cardillo M _et al._ (2009) PanTHERIA: A species-level 
#' database of life history, ecology, and geography of extant and recently 
#' extinct mammals. _Ecology_, 90, 2648.
#' DOI: <https://doi.org/10.1890/08-1494.1>.
#' 
#' @examples 
#' dl_pantheria_data()

dl_pantheria_data <- function(overwrite = FALSE) {
  
  # Define destination directory ---- 
  
  path <- here::here("data", "pantheria")
  
  
  # Create destination directory ----
  
  dir.create(path, showWarnings = FALSE, recursive = TRUE)
  
  
  # Name of file to download ----
  
  filename <- "PanTHERIA_1-0_WR05_Aug2008.txt"
  
  
  # Build GitHub base URL ----
  
  base_url <- paste0("https://raw.githubusercontent.com/rdatatoolbox/datarepo/",
                     "main/data/pantheria/")
  
  
  # Build local file path ----
    
  dest_file <- file.path(path, filename)
    
    
  # Check if the file already exists ----
    
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
  
  invisible(NULL) 
}
