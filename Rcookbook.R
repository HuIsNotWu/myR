print("hello,world");print(pi*2)

x <- 10
y <- 50
z <- c("three","blind","mice")

ls()
ls.str()

rm(list=ls())

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

lst <- list(c1=2,c2=c("a","b","c"),c3=1:5)
lst$c4 <- "hello world"
lst["c3"]
#列出相应目录下的文件名
list.files("E:/01 工作/01 信审/201601/20160129/")
system.file()

x <- 1:9
x <- seq(1,10,0.1)

x==3
which(x==3)
sum(x>3)
x>3
rev(x)
x[!is.na(x)]
weight = c(150, 135, 210, 140)
height = c(65, 61, 70, 65)
gender = c("Fe","Fe","M","Fe")
study <- data.frame(weight,height,gender)
names(study) <- c("wei","hei","gen")
study[["w"]]

unstack(data.frame(a =c("x","y","y","z","x"),b=c(1,2,3,4,5)),b~a)
