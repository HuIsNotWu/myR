
require(RODBC)

# dfdup[,10]<- NULL
dfscores <- list()

tmp <- df$性别
tmp[tmp %in% "男"]=8
tmp[tmp %in% "女"]=10
dfscores$gender <- as.numeric(tmp)

tmp <- df$年龄
tmp[tmp <25 ]=7
tmp[tmp >=25 & tmp < 35]=8
tmp[tmp >=35 & tmp < 40]=9
tmp[tmp >=40 & tmp < 45]=10
tmp[tmp >=45 & tmp < 50]=8
tmp[tmp >=50 & tmp < 55]=7
tmp[tmp >=55]=5
dfscores$age <- as.numeric(tmp)

tmp <- df$婚姻
tmp[tmp !="已婚" | tmp !="未婚"]=6
tmp[tmp =="已婚"]=10
tmp[tmp =="未婚"]=8
dfscores$婚姻 <- as.numeric(tmp)

tmp <- df$学历
tmp[tmp =="硕士及以上"]=10
tmp[tmp =="本科"]=9
tmp[tmp =="中专"]=8
tmp[tmp =="专科"]=7
tmp[tmp =="高中及以下"]=6
dfscores$学历 <- as.numeric(tmp)

tmp <- df$岗位类型
tmp[tmp =="高层管理" | tmp =="中层管理"]=10
tmp[tmp =="企业法人"]=9
tmp[tmp =="基础管理" | tmp =="一般员工"]=7
tmp[tmp =="其他"]=5
dfscores$岗位类型 <- as.numeric(tmp)

tmp <- df$户籍是否为居住地本地
tmp[tmp =="是"]=10
tmp[tmp =="否"]=4
dfscores$户籍是否为居住地本地 <- as.numeric(tmp)

tmp <- df$客户类型
tmp[tmp !="受薪" & tmp !="私营业主"]=6
tmp[tmp =="受薪"]=10
tmp[tmp =="私营业主"]=8
dfscores$客户类型 <- as.numeric(tmp)

tmp <- df$房产情况
tmp[tmp =="有"]=6
tmp[tmp =="无"]=10
dfscores$房产情况 <- as.numeric(tmp)

tmp <- df$按揭情况
tmp[tmp =="有"]=6
tmp[tmp =="无"]=10
dfscores$按揭情况 <- as.numeric(tmp)

tmp <- df$车辆情况
tmp[tmp =="有"]=10
tmp[tmp =="无"]=6
dfscores$车辆情况 <- as.numeric(tmp)

tmp <- df$发薪方式
tmp[tmp =="网银"]=10
tmp[tmp =="网银+现金"]=8
tmp[tmp =="现金"]=5
dfscores$发薪方式 <- as.numeric(tmp)

tmp <- df$核实收入
tmp[tmp <5000]=3
tmp[tmp >=5000 & tmp < 10000]=4
tmp[tmp >=10000 & tmp < 15000]=5
tmp[tmp >=15000 & tmp < 20000]=6
tmp[tmp >=20000 & tmp < 30000]=7
tmp[tmp >=30000 & tmp < 50000]=8
tmp[tmp >=50000 & tmp < 100000]=9
tmp[tmp >=100000]=10
dfscores$核实收入 <- as.numeric(tmp)

tmp <- df$信用卡负债
tmp[tmp==0]=8
tmp[tmp>0 & tmp<=500]=8
tmp[tmp>500 & tmp<=1000]=10
tmp[tmp>1000 & tmp<=2000]=9
tmp[tmp>2000 & tmp<=5000]=7
tmp[tmp>5000]=5
dfscores$信用卡负债 <- as.numeric(tmp)

tmp <- df$信用卡负债
tmp[tmp==0]=8
tmp[tmp>0 & tmp<=500]=8
tmp[tmp>500 & tmp<=1000]=10
tmp[tmp>1000 & tmp<=2000]=9
tmp[tmp>2000 & tmp<=5000]=7
tmp[tmp>5000]=5
dfscores$信用卡负债 <- as.numeric(tmp)

tmp <- df$信用贷款负债
tmp[tmp==0]=10
tmp[tmp>0 & tmp<=1500]=9
tmp[tmp>1500 & tmp<=3000]=8
tmp[tmp>3000 & tmp<=5000]=8
tmp[tmp>5000 & tmp<=10000]=7
tmp[tmp>10000]=5
dfscores$信用贷款负债 <- as.numeric(tmp)

tmp <- df$人行近3个月查询次数
tmp[tmp>=7]=7
tmp <- 10-tmp
dfscores$人行近3个月查询次数 <- tmp
# tmp[tmp==0]=10
# tmp[tmp==1]=9
# tmp[tmp==2]=8
# tmp[tmp==3]=7
# tmp[tmp==4]=6
# tmp[tmp==5]=5
# tmp[tmp==6]=4
# tmp[tmp>=7]=3

tmp <- df["人行房贷总金额"]
tmp[tmp>0 & tmp<=100000]=8
tmp[tmp==0]=10
tmp[tmp>100000 & tmp<=300000]=8
tmp[tmp>300000]=7
dfscores$人行房贷总金额 <- as.numeric(tmp)

tmp <- df$人行单张信用卡最大额度
tmp[tmp>0 & tmp<=5000]=8
tmp[tmp>5000 & tmp<=10000]=6
tmp[tmp>10000 & tmp<=20000]=8
tmp[tmp>20000 & tmp<=50000]=10
tmp[tmp>50000]=8
tmp[tmp==0]=5
dfscores$人行单张信用卡最大额度 <- as.numeric(tmp)

tmp <- df$人行近12个月的逾期次数
tmp[tmp>4]=5
tmp[tmp %in% c(2,3)]=7
tmp[tmp==1]=8
tmp[tmp==0]=10
dfscores$人行近12个月的逾期次数 <- as.numeric(tmp)

names(dfscores)
head(as.data.frame(dfscores))

dfdup$年龄[dfdup$年龄 %in% 36:40]
attach(dfscores)
gender*3/10+age*5/10+婚姻*3/10+学历*3/10+岗位类型*2/10+dfscores$户籍是否为居住地本地*2/10
detach(dfscores)
# 
# conn = odbcConnectExcel("E:/01 工作/01 信审/201601/20160129/信贷审核登记表2016-1-29.xls") # open a connection to the Excel file
# sqlTables(conn)$TABLE_NAME # show all sheets
# dt = sqlFetch(conn, "报表数据") # read a sheet
# dt = sqlQuery(conn, "select * from [报表数据$]") # read a sheet (alternative SQL sintax)
# close(conn) # close the connection to the file
# head(dt)
# 
# fdir <- "E:/01 工作/03 月报/01 风控月度分析/各月末数据/"
# lf <- list.files(fdir)
# fpath <- paste(fdir,lf[grep("16-1",lf)],sep = "")
# fpath
# conn <- odbcConnectExcel2007(fpath)

