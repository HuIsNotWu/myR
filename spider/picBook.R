Sys.setlocale(category = "LC_ALL", locale ="chs")
# install.packages("RCurl")
# install.packages("XML")
# install.packages("stringr")
library(RCurl)
library(XML)
library(stringr)
library(curl)

url <- "http://niuyuanying.blog.163.com/blog/static/172161018201537115016687/"

ht_li <- getHTMLExternalFiles(url,xpQuery ="//img/@src")
ht_li <- ht_li[str_detect(ht_li,".jpg")]
ht_li[2:5]
# if(!file.exists("d:/documents/book1")){dir.create("d:/documents/book1")}
for(i in 1:length(ht_li)){
  curl_download(ht_li[i],str_c("d:/documents/",i,".jpg"))
}

ptm <- proc.time()