# Afternoon  ggblot exercises
install.packages("ggplot2", dependencies=TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

#load libraries
library("ggblot2")
library("plyr")
library("ggthemes")
library("reshape")

head(iris)
head(iris[1:2, ])
df <- melt(iris, id.vars = "Species")
df[1:2, ]

myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
summary(myplot)

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point()

myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
myplot + geom_point()

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point(size = 3)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point(aes(shape = Species), size = 3)

# make a small random dataset of a larger dataset
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]

ggplot(data = d2, aes(x = carat, y = price)) + 
  geom_point()

ggplot(d2, aes(carat, price, color = color)) + 
  geom_point(aes(shape = color), size = 3)

ggplot(d2, aes(carat, price, color = color)) + 
  geom_point(size = 3)

library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()

?geom_boxplot

# to show summary of used parameters

myplot <- ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
summary(myplot)


ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() + 
  facet_grid(Species ~ .)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() + 
  facet_wrap( ~ Species)


df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) + 
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set1")


h <- ggplot(faithful, aes(x = waiting))
h + geom_histogram(binwith = 30, color = "black")


ggplot(iris, aes(Species, Sepal.Length)) + 
  geom_bar(stat = "identity")


ggplot(d2, aes(clarity, fill = cut)) + 
  geom_bar(position="dodge")

ggplot(faithful, aes(waiting)) + 
  geom_density(fill = "blue", alpha = 0.1)


ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(aes(shape = Species), size = 3) +
  geom_smooth(method = "lm") +
  facet_grid(. ~ Species)
