

library(ape)
library(phytools)

phylo.counts <- function(counts, tree, collapse_at){
  root_node <- length(tree$tip.label) + 1
  root_age <- ape::branching.times(tree)[names(ape::branching.times(tree)) == root_node]
  trees_at_slice <- phytools::treeSlice(tree, root_age - collapse_at)
  counts_at_slice <- as.data.frame(counts)
  for( i in 1:length(trees_at_slice)){
    new.column <- as.data.frame(rowSums(counts_at_slice[,trees_at_slice[[i]]$tip.label]))
    colnames(new.column) <- trees_at_slice[[i]]$tip.label[1]
    drops <- trees_at_slice[[i]]$tip.label
    counts_at_slice <- counts_at_slice[,!(names(counts_at_slice) %in% drops)]
    counts_at_slice <- cbind(counts_at_slice, new.column)
  }
  counts_at_slice <- as.matrix(counts_at_slice)
  return(counts_at_slice)
}


mammals_tree <- ape::read.nexus("../data/mammals.tre")
tree_file <- mammals_tree$mammalST_MSW05_bestDates
mammals_data <- get(load("../data/mammals_with_bats.rda"))
colnames(mammals_data) <- gsub("[.]","_",colnames(mammals_data))
# keep_names <- colnames(mammals_data)[colnames(mammals_data) %in% mammals_tree$mammalST_MSW05_bestDates$tip.label]
# mammals_data_2 <- mammals_data[, keep_names]
tips_to_drop <- setdiff(tree_file$tip.label, colnames(mammals_data))
new_tree <- drop.tip(tree_file, tips_to_drop, trim.internal = TRUE, subtree = FALSE, root.edge = 0,
                     rooted = is.rooted(tree_file),
                     collapse.singles = TRUE, interactive = FALSE)
mammals_phylo <- phylo.counts(mammals_data_2, new_tree, collapse_at = 5)



counts <- mammals_data_2
tree <- tree_file
