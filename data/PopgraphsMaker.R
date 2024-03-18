# Creating an output for population graphs.

rm(list=ls())
library( d3r )
library( igraph )
library( gstudio )
library( popgraph )
library( jsonlite )
library( tidyverse )

load("df_snps.rda")
load("df_samples.rda")
source("humanCoordinates.R")
raw <- as.data.frame( df_samples )

edgeSets <- list() 

numLoci <- dim(df_snps)[1]
baseCtr <- 1
graphCtr <- 1
windowSize <- 40 
windowStep <- windowSize / 2 

groups <- raw$Population

data.frame( Population = as.character( levels( groups ) ) ) |>
  left_join(coordinates[ , c( "Population",
                              "Latitude",
                              "Longitude")],
            by="Population") |>
  mutate(NodeSize = 0.0) -> df_coords 

while( graphCtr < 11) { 
# while( baseCtr < (numLoci - windowSize) ) { 

  cat(graphCtr, baseCtr, (baseCtr + windowSize - 1), "\n")
  
  loci2Use <- df_snps$Name[ baseCtr:(baseCtr+(windowSize-1)) ]
  data <- to_mv( raw[,loci2Use ] )
  graph <- popgraph(data, groups)
  df_coords$NodeSize <- df_coords$NodeSize + vertex_attr(graph)$size[,1]
  
  # Set up the edges
  edgeSet <- list( loci = loci2Use )
  edgeKey <- paste("Edge Set",graphCtr )
    
  # Set up the edge sets
  edgeTargets <- as_edgelist(graph )
  weights <- edge_attr( graph )$weight 
  theEdges <-  list( id = edgeKey,
                     sources=edgeTargets[,1],
                     targets=edgeTargets[,2],
                     weights=weights,
                     loci=loci2Use )
  
  edgeSets[[edgeKey]] <- theEdges
  
  # Increment the counters
  baseCtr <- windowStep + baseCtr
  graphCtr <- graphCtr + 1 
} 


# Get the loci that were used and then save them as a 
df_snps |>
  head(n = (baseCtr + (windowStep-1))) |>
  select( Name, Location, Ho, p, Hs, Ht ) -> loci 


output <- list( nodes = list( Population = df_coords$Population,
                              Latitude = df_coords$Latitude,
                              Longitude = df_coords$Longitude, 
                              Size = df_coords$NodeSize / length(edgeSets)),
               loci = list( Name = loci$Name,
                            Location = loci$Location,
                            p = loci$p,
                            Ho = loci$Ho,
                            Hs = loci$Hs,
                            Ht = loci$Ht),
               edgesets = edgeSets )
                              

jsonlite::write_json( output, path="popgraphs.json", pretty = TRUE, auto_unbox=TRUE )


