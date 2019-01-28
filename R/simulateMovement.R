# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to simulate animal movement patterns. 
# It is to be used in combinatation with the adehabitatLT package. Simulated correlated random walks start
# at same location and time as animals in ltraj object, trajectories have equal lenght to animal trajectories.
#
# Input: 
#    trajectories: list of class ltraj
#    nSimulations: number of simulations per animal
#    scaling: the caling paramter for the movement length. DEFAULT: 1
#    concentration: the concentration parameter for wrapped normal distribution of turning angles. DEFAULT: 0
#    proj4: proj4string
#    
# Output:
#    list with simulations of class ltraj per animal 

simulateMovement <- function(trajectories, nSimulations, scaling = 1, concentration = 0, proj4){
  
  # cast trajectories to dataframe and extract first row for every animal
  DFtrajectories <- ld(trajectories) %>% group_by(id)
  firstRow <- DFtrajectories %>% filter(row_number()==1)
  
  # create empty list
  simulations <- list()
  
  for (animal in 1:length(trajectories)){
    
    # get the parameters for the simulation per animal
    animalName <- id(trajectories)[animal]
    startdate <- summarise(DFtrajectories, startdate = min(date))[,'startdate'][[1]][animal]
    xcoords <- as.data.frame(firstRow[,1])[,'x'][animal]
    ycoords <- as.data.frame(firstRow[,2])[,'y'][animal]
    nSteps <- group_size(DFtrajectories)[animal]
    timelag <- summarize(DFtrajectories[!is.na(DFtrajectories$dt),], timelag = mean((dt)))[,'timelag'][[1]][animal] 
    
    # create date sequence
    dateSeq <- seq(from = startdate, by= timelag, length.out = nSteps)
    
    # create n simulations per animal and add to list
    simms = list()
    for (simulation in 1:nSimulations){
      simms <- list.append(simms, simm.crw(dateSeq, h = scaling, r = concentration, x0 = c(xcoords, ycoords), id = animalName, proj4string = CRS(proj4)))
    }
    simulations <- list.append(simulations, simms)
  }
  
  return(simulations)
}