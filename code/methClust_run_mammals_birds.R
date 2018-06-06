library(methClust)
seed <- 2
mamms <- get(load("../data/wallacea_mammals_birds.rda"))
latlong_chars <- rownames(mamms)
latlong <- cbind.data.frame(as.numeric(sapply(latlong_chars,
                                              function(x) return(strsplit(x, "_")[[1]][1]))),
                            as.numeric(sapply(latlong_chars,
                                              function(x) return(strsplit(x, "_")[[1]][2]))))

M <- 30
fits_list <- list()
L_array <- c()
for(m in 1:M){
  fits_list[[m]] <- meth_topics(mamms, 1 - mamms,
                                K=seed, tol = 10,
                                use_squarem = FALSE)
  cat("We are at iteration", m, "\n")
}

fits_list_1 <- fits_list

save(fits_list, file = paste0("../output/methClust_best_runs_mammals_and_birds/methClust_", seed, ".rda"))
