
#########  methClust best runs  ####################


topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_w_seabirds.rda")


topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs_mammals_and_birds/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_mammals_and_birds.rda")


topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs_mammals_bats/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_mammals_bats.rda")



topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs_birds/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_birds.rda")


topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs_birds_transpose/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_birds_transpose.rda")


topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs_birds/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_birds.rda")


topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs_mammals_bats_transpose/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_mammals_bats_transpose.rda")


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
  fit <- get(load(paste0("../output/methClust_best_runs_mammals_no_bats_transpose/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_mammals_no_bats_transpose.rda")


topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs_mammals_and_birds/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_mammals_and_birds.rda")

topics_clus_list <- list()
for(m in 2:10){
  fit <- get(load(paste0("../output/methClust_best_runs_mammals_and_birds_transpose/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_mammals_and_birds_transpose.rda")
