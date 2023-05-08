+++
author = "Hugo Authors"
title = "Kubernetes-install cri-dockerd on Linux"
date = "2022-10-10"
#description = ""
categories = [
    "Kubernetes"
]
tags = [
    "Kubernetes",
]
image = "100.png"
+++

**從[cri-dockerd GitHub](https://github.com/Mirantis/cri-dockerd/releases) 頁面下載適當的二進制包**

    $ wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.2.0/cri-dockerd-v0.2.0-linux-amd64.tar.gz
    
解壓縮包

    $ tar xvf cri-dockerd-v0.2.0-linux-amd64.tar.gz
    
將 cri-dockerd 二進製文件移動到 usr/local/bin 目錄

    mv ./cri-dockerd /usr/local/bin/ 
    
配置 systemd

    $ wget https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.service
    
    $ wget https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.socket
    
    $ mv cri-docker.socket cri-docker.service /etc/systemd/system/

    $ sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service
    
啟用 cri-dockerd 

    $ systemctl daemon-reload
    
    $ systemctl enable cri-docker.service
    
    $ systemctl enable --now cri-docker.socket
   
驗證該服務是否正在運行

    $ systemctl status cri-docker.socket

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
