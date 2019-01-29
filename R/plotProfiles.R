# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to plot the altitude of the simulations and the animal
#
# Input: 
#   simulations: dataframe with extracted raster values per point location as output from extractRasterValues
#   trajectories: dataframe with extracted raster values per point location  
# Output:
#    

plotProfiles <- function(simulations, trajectories){
  
  simulations <- simulationElevations
  
  
  # make vector with different animals to loop over
  animalNames <- unique(simulations$animal)
  
  for (animalname in animalNames){
    # filter the simulations and trajetory based on animalname
    realAnimal <- trajectories %>% filter(animal == animalname)
    simulationsAnimal <- simulations %>% filter(animal == animalname)
    
    # plot real trajectory
    plot(realAnimal[,'rasterVal'], col = 'red', type = 'l')
    
    # make vector with number of simulations to loop over
    numberSimulations <- unique(simulationsAnimal$nSim)
    
    for (simulation in numberSimulations){
      # filter the simulations based on number of the simulation
      oneSimulation <- simulationsAnimal %>% filter(nSim == simulation)
      # add to plot
      lines(oneSimulation[,'rasterVal'], col = 'grey')
    }
    # add line of real trajectory in red on top
    lines(realAnimal[,'rasterVal'], col = 'red', type = 'l')
  }
}
