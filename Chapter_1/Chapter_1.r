'''
Chapter 1. Data visualization with ggplot2
'''

install.packages('tidyverse')
library(tidyverse)

# P4. Do cars with large engines use more fuel than cars with small engines?
ggplot2 :: mpg
?mpg
# displ: a car's engine size; engine displacement
# hwy: a car's fuel efficiency on the high way; highway miles per gallon
# create a ggplot, put displ on the x axis and hwy on the y axis. ggplot() create a coordinate system that you can 
# add layers to. geom_point() adds a layer of points to the plot.
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy))
?ggplot()
?geom_point()

# P6 Exercise
# 1. Run ggplot(data = mpg). What do you see?
ggplot(data = mpg)
# A. Nothing shows

# 2. How many rows are in mtcars? How many columns?
?mtcars
# A. A data frame with 32 observations on 11 (numeric) variables.

# 3. What does the drv variable describe? Read the help for ?mpg to find out
# A. the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd

# 4. Make a scatterplot of hwy versus cyl
ggplot(data = mpg) +
  geom_point(mapping = aes(x=cyl, y=hwy))
