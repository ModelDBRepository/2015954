This folder contains code associated with the paper Diekman, Thomas, and Wilson (2024) "COVID-19 and silent hypoxemia in 
a minimal closed-loop model of the respiratory rhythm generator" in *Biological Cybernetics*, DOI 
[10.1007/s00422-024-00989-w](https://doi.org/10.1007/s00422-024-00989-w)

`plot_Fig3A.m` reproduces panel A of Figure 3. Runtime: seconds

`plot_Fig3B.m` reads the files in the `data_for_Fig3B` folder and reproduces panel B of Figure 3. Runtime: seconds

`simulate_Fig5B_Hb_250.m` calls the `closedloopM.m` function containing the differential equations for the closed-loop 
model to simulate and plot the [Hb] = 250 curve from Figure 5B. Runtime: approximately 100 minutes
