# install.packages("RCurl")
# install.packages("XML")
# install.packages("stringr")
library(RCurl)
library(XML)
library(stringr)
library(curl)

# ptm <- proc.time()
n <- 0
url_li <- vector()
while(n*20<1720){
  url2 <- "http://www.gsmn.com.cn/Search.do?kind=0&key=%E5%8D%8E%E5%8D%97%E8%A5%BF%E9%83%A8&EgecStart=n*20"
  ht_li <- getHTMLLinks(url2)
  
  url_li <- c(url_li,ht_li)
  n <- n+1
  print(n)
}
url_li <- url_li[grep("ShowNews",url_li)]
# proc.time() - ptm

removeSpaceInListElement <- function(list){
  for(i in 1:length(list)){
    list[i] <- str_trim(list[i])
  }
  list
}

list <- vector()
for(i in 1:length(url_li)){
  url_full <- paste("http://www.gsmn.com.cn/",url_li[i],sep = "")
  res <- iconv(getURL(url_full,.encoding="GBK"),"GBK","utf-8")
  Encoding(res)
  doc <- htmlParse(file=res,asText = T,encoding = "utf-8")
  
  xp <- xpathSApply(doc,path = '//*[@id="PP_1"]/p')
  xp_list <- sapply(xp, xmlValue)
  xp_list <- xp_list[grep("[^[:space:]]",xp_list)]
  xp_list <- c(sapply(getNodeSet(doc,"//div//td/text()"), xmlValue),xp_list)
  list <- rbind(list,xp_list)
  
  print(i)
}
list <- removeSpaceInListElement(list)

write.csv(as.data.frame(list),"d:/华南西部区现货报价_new.csv",row.names = F)
