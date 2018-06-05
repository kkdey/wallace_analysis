
library(methClust)
seed <- 10
mamms <- get(load("../data/mammals_without_bats.rda"))
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

save(fits_list, file = paste0("../output/methClust_best_runs_mammals_no_bats/methClust_", seed, ".rda"))




topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs_mammals_no_bats/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_mammals_no_bats.rda")


topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs_mammals_bats/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_mammals_bats.rda")
