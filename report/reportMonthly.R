library(RODBC)

conn = odbcConnectExcel() # open a connection to the Excel file
sqlTables(conn)$TABLE_NAME # show all sheets
dt = sqlFetch(conn, "报表数据") # read a sheet
dt = sqlQuery(conn, "select * from [报表数据$]") # read a sheet (alternative SQL sintax)
close(conn) # close the connection to the file
head(dt)

fdir <- "E:/01 工作/03 月报/01 风控月度分析/各月末数据/"
lf <- list.files(fdir)
fpath <- paste(fdir,lf[grep("16-2",lf)],sep = "")
fpath
conn <- odbcConnectExcel2007(fpath)
dt <- sqlFetch(conn,"全部客户")
dt
head(dt)

t <- difftime(as.Date(dt$本期还款日),as.Date("2016-3-1"),units = "days")
floor(t/30)
dt$month <- difftime(as.Date(dt$放款日期)-as.Date("2016-3-1"),units = "days")
as.Date(dt$本期还款日)$year
