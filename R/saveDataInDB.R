# Authors: Anne-Juul Welsink and Marrit Leenstra
# 24th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to save data from a local file to existing database
# Input: 
#    datapath: full path to the data
#    database: name of databaseconnection to add data to
#    tableName: name of table in database to add data to
# Output:
#    data saved in user-specified database. 

saveDataInDB <- function(dataPath, database, tableName){
  
  DFlist <- lapply(dataPath,read.csv2)

  for (i in 1:length(DFlist)){
    
    dbWriteTable(database, tableName[i], DFlist[[i]], append=TRUE)
  }
}

#https://doc-14-8g-docs.googleusercontent.com/docs/securesc/37bqdm91qlf446h600h8i92iq8or1rtu/pa3r1qi5ua99md2i6cabjk26gi0oe20v/1548345600000/04837304595108072515/04837304595108072515/