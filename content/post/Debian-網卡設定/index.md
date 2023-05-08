+++
author = "Hugo Authors"
title = "Debian-網卡設定"
date = "2022-12-03"
#description = ""
categories = [
    "Debian"
]
tags = [
    "Debian",
]
image = "100.png"
+++

編輯網卡設定檔

```yaml
vi /etc/network/interfaces

```

    auot eth0
    
    iface eth0 inet static
    
    address 192.168.2.66
    
    netmask 255.255.255.0
    
    gateway 192.168.2.254


重啟網卡

    /etc/init.d/networking restart
    
查看 IP

    ip a
    
    ifconfig

   
    
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
