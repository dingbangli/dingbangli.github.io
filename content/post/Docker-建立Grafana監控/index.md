+++
author = "Hugo Authors"
title = "Docker-建立Grafana監控並掛載在本機"
date = "2022-08-03"
#description = ""
categories = [
    "Docker"
]
tags = [
    "Grafana",
]
image = "100.png"
+++



    搜尋鏡像
    docker search mariadb
    
    拉取鏡像 
    docker pull mariadb
    
    本地建立目錄掛載進docker來管理
    mkdir -p /root/docker-service/mysql/conf/ && mkdir -p /root/docker-service/mysql/data/
    
    跑起服務
    docker run -d -p 3307:3306 -e MARIADB_ROOT_PASSWORD=123456 -v /root/docker-service/mysql/data/:/var/lib/mysql/ -v /root/docker-service/mysql/conf/:/etc/mysql/ --name mariadb mariadb:latest

   



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
