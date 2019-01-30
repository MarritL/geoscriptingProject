# Authors: Anne-Juul Welsink and Marrit Leenstra
# 24th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to download and unpack data from url to a user-specified data directory.
# Input: 
#    url: a url or vector of urls
#    destDirectory: directory where the data is saved and unzipped
#    filename: only required if unzip is FALSE
#    unzip: boolean if unzipping needed TRUE. Default is FALSE
# Output:
#    files saved in user-specified data directory. 

retrieveData <- function(url, destDirectory, filename = "filename", unzip = FALSE){
  
  # Create output folder if needed
  try(dir.create(destDirectory, showWarnings = FALSE))    
  
  # Get path of data directory and specify filename
  #dataDirectory <- list.files(pattern = destDirectory, full.names = TRUE)
  dataDirectory <- paste0("./", destDirectory, "/")
    
  # Download and unzip files
  download.file(url = url, destfile = paste0(dataDirectory, filename), mode="wb")
  
  if (unzip){
    unzip(paste0(dataDirectory, filename), exdir = destDirectory, overwrite = TRUE)  
    # Delete zip file
    file.remove(paste0(dataDirectory, filename))
  }
  

}