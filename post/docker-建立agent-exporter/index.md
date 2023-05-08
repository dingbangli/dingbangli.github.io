# Docker - 建立 exporter 語法紀錄



```sql

    [Node-exporter]
    docker run -d -p 9100:9100 \
      -v "/proc:/host/proc" \
      -v "/sys:/host/sys" \
      -v "/:/rootfs" \
      --net=host \
      prom/node-exporter \
      --path.procfs /host/proc \
      --path.sysfs /host/sys \
      --collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"
  
    [Mysql-exporter]
     docker run -d  --restart=always  --name mysqld-exporter -p 9104:9104   --net=host  --pid="host" -e DATA_SOURCE_NAME="exporter:123456@(172.16.0.222:3307)/"   bitnami/mysqld-exporter

```


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
> URL: https://laurance.eu.org/posts/docker-%E5%BB%BA%E7%AB%8Bagent-exporter/  

