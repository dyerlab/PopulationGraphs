library( tidyverse )
N <- 100

radius <- 5

x <- numeric( 0 ) 
y <- numeric( 0 ) 


for( i in 1:N) { 

  x <- c( x, cos( i * 2 * pi /  N - pi / 2) * radius ) 
  y <- c( y, sin( i * 2 * pi / N - pi / 2 ) * radius ) 
  
}

data.frame( x, y ) %>%
  ggplot( aes(x,y) ) + geom_point() 
