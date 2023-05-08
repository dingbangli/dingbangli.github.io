# Docker - 常用指令 && 參數


{{< admonition >}}

  # 查看目前使用的服務
    
```sql

docker system df

```
    
  # Docker passwd存放位置
    
```sql

/root/.docker/config.json

```

# 設定docker啟動，容器自動啟動
    
```sql

docker run 容器  --restart=always 

```
    
 # 使用update參數修改配置 
    
```sql

docker update --restart=always ***(容器名)  

```

# 重啟Docker後，不啟動該容器
    
```sql

docker update --restart=no mysqld-exporter

```
   
# 使用root權限進入容器 exec -u 0
    
```sql

docker  exec -ti -u 0 779afa4111c2 /bin/bash

```
    
# 完全停止容器
    
```sql

docker stop $(docker ps -a -q)

```
    
# 完全刪除容器
    
```sql

docker rm $(docker ps -a -q)

```

 # docker 預設網段位置
 
```sql

"/etc/docker/daemon.json" >> 
  {
  "bip":"192.168.0.1/24"
  }

```

{{< /admonition >}}

{{< admonition >}}

# docker network :

---

## 創建 network
    
```sql

docker network create influxdb

```

 # 建立自訂義 Network
    
```sql

docker network create --driver bridge --subnet 172.16.50.0/24 --gateway=172.16.50.1 --ip-range 172.16.50.0/24 <network name>

```

# 查看network細節
    
```sql

docker network inspect influxdb

```

 # 拉取container設定檔
    
```sql

docker run --rm telegraf telegraf config > telegraf.conf

```

 # 運行容器 
    
```sql

docker run -di

```

# 使得 Container 裡面的檔案路徑Mapping 到實體主機的檔案路徑
    
```sql

docker -v XXX

```

# 搜尋鏡像
    
```sql

docker search mariadb 

```
    
 # 拉取鏡像
    
```sql

docker pull mariadb 

```
    
 # 啟動容器
    
```sql

docker run -d --name prometheus2022 prom/prometheus 

```
    
 # 複製容器內檔掛載到本機目錄
    
```sql

docker cp -a prometheus2022:/etc/prometheus/ /root/docker-service/prometheus 

```
    
 # 砍掉容器
    
```sql

docker rm -f prometheus2020 

```
    
 # 清理掉所有的container
    
```sql

docker rm -fv $(docker ps -a -q)

```
    
 # 刪除images
    
```sql

docker stop containerID
    
docker rm containerID
    
docker rmi imageID

```

 # 重新命名容器名稱
    
```sql

docker rename <my_container> <my_new_container>

```

{{< /admonition >}}

    #############################################################


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
> URL: https://laurance.eu.org/posts/docker-%E5%B8%B8%E7%94%A8%E6%8C%87%E4%BB%A4%E5%8F%8A%E5%8F%83%E6%95%B8/  

