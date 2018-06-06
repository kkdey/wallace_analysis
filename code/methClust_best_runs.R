
#########  methClust best runs  ####################

datalist <- get(load("../data/wallace_region_pres_ab_breeding_with_seabirds.rda"))
latlong <- datalist$loc
data <- datalist$dat
if(nrow(latlong) != nrow(data)) stop("dimensions matching error")

for(k in 2:10){
  topics_clust <- get(load(paste0("../output/methClust_best_runs/methClust_",k, ".rda")))
  loglik <- unlist(lapply(topics_clust, function(x) return(x$L)))
  ids <- which.max(loglik)

  color = c("red", "cornflowerblue", "cyan", "brown4", "burlywood", "darkgoldenrod1",
            "azure4", "green","deepskyblue","yellow", "azure1")
  intensity <- 0.8
  png(filename=paste0("../docs/Wallacea_seabirds_best_runs/geostructure_birds_", k, ".png"),width = 1000, height = 800)
  map("worldHires",
      ylim=c(-18,20), xlim=c(90,160), # Re-defines the latitude and longitude range
      col = "gray", fill=TRUE, mar=c(0.1,0.1,0.1,0.1))
  lapply(1:dim(topics_clust[[ids]]$omega)[1], function(r)
    add.pie(z=as.integer(100*topics_clust[[ids]]$omega[r,]),
            x=latlong[r,1], y=latlong[r,2], labels=c("","",""),
            radius = 0.5,
            col=c(alpha(color[1],intensity),alpha(color[2],intensity),
                  alpha(color[3], intensity), alpha(color[4], intensity),
                  alpha(color[5], intensity), alpha(color[6], intensity),
                  alpha(color[7], intensity), alpha(color[8], intensity),
                  alpha(color[9], intensity), alpha(color[10], intensity),
                  alpha(color[11], intensity))));
  dev.off()

}


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
  fit <- get(load(paste0("../output/methClust_best_runs_birds/methClust_",m, ".rda")))
  loglik <- unlist(lapply(fit, function(x) return(x$L)))
  ids <- which.max(loglik)
  topics_clus_list[[m]] <- fit[[ids]]
}

save(topics_clus_list, file = "../output/methClust_wallacea_birds.rda")



