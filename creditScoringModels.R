# library(xlsx)
library(openxlsx)
df <- read.xlsx("C:\\Users\\Administrator\\Desktop\\各字段逾期20160221.xlsx", 2,detectDates = T)
# head(df,5)
# tail(df)
head(df["信用卡负债"],40)
subdf <- df[,c("类型","状态")]
tmpdf <- cbind(subdf,df[,"信用卡负债"])


creditCard <- df["信用卡负债"]
creditCard[creditCard==0]=0
creditCard[creditCard>0 & creditCard<=500]=1
creditCard[creditCard>500 & creditCard<=1000]=2
creditCard[creditCard>1000 & creditCard<=2000]=3
creditCard[creditCard>2000 & creditCard<=5000]=4
creditCard[creditCard>5000]=5


creditCard <- df["信用贷款负债"]
creditCard[creditCard==0]=0
creditCard[creditCard>0 & creditCard<=1500]=1
creditCard[creditCard>1500 & creditCard<=3000]=2
creditCard[creditCard>3000 & creditCard<=5000]=3
creditCard[creditCard>5000 & creditCard<=10000]=4
creditCard[creditCard>10000]=5

creditCard <- df["人行近3个月查询次数"]
creditCard[creditCard==0]=0
creditCard[creditCard>7]=8

creditCard <- df["人行房贷总金额"]
creditCard[creditCard==0]=0
creditCard[creditCard>0 & creditCard<=100000]=1
creditCard[creditCard>100000 & creditCard<=300000]=2
creditCard[creditCard>300000]=3


creditCard <- df["人行单张信用卡最大额度"]
creditCard[creditCard==0]=0
creditCard[creditCard>0 & creditCard<=5000]=1
creditCard[creditCard>5000 & creditCard<=10000]=2
creditCard[creditCard>10000 & creditCard<=20000]=3
creditCard[creditCard>20000 & creditCard<=50000]=4
creditCard[creditCard>50000]=5

creditCard <- df[,"负债率"]
creditCard[creditCard==0]=0
creditCard[creditCard>0.9 & creditCard<=10]=5
creditCard[creditCard>0 & creditCard<=1e-01]=1
creditCard[creditCard>1e-01 & creditCard<=3e-01]=2
creditCard[creditCard>0.3 & creditCard<=0.6]=3
creditCard[creditCard>0.6 & creditCard<=0.9]=4
creditCard[creditCard>10]=6




creditCard

if (file.exists("d:/creditCard.csv")) {
  file.remove("d:/creditCard.csv")
}
write.csv(creditCard,"d:/creditCard.csv")

aggregate(tmpdf,by = list(tmpdf$类型,tmpdf$状态),mean)
?mean

options(digits=5)

# 
# nrow(df) #行数
ncol(df);#列数
# dim(df)
# # library(xlsx)
# library(openxlsx)
# df <- read.xlsx("E:\\01 工作\\06 数据整理\\20160121在账客户匹配数据.xlsx", 1,detectDates = T)
# # head(df,5)
# # tail(df)
# nrow(df) #行数
# ncol(df);#列数
# dim(df)
# 
# names(df)
# attributes(df)
# str(df);summary(df)
# 
# subdf <- df[,c(1,2,3,7,18,33,35,49,50,63,64,95,81,107)]
# colnames(subdf)
# nrow(subdf)
# subdf <- cbind(subdf,as.Date("2015/12/1")-subdf[,"本期还款日"]<=0)
# head(subdf)
# 
# # write.csv(subdf,"d:/subdf.csv")
# plot(c(1:10),c(1:10))
# names(subdf)
# plot(subdf[,9],subdf[,13])
# subdf[,13] <- 
# subset(subdf,subdf[,13]>4e+6)
# nrow(subdf)
# 
# a <- c(1:10,NA,NA,NA,12:16)
# a[a>8]
# subset(a,a>8,na.rm=T)
# subset(a,a>8)
# subset(a,a>8,na.rm=F)

