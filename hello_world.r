# my first R program

print("hello world")
print("openheimer is very good movie")
print("smax")

library(dplyr)
mtcar %>% 
  select (1:5) %>%
  filter(mpg>30)
