+++
author = "Hugo Authors"
title = "Memcache-常用語法"
date = "2022-08-16"
#description = ""
categories = [
    "Database"
]
tags = [
    "Memcache",
]
image = "100.jpeg"
+++



    連接memcache
    telnet 127.0.0.1 12000
    
    添加緩存
    add kk 1 0 4  	        #Enter
    1234  		        #Enter
    STORED
    
    修改緩存
    replace kk 1 0 2        #Enter
    11  		        #Enter
    STORED  
    
    設置緩存
    set kk 1 0 4  	        #Enter
    1234 		        #Enter
    STORED
    
    讀取
    get kk
    VALUE kk 1 4
    1234
    
    刪除
    delete kk 	        #Enter
    DELETED
    
    清空所有缓存
    flush_all  
    OK
    
    查看缓存服務器狀態
    stats
    
  
   命令格式
    <command> <key> <flags> <exptime> <bytes>\r\n
    <data block>\r\n
       
   參數名稱 | 作用
    --------|------
    command | add， set或 replace
        key | 缓存的名字
       flag | 16位无符号整数，和key要存储的数据一起存储，并在程序get缓存时，返回。
    exptime | 过去时间，0 表示永远不过期，如果非零，表示unix时间或距此秒数
      bytes | 存储数据的字节数
       \r\n | 換行Enter



***

{{< css.inline >}}
<style>
.emojify {
	font-family: Apple Color Emoji, Segoe UI Emoji, NotoColorEmoji, Segoe UI Symbol, Android Emoji, EmojiSymbols;
	font-size: 2rem;
	vertical-align: middle;
}
@media screen and (max-width:650px) {
  .nowrap {
    display: block;
    margin: 25px 0;
  }
}
</style>
{{< /css.inline >}}
