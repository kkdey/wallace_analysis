

##############  Phylogenetic fits many runs  (different cut offs)  ######################

sliced_data_cutoffs <- get(load("../output/sliced_data_cutoffs.rda"))
n <- dim(sliced_data_cutoffs[[1]]$outdat)[1]
cuts <- c(5, 10, 15, 20, 30, 40, 50, 60, 70, 75, 80)
topic_clust <- list()
for(k in 1:length(cuts)){
  num_groups_mat <- t(sliced_data_cutoffs[[k]]$num_groups %*% t(rep(1, n)))
  meth <- sliced_data_cutoffs[[k]]$outdat
  unmeth <- num_groups_mat - meth
  fits_list <- list()
  L_array <- c()
  for(m in 1:20){
    fits_list[[m]] <- meth_topics(meth, unmeth, K=9, tol = 1, use_squarem = FALSE)
    cat("We are at iteration", m, "\n")
    L_array <- c(L_array, fits_list[[m]]$L)
  }
  topic_clust[[k]] <- fits_list[[which.max(L_array)]]
}


save(topic_clust, file = "../output/phylogenetic_wallacea_methClust_9.rda")



phy <- get(load("../output/bird_lists_for_phylogeny_clusters_2_wallacea.rda"))
