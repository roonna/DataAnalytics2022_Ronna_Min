library(ggplot2)
library(dplyr)
View(diamonds)

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat),
                 binwidth = 0.5)
  # aes = aesthetic mapping
    # changes axis names, bin width, colors, etc


# diamonds %>% count(cut_width(carat, 0.5))

smaller <- diamonds %>% filter(carat < 3)
  # filter to only look at diamonds < 3 carats

# change bin size
ggplot(data = smaller, mapping = aes(x = carat)) + geom_histogram(binwidth = 0.1)
ggplot(data = smaller, mapping = aes(x = carat)) + geom_histogram(binwidth = 0.01)

# frequency chart
ggplot(data = smaller, mapping = aes(x = carat, color = cut)) + geom_freqpoly(binwidth = 0.1)


ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y),
                 binwidth = 0.5)

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y),
                 binwidth = 0.5) + coord_cartesian(ylim = c(0,
                                                            50))
# id unusual/outlier values
unusual <- diamonds %>%
filter(y < 3 | y > 20) %>%
arrange(y)
unusual


# remove outliers

# diamonds2 <- diamonds %>%
# filter(between(y, 3, 20))
  # filter just removes outliers outside the range
  # not ideal because not all outside range are outliers

diamonds2 <- diamonds %>% mutate(y = ifelse(y < 3 | y > 20, NA, y))
  # mutate changes values

ggplot(data = diamonds2, mapping = aes(x = x, y = y)) + geom_point(na.rm=TRUE)
  # without na.rm, it will print an error with amt of missing values

