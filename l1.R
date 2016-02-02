
require(RODBC)

conn = odbcConnectExcel("E:/01 工作/01 信审/201601/20160129/信贷审核登记表2016-1-29.xls") # open a connection to the Excel file
sqlTables(conn)$TABLE_NAME # show all sheets
dt = sqlFetch(conn, "报表数据") # read a sheet
dt = sqlQuery(conn, "select * from [报表数据$]") # read a sheet (alternative SQL sintax)
close(conn) # close the connection to the file
head(dt)
