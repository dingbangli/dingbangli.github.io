# Docker - 建立 MariaDB 語法紀錄



{{< admonition >}}

# 建立本機須掛載的目錄
    
```sql

mkdir -p /root/docker-service/grafana/etc
    
mkdir -p /root/docker-service/grafana/share

```

{{< /admonition >}}

{{< admonition >}}    
    
# 拉取映象
    
```sql

docker pull grafana

```

{{< /admonition >}}

{{< admonition >}}    

# 執行映象
    
```sql

docker run -d --name grafana -p 3000:3000 grafana/grafana

```

{{< /admonition >}}

{{< admonition >}}
    
# 複製docker裡的設定檔到本機
    
```sql

docker cp -a 594649e64f24:/etc/grafana /root/docker-service/grafana/etc/
  
docker cp -a 594649e64f24:/usr/share/grafana /root/docker-service/grafana/share/

```

{{< /admonition >}}

{{< admonition >}}    
    
# 刪除container
    
```sql

docker stop container_id
    
docker rm container_id

```

{{< /admonition >}}

{{< admonition >}}
    
# 重跑設定檔 重跑掛載
    
```sql

docker run -d -i -p 3000:3000 \
      -e "GF_SERVER_ROOT_URL=http://grafana.server.name"  \
      -e "GF_SECURITY_ADMIN_PASSWORD=admin"  \
      -v /root/docker-service/grafana/etc/grafana/grafana.ini:/etc/grafana/grafana.ini \
      -v /root/docker-service/grafana/share/grafana/conf/defaults.ini:/usr/share/grafana/conf/defaults.ini \
      --net=host \
      grafana/grafana

```

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
> URL: https://laurance.eu.org/posts/docker-%E5%BB%BA%E7%AB%8Bmariadb/  

