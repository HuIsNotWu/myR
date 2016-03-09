
library(rJava)
library(xlsxjars)
library(xlsx)
# library(openxlsx)
rx <- read.xlsx2("E:\\01 工作\\01 信审\\20160304\\车贷审核登记表2016年新版.xls","Sheet1")
rx
names(rx)

as.Date(rx$申请日期,origin = "1900-01-01")
as.Date(42433,origin="1900-1-1")
