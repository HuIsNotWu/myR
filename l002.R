library(rJava)
require(xlsxjars)
library(xlsx) #不支持中文工作表名？

# install.packages("XLConnect")
# require(XLConnect)
# readxlsx()读取时中文显示乱码，read.xlsx2()读取时中文显示正常但无法用中文sheet名？？

wb <- loadWorkbook("E:/01 工作/01 信审/201601/20160129/信贷审核登记表2016-1-29.xls")
# saveWorkbook(wb,"E:/test.xls")  #保存文件

# wb$getNumberOfSheets()
getSheets(wb)
# 选择工作表

chooseSheet <- function(str,nameList){
  for(i in 1:length(nameList)){
    if(iconv(nameList[i],"utf-8")==str){
      shtname=nameList[i]
    }
  }
  shtname
}
shtname <- chooseSheet("报表数据",names(getSheets(wb)))

dt <- read.xlsx2("E:/01 工作/01 信审/201601/20160129/信贷审核登记表2016-1-29.xls"
                 # ,sheetIndex = 1
                 ,sheetName=shtname)
head(dt)

# enc2utf8(a)
# iconvlist()
# iconv(shtname,"utf-8")=="报表数据"

# rm(list = ls())   # 清除所有内存中变量
# sink("d:/txt.txt")
# sink()

# localeToCharset(locale=Sys.getlocale("LC_CTYPE"))
# localeToCharset(locale = Sys.setlocale(category = "LC_ALL",locale = "CP65001"))

# Create a new workbook
wb = createWorkbook();
# Create a new sheet with a name
sheet1 = createSheet(wb, "第一页");
# Set the zoom ratio when you open the Excel file
setZoom(sheet1, 50, 100);
# Set the width of columns
setColumnWidth(sheet1, 1:100, 2.8);

# Create rows
rows = createRow(sheet1, 1:40);
# Create cells for each row
cells = createCell(rows, 1:73);
# Merge the first row into one cell
addMergedRegion(sheet1, 1, 1, 1, 73);
# Create the style for title cell
title_cell_style = CellStyle(wb,
                             alignment = Alignment(horizontal = "ALIGN_CENTER"),
                             font = Font(wb, "blue", 50, isBold = TRUE));
# Create the style for black cells
black_cell_style = CellStyle(wb,
                             border = Border(),
                             fill = Fill(foregroundColor= "black"));
# Get the first row
first_row = getRows(sheet1, 1);
# Get the title cell from first row
title_cell = getCells(first_row, 1)[[1]];
# Set the value of the title cell
setCellValue(title_cell, "Read/Write Excel!");
# Set the style of the title cell
setCellStyle(title_cell, title_cell_style);
# Set the style of black cells
tmp = mapply(function(x, y) setCellStyle(cells[[x, y]], black_cell_style),
             ind[, 1] 3, ind[, 2] 5);
# Save the workbook into a file
saveWorkbook(wb, "d:/test.xls");

# system.file("help","anindex",package = "xlsx")
# system.file("d:/","xls")
