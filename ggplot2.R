library(ggplot2)
str(mpg)

p <- ggplot(data = mpg,mapping = aes(x=cty,y=hwy,colour=factor(year)))
p + geom_point()+stat_smooth()
