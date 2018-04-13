
library(methClust)
seed <- 3
datalist <- get(load("../data/wallace_region_pres_ab_breeding_with_seabirds.rda"))
latlong <- datalist$loc
data <- datalist$dat

birds_pa_data_3 <- data

M <- 30
fits_list <- list()
L_array <- c()
for(m in 25:M){
  fits_list[[m]] <- meth_topics(birds_pa_data_3, 1 - birds_pa_data_3,
                                K=seed, tol = 10, NUM_INDICES_START = 600,
                                use_squarem = FALSE)
  cat("We are at iteration", m, "\n")
}

fits_list_1 <- fits_list

save(fits_list, file = paste0("../output/methClust_best_runs/methClust_", seed, ".rda"))


