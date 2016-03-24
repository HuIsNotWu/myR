require(RODBC)
library(openxlsx)
library(reshape)
dt <- read.xlsx("C:\\Users\\Administrator\\Desktop\\各字段逾期20160221_0317.xlsx", 1,detectDates = T)


# table(dt$房产情况)
# table(dt$发薪方式,dt$房产情况)
# ncol(dt)
# table(dt$状态,dt[,4])
# names(dt)[4]
# for(i in 4:ncol(dt)) {
#   write.table(table(names(dt)[i],"d:/out.csv",append=T)
#   write.table(table(dt[,i],dt$状态),"d:/out.csv",append=T)
# }

dtscores <- list()

t <- tmp <- dt$核实收入
tmp[t <5000]="<5k"
tmp[t >=5000 & t < 10000]="5-10k"
tmp[t >=10000 & t < 15000]="10-15k"
tmp[t >=15000 & t < 20000]="15-20k"
tmp[t >=20000 & t < 30000]="20-30k"
tmp[t >=30000 & t < 50000]="30-50k"
tmp[t >=50000 & t < 100000]="50-100k"
tmp[t >=100000]=">=100k"
dtscores$核实收入 <- tmp


tmp <-t <-  dt$无抵押贷款月偿金额
tmp[t==0]=1
tmp[t>0 & t<=1500]=2
tmp[t>1500 & t<=3000]=3
tmp[t>3000 & t<=5000]=4
tmp[t>5000 & t<=10000]=5
tmp[t>10000]=6
dtscores$信用贷款负债 <- tmp
table(tmp,dtscores$状态)

tmp <- t <- dt$人行近三个月查询次数
tmp[t<=2]=1
tmp[t>2 & t<=5]=2
tmp[t>5 & t<=8]=3
tmp[t>8]=4
dtscores$人行近3个月查询次数 <- tmp

tmp <- t <- dt$人行房贷总金额
tmp[t==0]="0"
tmp[t>0 & t<=100000]="0-10w"
tmp[t>100000 & t<=300000]="10-30w"
tmp[t>300000]=">30w"
dtscores$人行房贷总金额 <- tmp

tmp <- t <-  dt$人行贷款次数
tmp[t==0]="0"
tmp[t==1]="1"
tmp[t==2]="2"
tmp[t>2 & t <=4]="2-4"
tmp[t>4 & t <=10]="5-10"
tmp[t>10 ]=">10"
dtscores$人行贷款次数 <- tmp

tmp <- t <-  dt$外部负债率
tmp[t==0]=1
tmp[t>0 & t <=0.1]=2
tmp[t>0.1 & t <=0.3]=3
tmp[t>0.3 & t <=0.6]=4
tmp[t>0.6 & t <=0.9]=5
tmp[t>0.9 & t <=1.5]=6
tmp[t>1.5]=7
dtscores$外部负债率 <- tmp

tmp <- t <-  dt$人行正常状态信用卡张数
tmp[t==0]=1
tmp[t==1]=2
tmp[t==2]=3
tmp[t %in% c(3,4)]=4
tmp[t>=5]=5
dtscores$人行正常状态信用卡张数 <- tmp

tmp <- dt$贷记卡月偿金额
tmp[t==0]=1
tmp[t>0 & t<=500]=2
tmp[t>500 & t<=1000]=3
tmp[t>1000 & t<=2000]=4
tmp[t>2000 & t<=5000]=5
tmp[t>5000 & t<=8000]=6
tmp[t>8000]=7
dtscores$信用卡负债 <- tmp

tmp <- t <- dt$人行单张信用卡最大信用额度
tmp[t==0]=1
tmp[t>0 & t<5000]=2
tmp[t>=5000 & t<10000]=3
tmp[t>=10000 & t<20000]=4
tmp[t>=20000 & t<50000]=5
tmp[t>=50000 & t<100000]=6
tmp[t>=100000]=7
dtscores$人行单张信用卡最大额度 <- tmp

tmp <- t <-  dt$贷记卡最高使用率
tmp[t==0]=1
tmp[t>0 & t <=0.25]=2
tmp[t>0.25 & t <=0.5]=3
tmp[t>0.5 & t <=0.8]=4
tmp[t>0.8 & t <=1]=5
tmp[t>1]=6
dtscores$贷记卡最高使用率 <- tmp

tmp <- t <-  dt$最早一张贷记卡开户距离目前月数
tmp[t==0]=1
tmp[t>0 & t <=3]=2
tmp[t>3 & t <=6]=3
tmp[t>6 & t <=12]=4
tmp[t>12 & t <=24]=5
tmp[t>24 & t <=36]=6
tmp[t>36 & t <=60]=7
tmp[t>60]=8
dtscores$最早一张贷记卡开户距离申请月月数 <- tmp

tmp <- t <- dt$人行近12个月的逾期次数
tmp[t==0]=1
tmp[t==1]=2
tmp[t %in% c(2,3)]=3
tmp[t>=4]=4
dtscores$人行近12个月的逾期次数 <- tmp

tmp <- t <-  dt$人行近3个月的逾期次数
tmp[t==0]=1
tmp[t==1]=2
tmp[t==2]=3
tmp[t>=3]=4
dtscores$人行近3个月的逾期次数 <- tmp

scale(dt[,15])
dtscores$状态 <- dt$状态
dtscores <- as.data.frame(dtscores)
# write.csv(dtscores,"d:/dtscores.csv")

for(i in 1:length(dtscores)) {

  write.table(table(names(dtscores)[i],"d:/out.csv",append=T))
  print( table(dtscores[,i],dtscores$状态))  
  # write.table(table(dtscores[,i],dtscores$状态),"d:/out.csv",append=T)
}
