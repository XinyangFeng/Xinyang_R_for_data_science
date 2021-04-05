# Chapter 1. Data visualization with ggplot2

install.packages('tidyverse')
library(tidyverse)

# P4. Do cars with large engines use more fuel than cars with small engines?
ggplot2 :: mpg
?mpg
# displ: a car's engine size; engine displacement
# hwy: ? car'? fuel efficiency on the high way; highway miles per gallon
# create a ggplot, put displ on the x axis and hwy on the y axis. ggplot() create a coordinate system that you can 
# add layers to. geom_point() adds a layer of points to the plot.
ggplot(da?a = m?g) +
  geom_point(mapping = aes(x=displ, y=hwy))
?ggplot()
?geom_point()

# P6 Exercise
# 1. Run ggplot(data = mpg). What do you see?
ggplot(data = mpg)
# A. Nothing shows

# 2. How many rows are in mtcars? How many columns?
?mtcars
# A. A data frame?with ?2 observations on 11 (numeric) variables.

# 3. What does the drv variable describe? Read the help for ?mpg to find out
# A. the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd

# 4. Make a scatterplot of hwy versus cy?
ggpl?t(data = mpg) +
  geom_point(mapping = aes(x=cyl, y=hwy))

# P16
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x=displ, y=hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ? y = hwy, linetype = drv))

?geom_smooth
vignette("ggplot2-specs")

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, colour = drv))

ggplot(data = mpg) +
  ?eom_smooth(
    mapping = aes(x = displ, y = hwy, colour = drv),
    show.legend = FALSE
  )

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point() +
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mappi?g = aes(colour = class)) +
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(colour = class)) +
  geom_smooth(
    data = filter(mpg, class == 'subcompact'),
    se = FALSE
  )

# P22

ggplot(data = diamonds? +
  geom_bar(mapping = aes(x = cut))

demo <- tribble(
  ~a,     ~b,
  "bar_1",20,
  "bar_2",30,
  "bar_3",40
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = a, y = b), stat = 'identity')

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, ? = ..prop.., group = 1))

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )
?diamonds
?stat_bin

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, fill = cut?)

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
  geom_bar(alpha = 1/5, position = 'identity')
?geom_bar()

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
  geom_bar(alpha = 1/5)
# position is set default at 'stack'.?Position adjustment, either as a string, or the result of a call to 
# a position adjustment function.

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) +
  geom_bar(fill = NA, position = 'identity')

ggplot(data = diamonds, mapping = aes(? = cut, colour = clarity)) +
  geom_bar(fill = NA)

# this makes each set of stacked bars the same height 
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = 'fill'
  )

# this places overlapping objects direct?y beside one another
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = 'dodge'
  )

# position = 'jitter' add random noise around each dot such that they are less likely to overlap each other because
# no two ?oints are likely to receive the same amount of noise
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy),
    position = 'jitter'
  )
?position_dodge
?position_fill
?position_jitter
?position_stack

ggplot(data = mpg, mapping = aes(x =?class, y = hwy)) +
  geom_boxplot() +
  coord_flip()

bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    show.legend = FALSE,
    width = 1
  ) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)
bar + coord_flip(?
bar + coord_polar()







