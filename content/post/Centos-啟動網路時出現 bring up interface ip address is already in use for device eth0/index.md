+++
author = "Hugo Authors"
title = "Centos-啟動網路時出現 bring up interface ip address is already in use for device eth0"
date = "2022-10-07"
#description = ""
categories = [
    "Linux"
]
tags = [
    "CentOS",
]
image = "100.png"
+++


   重啟網路報錯 
   Bringing up interface eth0:  Determining if ip address 172.16.0.224 is already in use for device eth0...
   
   加上 ARPCHECK=no 重啟網路就好了
   
    vi /etc/sysconfig/network-scripts/ifcfg-eth0
    
```angular2html
DEVICE=eth0
HWADDR=XX:XX:XX:XX:XX:XX
TYPE=Ethernet
UUID=5248d5f6-7d7b-42ee-9443-e2f627c73677
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=static
IPADDR=172.16.0.224
GATEWAY=172.16.0.1
NETMASK=255.255.0.0
DNS1=8.8.8.8
DNS2=9.9.9.9
ARPCHECK=no


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
