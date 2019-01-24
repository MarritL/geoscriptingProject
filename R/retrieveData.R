# Authors: Anne-Juul Welsink and Marrit Leenstra
# 24th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to download and unpack data from url to a user-specified data directory.
# Input: 
#    url: a url or vector of urls
#    destDirectory: directory where the data is saved and unzipped
# Output:
#    files saved in user-specified data directory. 

retrieveData <- function(url, destDirectory){
  
  # Create output folder if needed
  try(dir.create(destDirectory, showWarnings = FALSE))    
  
  filename <- "movementData"
  
  # Get path of data directory and specify filename
  dataDirectory <- list.files(pattern = destDirectory, full.names = TRUE)
    
  # Download and unzip files
  download.file(url = url, destfile = paste0(dataDirectory, filename), mode="wb")
  unzip(paste0(dataDirectory, filename), exdir = destDirectory, overwrite = TRUE)  
  
  # Delete zip file
  file.remove(paste0(dataDirectory, filename))
  
}