# library(xlsx)
library(openxlsx)
df <- read.xlsx("C:\\Users\\Administrator\\Desktop\\各字段逾期20160221.xlsx", 2,detectDates = T)
# head(df,5)
# tail(df)
head(df["信用卡负债"],40)
dfscores <- list()

tmp <- df$性别
tmp[tmp %in% "男"]=2
tmp[tmp %in% "女"]=10
dfscores$gender <- as.numeric(tmp)

tmp <- df$年龄
tmp[tmp <25 ]=1
tmp[tmp >=25 & tmp < 30]=4
tmp[tmp >=30 & tmp < 35]=7
tmp[tmp >=35 & tmp < 40]=9
tmp[tmp >=40 & tmp < 45]=10
tmp[tmp >=45 & tmp < 50]=8
tmp[tmp >=50 & tmp < 55]=5
tmp[tmp >=55]=3
dfscores$age <- as.numeric(tmp)

tmp <- df$婚姻
tmp[tmp !="已婚" | tmp !="未婚"]=1
tmp[tmp =="已婚"]=10
tmp[tmp =="未婚"]=2
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$婚姻 <- as.numeric(tmp)

tmp <- df$学历
tmp[tmp =="硕士及以上"]=10
tmp[tmp =="本科"]=9
tmp[tmp =="中专"]=6
tmp[tmp =="专科"]=3
tmp[tmp =="高中及以下"]=1
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$学历 <- as.numeric(tmp)

tmp <- df$岗位类型
tmp[tmp =="高层管理" | tmp =="中层管理"]=10
tmp[tmp =="企业法人"]=8
tmp[tmp =="基础管理" | tmp =="一般员工"]=6
tmp[tmp =="其他"]=1
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$岗位类型 <- as.numeric(tmp)

tmp <- df$户籍是否为居住地本地
tmp[tmp =="是"]=10
tmp[tmp =="否"]=2
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$户籍是否为居住地本地 <- as.numeric(tmp)

tmp <- t <- df$客户类型
tmp[t !="受薪" & t !="私营业主"]=2
tmp[t =="受薪"]=6
tmp[t =="私营业主"]=10
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$客户类型 <- as.numeric(tmp)

tmp <- t <- df$客户类型
tmp[t =="私营业主"]=10
tmp[t !="私营业主"]=3
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$是否私营业主 <- as.numeric(tmp)

tmp <- df$房产情况
tmp[tmp =="有"]=6
tmp[tmp =="无"]=4
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$房产情况 <- as.numeric(tmp)

tmp <- df$按揭情况
tmp[tmp =="有"]=10
tmp[tmp =="无"]=2
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$按揭情况 <- as.numeric(tmp)

tmp <- df$车辆情况
tmp[tmp =="有"]=10
tmp[tmp =="无"]=1
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$车辆情况 <- as.numeric(tmp)

tmp <- df$发薪方式
tmp[tmp =="网银"]=10
tmp[tmp =="网银+现金"]=6
tmp[tmp =="现金"]=2
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$发薪方式 <- as.numeric(tmp)

tmp <- df$核实收入
tmp[tmp <5000]=2
tmp[tmp >=5000 & tmp < 10000]=4
tmp[tmp >=10000 & tmp < 15000]=6
tmp[tmp >=15000 & tmp < 20000]=8
tmp[tmp >=20000 & tmp < 30000]=10
tmp[tmp >=30000 & tmp < 50000]=9
tmp[tmp >=50000 & tmp < 100000]=8
tmp[tmp >=100000]=8
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$核实收入 <- as.numeric(tmp)


t <- tmp <- df$信用贷款负债
tmp[tmp==0]=10
tmp[tmp>0 & tmp<=1500]=9
tmp[tmp>1500 & tmp<=3000]=7
tmp[tmp>3000 & tmp<=5000]=6
tmp[tmp>5000 & tmp<=10000]=4
tmp[tmp>10000]=2
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$信用贷款负债 <- as.numeric(tmp)

tmp <- t <- df$人行近3个月查询次数
tmp[t<=2]=10
tmp[t>2 & t<=5]=5
tmp[t>5 & t<=8]=2
tmp[t>8]=0
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$人行近3个月查询次数 <- tmp

tmp <- t <- df$人行房贷总金额
tmp[t==0]=4
tmp[t>0 & t<=100000]=6
tmp[t>100000 & t<=300000]=8
tmp[t>300000]=10
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$人行房贷总金额 <- as.numeric(tmp)

tmp <- t <-  df$人行贷款次数
tmp[t==0]=4
tmp[t==1]=8
tmp[t==2]=10
tmp[t>2 & t <=4]=9
tmp[t>4 & t <=10]=7
tmp[t>10 ]=5
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$人行贷款次数 <- as.numeric(tmp)

tmp <- t <-  df$外部负债率
tmp[t==0]=10
tmp[t>0 & t <=0.1]=8
tmp[t>0.1 & t <=0.3]=6
tmp[t>0.3 & t <=0.6]=5
tmp[t>0.6 & t <=0.9]=7
tmp[t>0.9 & t <=1.5]=5
tmp[t>1.5]=1
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$外部负债率 <- as.numeric(tmp)

tmp <- t <-  df$人行正常状态信用卡张数
tmp[t==0]=0
tmp[t==1]=9
tmp[t==2]=8
tmp[t %in% c(3,4)]=10
tmp[t>=5]=2
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$人行正常状态信用卡张数 <- as.numeric(tmp)

tmp <- df$信用卡负债
tmp[tmp==0]=1
tmp[tmp>0 & tmp<=500]=3
tmp[tmp>500 & tmp<=1000]=6
tmp[tmp>1000 & tmp<=2000]=10
tmp[tmp>2000 & tmp<=5000]=9
tmp[tmp>5000 & tmp<=8000]=5
tmp[tmp>8000]=2
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$信用卡负债 <- as.numeric(tmp)

tmp <- t <- df$人行单张信用卡最大额度
tmp[t==0]=3
tmp[t>0 & t<5000]=5
tmp[t>=5000 & t<10000]=6
tmp[t>=10000 & t<20000]=8
tmp[t>=20000 & t<50000]=10
tmp[t>=50000 & t<100000]=8
tmp[t>=100000]=10
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$人行单张信用卡最大额度 <- as.numeric(tmp)

tmp <- t <- df$人行单张信用卡最大额度*0.65
tmp[t==0]=0
tmp[t>0 & t<5000]=2
tmp[t>=5000 & t<10000]=6
tmp[t>=10000 & t<20000]=8
tmp[t>=20000 & t<50000]=9
tmp[t>=50000]=10
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$信用卡平均额度 <- as.numeric(tmp)

tmp <- t <-  df$贷记卡最高使用率
tmp[t==0]=9
tmp[t>0 & t <=0.25]=10
tmp[t>0.25 & t <=0.5]=8
tmp[t>0.5 & t <=0.8]=7
tmp[t>0.8 & t <=1]=6
tmp[t>1]=1
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$贷记卡最高使用率 <- as.numeric(tmp)

tmp <- t <-  df$最早一张贷记卡开户距离申请月月数
tmp[t==0]=2
tmp[t>0 & t <=3]=0
tmp[t>3 & t <=6]=2
tmp[t>6 & t <=12]=4
tmp[t>12 & t <=24]=6
tmp[t>24 & t <=36]=4
tmp[t>36 & t <=60]=8
tmp[t>60]=10
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$最早一张贷记卡开户距离申请月月数 <- as.numeric(tmp)

tmp <- t <- df$人行近12个月的逾期次数
tmp[t==0]=10
tmp[t==1]=7
tmp[t %in% c(2,3)]=5
tmp[t>=4]=1
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$人行近12个月的逾期次数 <- as.numeric(tmp)

tmp <- t <-  df$人行近3个月的逾期次数
tmp[t==0]=10
tmp[t==1]=6
tmp[t==2]=3
tmp[t>=3]=1
m <- round(mean(as.numeric(tmp),na.rm = T))
tmp[is.na(tmp)]=ifelse(m<5,m,5)
dfscores$人行近3个月的逾期次数 <- as.numeric(tmp)

# tmp <- t <- df$人行近3个月的逾期次数/df$人行近12个月的逾期次数
# tmp[t>0 & t<0.5]=1
# tmp[t>=0.5 & t<1]=0
# tmp[t>=1]=-2
# m <- round(mean(as.numeric(tmp),na.rm = T))
# tmp[is.na(t) | is.nan(t)] =ifelse(m<5,m,5)
# dfscores$近3逾占12比 <- as.numeric(tmp)

tmp <- t <- as.numeric(gsub("*个月","",df$车辆使用时间))
tmp[t>0 & t<=3] =2
tmp[t>3 & t<=6] =5
tmp[t>6 & t<=12] =10
tmp[t>12 & t<=24] =8
tmp[t>24] =7
m <- round(mean(as.numeric(tmp),na.rm = T))
# tmp[is.na(tmp)]=ifelse(m<5,m,5)
tmp[is.na(t)]=7
dfscores$车辆购买时长 <- as.numeric(tmp)

tmp <- t <-  df$负债率
# tmp[is.na(t)]=mean(as.numeric(tmp),na.rm = T)
tmp[]=5
dfscores$车龄 <- as.numeric(tmp)

names(dfscores)
# head(as.data.frame(dfscores))

attach(dfscores)
score <-
  25*dfscores$gender+
  10*age+
  20*婚姻+
  15*学历+
  15*岗位类型+
  40*户籍是否为居住地本地+
  20*客户类型+
  5*是否私营业主+
  
  10*房产情况+
  15*按揭情况+
  35*车辆情况+
  65*发薪方式+
  25*核实收入+
  
  55*信用贷款负债+
  90*人行近3个月查询次数+
  20*人行房贷总金额+
  25*人行贷款次数+
  40*外部负债率+
  30*人行正常状态信用卡张数+
  55*信用卡负债+
  50*人行单张信用卡最大额度+
  30*信用卡平均额度+
  60*贷记卡最高使用率+
  25*最早一张贷记卡开户距离申请月月数+
  
  60*人行近12个月的逾期次数+
  30*人行近3个月的逾期次数
  
#   50*车辆购买时长+
#   50*车龄

detach(dfscores)
dfscores$score <- score

out <- list()
out$state <- df$状态
out$score <- score
out <- as.data.frame(out)
out <- out[order(score),]
out$row <- 1:nrow(out)
out$deli <- cumsum(out$state=="M1+")
out$prow <- out$row/max(out$row)
out$pdeli <- out$deli/max(out$deli)
out <- out[ceiling(max(out$row)*c(0.1,0.3,0.5,0.7,0.9,1)),]
out

fname <- "d:/scores.csv"

if(file.exists(fname)) {
  file.remove(fname)
}
write.csv(as.data.frame(dfscores),fname)

# aggregate(tmpdf,by = list(tmpdf$类型,tmpdf$状态),mean)
# ?mean

options(digits=5)

# 
# nrow(df) #行数
# ncol(df);#列数
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

# # write.csv(subdf,"d:/subdf.csv")
# plot(c(1:10),c(1:10))
# names(subdf)
# plot(subdf[,9],subdf[,13])
# subdf[,13] <- 
# subset(subdf,subdf[,13]>4e+6)
# nrow(subdf)

# a <- c(1:10,NA,NA,NA,12:16)
# a[a>8]
# subset(a,a>8,na.rm=T)
# subset(a,a>8)
# subset(a,a>8,na.rm=F)