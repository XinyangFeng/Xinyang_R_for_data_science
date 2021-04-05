install.packages('tidyverse')
library(tidyverse)
library(nycflights13)

# pick observations by their values filter()
# select all flights that set out at 1st Jan
filter(flights, month == 1, day == 1)
# save the result
jan1 <- filter(flights, month == 1, day == 1)
# print out the result and save it to a variable
(dec25 <- filter(flights, month == 12, day == 25))

# every flight that departed from Nov and Dec, select every row where x is one of the values in y
nov_dec <- filter(flights, month %in% c(11, 12))

# arrange() works similarly to filter() except that instead of selecting rows, it changes their order. 

select(flights, year, month, day)
select(flights, year: day)
select(flights, -(year: day))
?select()

flights_sml <- select(flights,
  year: day,
  ends_with('delay'),
  distance,
  air_time
)
mutate(flights_sml,
  gain = arr_delay - dep_delay,
  speed = distance / air_time * 60
)
mutate(flights_sml,
       gain = arr_delay - dep_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
)
transmute(flights_sml,
       gain = arr_delay - dep_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
)
transmute(flights,
          dep_time,
          hour = dep_time %/% 60,
          minute = dep_time %% 60
)

summarize(flights, delay = mean(dep_delay, na.rm = TRUE))

by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

by_dest <- group_by(flights, dest)
delay <- summarize(by_dest,
  count = n(),
  dist = mean(distance, na.rm = TRUE),
  delay = mean(arr_delay, na.rm = TRUE)
)
delay <- filter(delay, count > 20, dest != 'HNL')

ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(mapping = aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)


not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(mean = mean(dep_delay))

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(delay = mean(arr_delay))

ggplot(data = delays, mapping = aes(x = delay)) +
  geom_freqpoly(binwidth = 10)

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

ggplot(data = delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)

?geom_point()
vignette("ggplot2-specs")

delays %>%
  filter(n > 25) %>%
  ggplot(mapping = aes(x = n, y = delay)) +
    geom_point(alpha = 1/10)

?Lahman
batting
batting <- as_tibble(Lahman::Batting)

batters <- batting %>%
  group_by(playerID) %>%
  summarise(
    ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
  )

batters %>%
  filter(ab > 100) %>%
  ggplot(mapping = aes(x = ab, y = ba)) +
    geom_point() +
    geom_smooth(se = FALSE)

batters %>%
  arrange(desc(ba))

batters %>%
  filter(ab > 100) %>%
  arrange(desc(ba))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    # average delay:
    avg_delay1 = mean(arr_delay),
    # average positive delay:
    avg_delay2 = mean(arr_delay[arr_delay > 0])
  )

not_cancelled %>%
  group_by(dest) %>%
  summarize(distance_sd = sd(distance)) %>%
  arrange(desc(distance_sd))

not_cancelled %>%
  group_by(dest) %>%
  summarize(distance_sd = sd(distance)) %>%
  arrange(desc(distance_sd))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(
    first = min(dep_time),
    last = max(dep_time)
  )







































