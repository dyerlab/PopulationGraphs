# Creating an output for population graphs.

rm(list=ls())
library( d3r )
library( igraph )
library( stringr )
library( gstudio )
library( popgraph )
library( jsonlite )
library( tidyverse )

load("df_snps.rda")
load("df_samples.rda")
source("humanCoordinates.R")
raw <- as.data.frame( df_samples )

numLoci <- dim(df_snps)[1]
baseCtr <- 1
graphCtr <- 1
windowSize <- 40 
windowStep <- windowSize / 2 

totalTopologies <- ceiling( numLoci / windowStep )
totalTopologies <- 1000
numDigits <- floor( log10(totalTopologies) ) + 1 
groups <- raw$Population

data.frame( Population = as.character( levels( groups ) ) ) |>
  left_join(coordinates[ , c( "Population",
                              "Latitude",
                              "Longitude")],
            by="Population") |>
  mutate(NodeSize = 0.0) -> df_coords 


# Make the output Directory to put stuff into
outDir <- paste("popgraphs",totalTopologies,sep="_")
if( !dir.exists(outDir) ) { 
  dir.create(outDir)
}



while( graphCtr <= totalTopologies  ) { 
# while( baseCtr < (numLoci - windowSize) ) { 

  cat(graphCtr, baseCtr, (baseCtr + windowSize - 1), "\n")
  
  loci2Use <- df_snps$Name[ baseCtr:(baseCtr+(windowSize-1)) ]
  data <- to_mv( raw[,loci2Use ] )
  graph <- popgraph(data, groups)
  df_coords$NodeSize <- df_coords$NodeSize + vertex_attr(graph)$size[,1]
  
  # Set up the edges
  edgeSet <- list( loci = loci2Use )
  edgeKey <- paste("EdgeSet",str_pad(graphCtr, numDigits, pad = "0" ), sep="")
    
  # Set up the edge sets
  edgeTargets <- as_edgelist(graph )
  weights <- edge_attr( graph )$weight 
  theEdges <-  list( id = edgeKey,
                     sources=edgeTargets[,1],
                     targets=edgeTargets[,2],
                     weights=weights,
                     loci=loci2Use )
  
  jsonlite::write_json( theEdges, 
                        path=paste(outDir,"/",edgeKey,".json", sep=""), 
                        pretty=TRUE, 
                        auto_unbox=TRUE )
  
  
  # Increment the counters
  baseCtr <- windowStep + baseCtr
  graphCtr <- graphCtr + 1 
} 


# Get the loci that were used and then save them as a CSV file
df_snps |>
  head(n = (baseCtr + (windowStep-1))) |>
  select( Name, Location, Ho, p, Hs, Ht ) |>
  write_csv( file=paste(outDir,"/loci.csv",sep="") )

# Save CSV Output for Coordinates
write_csv( df_coords, file=paste( outDir,"/nodes.csv",sep="") )

zip(paste(outDir,".zip", sep=""), files = outDir ) 




