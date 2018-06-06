

###############  Mammals data processing ###################

mamms <- read.csv("../data/mammals_without_bats.csv", row.names = 1)
locs_filter <- read.csv("../data/long_lats_to_drop.csv")
long_lat_fil <- paste0(locs_filter$V1, "_", locs_filter$V2)
long_lat_dat <- row.names(mamms)


long_lat_2 <- setdiff(long_lat_dat, long_lat_fil)

mamms2 <- mamms[match(long_lat_2, long_lat_dat), ]
save(mamms2, file = "../data/mammals_without_bats.rda")
