library(RCurl)
library(XML)
library(stringr)
library(curl)
# 
url <- "http://niuyuanying.blog.163.com/blog/static/172161018201537115016687/"
# 
ht_li <- getHTMLExternalFiles(url,xpQuery ="//img/@src")
ht_li <- ht_li[str_detect(ht_li,".jpg")]
ht_li[2:5]
# if(!file.exists("d:/documents/book1")){dir.create("d:/documents/book1")}
for(i in 1:length(ht_li)){
  curl_download(ht_li[i],str_c("d:/documents/",i,".jpg"))
}

url2 <- "http://www.gsmn.com.cn/Search.do?kind=0&key=%E5%8D%8E%E5%8D%97%E8%A5%BF%E9%83%A8&EgecStart=0"
ht_li <- getHTMLLinks(url2)
ht_li <- ht_li[grep("ShowNews",ht_li)]
ht_li

url_full <- paste("http://www.gsmn.com.cn/",ht_li[1],sep = "")

res <- getURL(url_full)
htmlParse(res,encoding = "utf-8")

"/html/body/div[4]/div[1]/div[1]/div"