
library(xlsx)
library(openxlsx)
df <- read.xlsx("E:\\01 工作\\06 数据整理\\20160121在账客户匹配数据.xlsx", 1,detectDates = T)
# head(df,5)
# tail(df)
nrow(df) #行数
ncol(df);#列数
dim(df)

names(df)
attributes(df)
str(df);summary(df)

subdf <- df[,c(1,2,3,7,18,33,35,49,50,63,64,95,81,107)]
colnames(subdf)
nrow(subdf)
subdf <- cbind(subdf,as.Date("2015/12/1")-subdf[,"本期还款日"]<=0)
head(subdf)

# write.csv(subdf,"d:/subdf.csv")
plot(c(1:10),c(1:10))
names(subdf)
plot(subdf[,9],subdf[,13])
subdf[,13] <- 
subset(subdf,subdf[,13]>4e+6)
nrow(subdf)

a <- c(1:10,NA,NA,NA,12:16)
a[a>8]
subset(a,a>8,na.rm=T)
subset(a,a>8)
subset(a,a>8,na.rm=F)

