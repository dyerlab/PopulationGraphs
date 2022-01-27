library(tidyverse)

# Define the points
coords <- cbind( x = runif(100, 0, 100 ),
                 y = runif(100, 0, 100 ) )




# Constants

C <- 0.2 
width <- 100
height <- 100 
dimensions <- 2 
volume <- width * height 
N <- nrow( coords )
K <-  (volume / N)^ (1.0 / dimensions ) 


# Repulsive Forces
Distance <- numeric(0)
Force <- numeric(0)
for( i in seq(1,N) ) { 
  n1 <- coords[i,]
  for( j in seq(1:N) ) { 
    if( i > j ) { 
      n2 <- coords[j,]
      d <- sqrt( (n1[1] - n2[1])^2 + (n1[2] - n2[2])^2)
      fr <- (-C * K^2) / (d^2) 
      Distance <- c( Distance, d) 
      Force <- c( Force, fr )
    }
  }
}

data.frame( Distance, Force ) %>%
  ggplot( aes(Distance, Force) ) +
  geom_point() 

