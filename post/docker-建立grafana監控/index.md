# Docker - 建立 Grafana 監控並掛載在本機 語法紀錄


{{< admonition >}}

# 搜尋鏡像
    
    docker search mariadb
    
# 拉取鏡像 
   
    docker pull mariadb
    
# 本地建立目錄掛載進docker來管理
    
    mkdir -p /root/docker-service/mysql/conf/ && mkdir -p /root/docker-service/mysql/data/
    
# 跑起服務
    
    docker run -d -p 3307:3306 -e MARIADB_ROOT_PASSWORD=123456 -v /root/docker-service/mysql/data/:/var/lib/mysql/ -v /root/docker-service/mysql/conf/:/etc/mysql/ --name mariadb mariadb:latest

{{< /admonition >}} 



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


---

> Author: Laurance  
> URL: https://laurance.eu.org/posts/docker-%E5%BB%BA%E7%AB%8Bgrafana%E7%9B%A3%E6%8E%A7/  

