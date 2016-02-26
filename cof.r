
# library(openxlsx)
# df <- read.xlsx("C:\\Users\\Administrator\\Desktop\\testdata.xlsx", 2,detectDates = T)
# df <- srcdf
dfscores <- list()

tmp <- df$性别
tmp[tmp %in% "男"]=2
tmp[tmp %in% "女"]=10
dfscores$gender <- as.numeric(tmp)

tmp <- df$年龄
tmp[tmp <25 ]=2
tmp[tmp >=25 & tmp < 30]=7
tmp[tmp >=30 & tmp < 35]=7
tmp[tmp >=35 & tmp < 40]=9
tmp[tmp >=40 & tmp < 45]=10
tmp[tmp >=45 & tmp < 50]=7
tmp[tmp >=50 & tmp < 55]=4
tmp[tmp >=55]=5
dfscores$age <- as.numeric(tmp)

tmp <- df$婚姻
tmp[tmp !="已婚" | tmp !="未婚"]=2
tmp[tmp =="已婚"]=10
tmp[tmp =="未婚"]=3
tmp[is.na(tmp)]=5
dfscores$婚姻 <- as.numeric(tmp)

tmp <- df$学历
tmp[tmp =="硕士及以上"]=10
tmp[tmp =="本科"]=9
tmp[tmp =="中专"]=6
tmp[tmp =="专科"]=4
tmp[tmp =="高中及以下"]=2
tmp[is.na(tmp)]=5
dfscores$学历 <- as.numeric(tmp)

tmp <- df$岗位类型
tmp[tmp =="高层管理" | tmp =="中层管理"]=10
tmp[tmp =="企业法人"]=8
tmp[tmp =="基础管理" | tmp =="一般员工"]=6
tmp[tmp =="其他"]=2
tmp[is.na(tmp)]=5
dfscores$岗位类型 <- as.numeric(tmp)

tmp <- df$户籍是否为居住地本地
tmp[tmp =="是"]=10
tmp[tmp =="否"]=2
tmp[is.na(tmp)]=5
dfscores$户籍是否为居住地本地 <- as.numeric(tmp)

tmp <- df$客户类型
tmp[tmp !="受薪" & tmp !="私营业主"]=2
tmp[tmp =="受薪"]=4
tmp[tmp =="私营业主"]=10
tmp[is.na(tmp)]=5
dfscores$客户类型 <- as.numeric(tmp)

tmp <- t <- df$客户类型
tmp[t =="私营业主"]=10
tmp[t !="私营业主"]=2
tmp[is.na(t)]=5
dfscores$是否私营业主 <- as.numeric(tmp)

tmp <- df$房产情况
tmp[tmp =="有"]=6
tmp[tmp =="无"]=4
tmp[is.na(tmp)]=5
dfscores$房产情况 <- as.numeric(tmp)

tmp <- df$按揭情况
tmp[tmp =="有"]=10
tmp[tmp =="无"]=2
tmp[is.na(tmp)]=5
dfscores$按揭情况 <- as.numeric(tmp)

tmp <- df$车辆情况
tmp[tmp =="有"]=10
tmp[tmp =="无"]=2
tmp[is.na(tmp)]=5
dfscores$车辆情况 <- as.numeric(tmp)

tmp <- df$发薪方式
tmp[tmp =="网银"]=10
tmp[tmp =="网银+现金"]=6
tmp[tmp =="现金"]=2
tmp[is.na(tmp)]=5
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
tmp[is.na(tmp)]=5
dfscores$核实收入 <- as.numeric(tmp)

tmp <- df$信用卡负债
tmp[tmp==0]=2
tmp[tmp>0 & tmp<=500]=4
tmp[tmp>500 & tmp<=1000]=10
tmp[tmp>1000 & tmp<=2000]=9
tmp[tmp>2000 & tmp<=5000]=6
tmp[tmp>5000]=2
tmp[is.na(tmp)]=5
dfscores$信用卡负债 <- as.numeric(tmp)

t <- tmp <- df$信用贷款负债
tmp[tmp==0]=10
tmp[tmp>0 & tmp<=1500]=8
tmp[tmp>1500 & tmp<=3000]=7
tmp[tmp>3000 & tmp<=5000]=6
tmp[tmp>5000 & tmp<=10000]=4
tmp[tmp>10000]=2
tmp[is.na(tmp)]=5
dfscores$信用贷款负债 <- as.numeric(tmp)

tmp <- t <- df$人行近3个月查询次数
tmp[tmp>=8]=8
tmp <- 10-tmp
# tmp[tmp==0]=10
# tmp[tmp==1]=9
# tmp[tmp==2]=8
# tmp[tmp==3]=6
# tmp[tmp==4]=5
# tmp[tmp==5]=4
# tmp[tmp==6]=3
# tmp[tmp>=7]=2
tmp[is.na(tmp)]=5
dfscores$人行近3个月查询次数 <- tmp

tmp <- t <- df$人行房贷总金额
tmp[t==0]=10
tmp[t>0 & t<=100000]=8
tmp[t>100000 & t<=300000]=6
tmp[t>300000]=4
tmp[is.na(tmp)]=5
dfscores$人行房贷总金额 <- as.numeric(tmp)

tmp <- t <- df$人行单张信用卡最大额度
tmp[t==0]=3
tmp[t>0 & t<=5000]=5
tmp[t>5000 & t<=10000]=6
tmp[t>10000 & t<=20000]=8
tmp[t>20000 & t<=50000]=10
tmp[t>50000]=8
tmp[is.na(tmp)]=5
dfscores$人行单张信用卡最大额度 <- as.numeric(tmp)

tmp <- t <-  df$人行正常状态信用卡张数
tmp[t==0]=2
tmp[t==1]=9
tmp[t==2]=8
tmp[t %in% c(3,4)]=10
tmp[t>5]=4
tmp[is.na(t)]=5
dfscores$人行正常状态信用卡张数 <- as.numeric(tmp)

tmp <- t <- df$人行近12个月的逾期次数
tmp[t==0]=10
tmp[t==1]=8
tmp[t %in% c(2,3)]=6
tmp[t>=4]=2
tmp[is.na(tmp)]=5
dfscores$人行近12个月的逾期次数 <- as.numeric(tmp)

tmp <- t <-  df$人行近3个月的逾期次数
tmp[t==0]=10
tmp[t==1]=7
tmp[t==2]=5
tmp[t>=3]=3
tmp[is.na(t)]=5
dfscores$人行近3个月的逾期次数 <- as.numeric(tmp)

tmp <- t <- df$人行近3个月的逾期次数/df$人行近12个月的逾期次数
tmp[t>0 & t<0.5]=1
tmp[t>=0.5 & t<1]=0
tmp[t>=1]=-2
tmp[is.na(t) | is.nan(t)] =0
dfscores$近3逾占12比 <- as.numeric(tmp)

tmp <- t <-  df$贷记卡最高使用率
tmp[t==0]=9
tmp[t>0 & t <=0.25]=10
tmp[t>0.25 & t <=0.5]=8
tmp[t>0.5 & t <=0.8]=7
tmp[t>0.8 & t <=1]=6
tmp[t>1]=1
tmp[is.na(t)]=5
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
tmp[is.na(t)]=5
dfscores$最早一张贷记卡开户距离申请月月数 <- as.numeric(tmp)

tmp <- t <-  df$人行贷款次数
tmp[t==0]=6
tmp[t==1]=10
tmp[t==2]=10
tmp[t>2 & t <=4]=8
tmp[t>4 & t <=10]=9
tmp[t>10 ]=7
tmp[is.na(t)]=5
dfscores$人行贷款次数 <- as.numeric(tmp)

tmp <- t <-  df$负债率
tmp[t==0]=10
tmp[t>0 & t <=0.1]=9
tmp[t>0.1 & t <=0.3]=8
tmp[t>0.3 & t <=0.6]=8
tmp[t>0.6 & t <=0.9]=7
tmp[t>0.9 & t <=2]=5
tmp[t>2]=1
tmp[is.na(t)]=5
dfscores$负债率 <- as.numeric(tmp)

names(dfscores)
# head(as.data.frame(dfscores))

attach(dfscores)
score <- 30*gender+
  5*age+
  20*婚姻+
  15*学历+
  15*岗位类型+
  40*户籍是否为居住地本地+
  20*客户类型+
  5*是否私营业主+
  
  15*房产情况+
  20*按揭情况+
  60*车辆情况+
  115*发薪方式+
  40*核实收入+
  
  55*信用卡负债+
  55*信用贷款负债+
  100*人行近3个月查询次数+
  20*人行房贷总金额+
  60*人行单张信用卡最大额度+
  30*人行正常状态信用卡张数+
  80*人行近12个月的逾期次数+
  30*人行近3个月的逾期次数+
  70*贷记卡最高使用率+
  20*最早一张贷记卡开户距离申请月月数+
  30*人行贷款次数+
  50*负债率+
  
  10*近3逾占12比 
  
detach(dfscores)
dfscores$score <- score

fname <- "d:/scores.csv"

if(file.exists(fname)) {
  file.remove(fname)
}
write.csv(as.data.frame(dfscores),fname)

# library(openxlsx)
# srccdf <- read.xlsx("C:\\Users\\Administrator\\Desktop\\各字段逾期20160221.xlsx", 2,detectDates = T)
# 
# sampledf <- srccdf[srccdf$状态=="M1+",]
# nrow(sampledf)
# sampledf <- rbind(sampledf,srccdf[srccdf$状态=="M1",])
# nrow(sampledf)
# sampledf <- rbind(sampledf,srccdf[as.numeric( sample(row.names(srccdf[srccdf$状态=="正常",]),1000)),])
# nrow(sampledf)
# write.csv(sampledf,"d:/sampledata.csv")


# 11*age+
#   11*婚姻+
#   71*学历+
#   72*岗位类型+
#   41*dfscores$户籍是否为居住地本地+
#   83*客户类型+
#   
#   44*房产情况+
#   18*按揭情况+
#   6*车辆情况+
#   
#   6*发薪方式+
#   11*核实收入+
#   
#   41*信用卡负债+
#   77*信用贷款负债+
#   101*人行近3个月查询次数+
#   21*人行房贷总金额+
#   21*人行单张信用卡最大额度+
#   5*人行正常状态信用卡张数+
#   15*人行近12个月的逾期次数+
#   6*人行近3个月的逾期次数+
#   31*最早一张贷记卡开户距离申请月月数+
#   2*人行贷款次数+
#   19*负债率