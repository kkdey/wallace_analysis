

##########  Wallace analysis different K - run 100 times   ##################

datalist <- get(load("../data/wallace_region_pres_ab_breeding_with_seabirds.rda"))
latlong <- datalist$loc
data <- datalist$dat

birds_pa_data_3 <- data

M <- 10
fits_list <- list()
L_array <- c()
for(m in 1:M){
  fits_list[[m]] <- fit <- meth_topics(birds_pa_data_3, 1 - birds_pa_data_3,
                                       K=4, tol = 10, use_squarem = FALSE)
  L_array <- c(L_array, fits_list[[m]]$L)
}



fit <- fits_list[[10]]

fit <- get(load("../output/methClust_3.rda"))
## -250106.5
## -248798.8
## -241266

png(filename=paste0("../out.png"),width = 1000, height = 800)
  map("worldHires",
      ylim=c(-18,20), xlim=c(90,160), # Re-defines the latitude and longitude range
      col = "gray", fill=TRUE, mar=c(0.1,0.1,0.1,0.1))
  lapply(1:dim(fit$omega)[1], function(r)
    add.pie(z=as.integer(100*fit$omega[r,]),
            x=latlong[r,1], y=latlong[r,2], labels=c("","",""),
            radius = 0.5,
            col=c(alpha(color[1],intensity),alpha(color[2],intensity),
                  alpha(color[3], intensity), alpha(color[4], intensity),
                  alpha(color[5], intensity), alpha(color[6], intensity),
                  alpha(color[7], intensity), alpha(color[8], intensity),
                  alpha(color[9], intensity), alpha(color[10], intensity),
                  alpha(color[11], intensity))));
dev.off()
