
library(xlsx)
library(openxlsx)
df <- read.xlsx("E:\\01 工作\\06 数据整理\\20160121在账客户匹配数据.xlsx", 1,detectDates = T)
# head(df,5)
# tail(df)
nrow(df) 
ncol(df);
dim(df)

names(df)
attributes(df)
str(df);summary(df)

subdf <- df[,c(1,2,3,7,18,33,35,49,50,63,64,95,81,107)]
colnames(subdf)
nrow(subdf)
subdf <- cbind(subdf,as.Date("2015/12/1")-subdf[,"本期还款日"]<=0)
head(subdf)

