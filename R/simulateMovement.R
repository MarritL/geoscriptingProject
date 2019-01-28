# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to simulate animal movement patterns
# Input: 
#    trajectories: List of class ltraj
#    
# Output:
#    

simulateMovement <- function(trajectories, h, r, proj4){
  
  DFtrajectories <- ld(trajectories) %>% group_by(id)
  firstRow <- DFtrajectories %>% filter(row_number()==1)
  
  # make list of variables for the different animals
  #animalName <- id(trajectories)
  #startdate <- summarise(DFtrajectories, startdate = min(date))[,'startdate'][[1]]
  #firstRow <- DFtrajectories %>% filter(row_number()==1) 
  #xcoords <- as.data.frame(firstRow[,1])[,'x']
  #ycoords <- as.data.frame(firstRow[,2])[,'y']
  #nSteps <- group_size(DFtrajectories)
  #timelag <- summarize(DFtrajectories[!is.na(DFtrajectories$dt),], timelag = mean((dt)))[,'timelag'][[1]] 
  
  # create empty list
  simulations <- list()
  
  for (animal in 1:length(trajectories)){
    animalName <- id(trajectories)[animal]
    print(animalName)
    startdate <- summarise(DFtrajectories, startdate = min(date))[,'startdate'][[1]][animal]
    xcoords <- as.data.frame(firstRow[,1])[,'x'][animal]
    ycoords <- as.data.frame(firstRow[,2])[,'y'][animal]
    nSteps <- group_size(DFtrajectories)[animal]
    timelag <- summarize(DFtrajectories[!is.na(DFtrajectories$dt),], timelag = mean((dt)))[,'timelag'][[1]][animal] 
    
    # create date sequence
    dateSeq <- seq(from = startdate, by= timelag, length.out = nSteps)
    
    simms <- simm.crw(dateSeq, h = h, r = r, x0 = c(xcoords, ycoords), id = animalName, proj4string = CRS(proj4))
    simulations <- list.append(simulations, simms)
  }
  
}