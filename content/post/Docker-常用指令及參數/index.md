+++
author = "Hugo Authors"
title = "Docker-常用指令&&參數"
date = "2022-08-03"
#description = ""
categories = [
    "Docker"
]
tags = [
    "Docker",
]
image = "100.png"
+++



    #查看目前使用的服務
    docker system df

    #Docker passwd存放位置
    /root/.docker/config.json

    #設定docker啟動，容器自動啟動
    docker run 容器  --restart=always 

    #使用update參數修改配置 
    docker update --restart=always ***(容器名)  

    #重啟Docker後，不啟動該容器
    docker update --restart=no mysqld-exporter

    #啟動錯誤查看目錄位置
    /etc/docker/daemon.json

    #使用root權限進入容器 exec -u 0
    docker  exec -ti -u 0 779afa4111c2 /bin/bash

    #完全停止容器
    docker stop $(docker ps -a -q)

    #完全刪除容器
    docker rm $(docker ps -a -q)

    #docker默认网段的修改
    "/etc/docker/daemon.json" >> 
    {
    "bip":"192.168.0.1/24"
    }

    #docker network :

    #創建network
    docker network create influxdb

    #建立自訂義 Network
    docker network create --driver bridge --subnet 172.16.50.0/24 --gateway=172.16.50.1 --ip-range 172.16.50.0/24 <network name>

    #查看network細節
    docker network inspect influxdb

    #拉取container設定檔
    docker run --rm telegraf telegraf config > telegraf.conf

    #運行容器 
    docker run -di

    #使得 Container 裡面的檔案路徑Mapping 到實體主機的檔案路徑
    docker -v XXX

    #搜尋鏡像
    docker search mariadb 

    #拉取鏡像
    docker pull mariadb 

    #啟動容器
    docker run -d --name prometheus2022 prom/prometheus 

    #複製容器內檔掛載到本機目錄
    docker cp -a prometheus2022:/etc/prometheus/ /root/docker-service/prometheus 

    #砍掉容器
    docker rm -f prometheus2020 

    #清理掉所有的container
    docker rm -fv $(docker ps -a -q)

    #刪除images
    docker stop containerID
    docker rm containerID
    docker rmi imageID

    #重新命名容器名稱
    docker rename <my_container> <my_new_container>

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
