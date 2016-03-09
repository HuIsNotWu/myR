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


rm(list=ls())
path = 'J:/lab/EX29 --在R语言中进行文件（夹）操作'
setwd(path)
cat("file A\n", file="A") #创建一个文件A，文件内容是'file A','\n'表示换行，这是一个很好的习惯
cat("file B\n", file="B")  #创建一个文件B
file.append("A", "B")  #将文件B的内容附到A内容的后面，注意没有空行
file.create("A")  #创建一个文件A, 注意会覆盖原来的文件
file.append("A", rep("B", 10)) #将文件B的内容复制10便，并先后附到文件A内容后
file.show("A")  #新开工作窗口显示文件A的内容
file.copy("A", "C") #复制文件A保存为C文件，同一个文件夹
dir.create("tmp")  #创建名为tmp的文件夹
file.copy(c("A", "B"), "tmp") #将文件夹拷贝到tmp文件夹中
list.files("tmp")  #查看文件夹tmp中的文件名
unlink("tmp", recursive=F) #如果文件夹tmp为空，删除文件夹tmp
unlink("tmp", recursive=TRUE) #删除文件夹tmp，如果其中有文件一并删除
file.remove("A", "B", "C")  #移除三个文件