

model <- get(load("../output/methClust_wallacea_birds.rda"))
library(CountClust)
driving_species_ind <-  ExtractTopFeatures(model[[2]]$freq, method = "poisson", options = "min", top_features = 500)
species_names <- apply(driving_species_ind$indices, c(1,2), function(x) return (rownames(model[[2]]$freq)[x]))
t(species_names)

species_list_1 <- c(t(species_names)[1:150, 1], t(species_names)[1:150, 2])

model_sub <- model[[2]]$freq[species_list_1, ]

out <- t(apply(model[[2]]$freq, 1, function(x){
  if(sum(x) == 0){
    return(c(0.5, 0.5))
  }else{
    return(x/sum(x))
  }}))

tmp <- apply(out, 1, max)
out2 <- out[which(tmp < 0.9),]
id2 <- which(apply(out2, 1, min) < 0.5)
out3 <- out2[id2,]
tmp1 <- model[[2]]$freq[rownames(out3),]
save(tmp1, file = "../output/birds_species_not_separating.rda")

normed_model <- t(apply(model[[2]]$freq, 1, function(x) return(x/sum(x))))
species1 <- rownames(normed_model[which(normed_model[,1]==1),])
species2 <- rownames(normed_model[which(normed_model[,2]==1),])

list_species <- list()
for(m in 1:1000){
  list_species[[m]] <- list()
  list_species[[m]][[1]] <- sample(species1, 250, replace = FALSE)
  list_species[[m]][[2]] <- sample(species2, 250, replace = FALSE)
}

save(list_species, file = "../output/birds_lists_for_phylogeny_clusters_2_wallacea.rda")

