library(methClust)
seed <- 3
mamms <- get(load("../data/wallacea_birds.rda"))
latlong_chars <- rownames(mamms)
latlong <- cbind.data.frame(as.numeric(sapply(latlong_chars,
                                              function(x) return(strsplit(x, "_")[[1]][1]))),
                            as.numeric(sapply(latlong_chars,
                                              function(x) return(strsplit(x, "_")[[1]][2]))))

M <- 30
fits_list <- list()
L_array <- c()
for(m in 1:M){
  counter = 0
  while(counter != 1){
    tmp <- try(meth_topics(mamms, 1 - mamms,
                           K=seed, tol = 10,
                           use_squarem = FALSE), TRUE)
    if(!inherits(tmp, "try-error")){
      counter = 1
    }else{
      counter = 0
    }
  }
  fits_list[[m]] <- tmp
  cat("We are at iteration", m, "\n")
}

fits_list_1 <- fits_list

save(fits_list, file = paste0("../output/methClust_best_runs_birds/methClust_", seed, ".rda"))
