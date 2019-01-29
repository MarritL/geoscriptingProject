# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to plot the altitude of the simulations and the animal
#
# Input: 
#   simulations:
#    
# Output:
#    

plotProfiles <- function(simulations, trajectories){
  
  simulations <- simulationElevations
  animalNames <- unique(simulations$animal)
  
  plot.new()
  for (animalname in animalNames){
    print(animalname)
    X11()
    simulationsAnimal <- simulations %>% filter(animal == animalname)
    numberSimulations <- unique(simulationsAnimal$nsim)
    
    for (simulation in numberSimulations){
      print(simulation)
      oneSimulation <- simulationsAnimal %>% filter(nSim == numberSimulations)
      plot(oneSimulation[,'ID'], oneSimulation[,'DEM_be75'], type = 'l', col = 'grey', add = TRUE)
    }
  }
}
