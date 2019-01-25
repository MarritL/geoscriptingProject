# Authors: Anne-Juul Welsink and Marrit Leenstra
# 24th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to save data from a local file to existing database
# Input: 
#    datapath: full path to the data
#    database: name of databaseconnection to add data to
#    tableName: name of table in database to add data to
#    columnNames: 
# Output:
#    data saved in user-specified database. 

saveDataInDB <- function(dataPath, database, tableName, columnNames){
  
  # read data into dataframe(s)
  DFlist <- lapply(dataPath,read.csv2)

  # save every dataframe in the database
  for (i in 1:length(DFlist)){
    dataFrame <- DFlist[[i]]
    names(dataFrame) <- columnNames
    dbWriteTable(database, tableName, dataFrame, append=TRUE)
  }
}
