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
