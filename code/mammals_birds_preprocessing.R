
###########  Mammals and Mammals + Bats + Birds  ######################

datalist <- get(load("../data/wallace_region_pres_ab_breeding_with_seabirds.rda"))
long_lat_birds  <- paste0(datalist$location[,1], "_", datalist$location[,2])

mamms <- read.csv("../data/mammals_without_bats.csv", row.names = 1)
long_lat_mammals <- row.names(mamms)

mamms2 <- read.csv("../data/mammals_with_bats.csv", row.names = 1)
long_lat_mammals_bats <- row.names(mamms2)

long_lat_common <- intersect(long_lat_birds,
                             intersect(long_lat_mammals, long_lat_mammals_bats))


birds_data <- datalist$data[match(long_lat_common, long_lat_birds), ]
mammals_data <- mamms[match(long_lat_common, long_lat_mammals), ]
mammals_bats_data <- mamms2[match(long_lat_common, long_lat_mammals_bats), ]

rownames(birds_data) <- long_lat_common
rownames(mammals_data) <- long_lat_common
rownames(mammals_bats_data) <- long_lat_common

save(birds_data, file = "../data/wallacea_birds.rda")
save(mammals_data, file = "../data/mammals_without_bats.rda")
save(mammals_bats_data, file = "../data/mammals_with_bats.rda")

