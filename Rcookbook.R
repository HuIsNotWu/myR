print("hello,world");print(pi*2)

x <- 10
y <- 50
z <- c("three","blind","mice")

ls()
ls.str()

rm(list=ls())

c(1:10)

x <- c(1:100)
mean(x)
median(x)
sd(x)
var(x)

substitute(a)

.Last.value

search()
require(MASS)
lda(f ~ x + y)
detach(package:MASS)
head(pressure)
data()
data(Cars93,package = "MASS")
summary(Cars93)
Cars93
library()
chooseCRANmirror()
Sys.getenv("R_HOME")

scores <- data.frame()
scores <- edit(score)

cat("the answer is", 22 ,"\n",file = "d:/test.txt")

sink(file = "d:/test2.txt")
print("hello,world")
sink()

list.files()
list.dirs("d:")
as.Date("2015/1/5")
