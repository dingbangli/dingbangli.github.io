+++
author = "Hugo Authors"
title = "Docker-建立MariaDB"
date = "2022-08-03"
#description = ""
categories = [
    "Docker"
]
tags = [
    "MariaDB",
]
image = "100.png"
+++



    建立本機須掛載的目錄
    mkdir -p /root/docker-service/grafana/etc
    mkdir -p /root/docker-service/grafana/share
    
    拉取映象
    docker pull grafana
    
    執行映象
    docker run -d --name grafana -p 3000:3000 grafana/grafana
    
    複製docker裡的設定檔到本機
    docker cp -a 594649e64f24:/etc/grafana /root/docker-service/grafana/etc/
    docker cp -a 594649e64f24:/usr/share/grafana /root/docker-service/grafana/share/
    
    刪除container
    docker stop container_id
    docker rm container_id
    
    重跑設定檔 重跑掛載
    docker run -d -i -p 3000:3000 \
      -e "GF_SERVER_ROOT_URL=http://grafana.server.name"  \
      -e "GF_SECURITY_ADMIN_PASSWORD=admin"  \
      -v /root/docker-service/grafana/etc/grafana/grafana.ini:/etc/grafana/grafana.ini \
      -v /root/docker-service/grafana/share/grafana/conf/defaults.ini:/usr/share/grafana/conf/defaults.ini \
      --net=host \
      grafana/grafana



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
