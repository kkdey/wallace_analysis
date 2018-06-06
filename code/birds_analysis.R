

############  Birds analysis  ########################

datalist <- get(load("../data/wallace_region_pres_ab_breeding_with_seabirds.rda"))
long_lat_dat  <- paste0(datalist$location[,1], "_", datalist$location[,2])
latlong <- cbind.data.frame(as.numeric(sapply(long_lat_dat,
                                              function(x) return(strsplit(x, "_")[[1]][1]))),
                            as.numeric(sapply(long_lat_dat,
                                              function(x) return(strsplit(x, "_")[[1]][2]))))
birds <- datalist$dat

locs_filter <- read.csv("../data/long_lats_to_drop.csv")
long_lat_fil <- paste0(locs_filter$V1, "_", locs_filter$V2)

long_lat_2 <- setdiff(long_lat_dat, long_lat_fil)

birds2 <- birds[match(long_lat_2, long_lat_dat), ]
rownames(birds2) <- long_lat_2
save(birds2, file = "../data/wallacea_birds.rda")



datalist <- get(load("../data/wallace_region_pres_ab_breeding_no_seabirds.rda"))
long_lat_dat  <- paste0(datalist$loc[,1], "_", datalist$loc[,2])
birds <- datalist$dat

locs_filter <- read.csv("../data/long_lats_to_drop.csv")
long_lat_fil <- paste0(locs_filter$V1, "_", locs_filter$V2)

long_lat_2 <- setdiff(long_lat_dat, long_lat_fil)

birds2 <- birds[match(long_lat_2, long_lat_dat), ]
rownames(birds2) <- long_lat_2
save(birds2, file = "../data/wallacea_birds_no_seabirds.rda")
