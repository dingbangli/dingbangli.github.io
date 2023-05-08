# Centos - 啟動網路時出現 bring up interface ip address is already in use for device eth0


<!--more-->
"CentOS ERROR : bring up interface ip address is already in use for device eth0 解決方案"

{{< admonition >}}
 # 重啟網路報錯 

# Bringing up interface eth0:  Determining if ip address 172.16.0.224 is already in use for device eth0...
   
# 加上 ARPCHECK=no 重啟網路就好了
{{< /admonition >}}
   
```sql

vim /etc/sysconfig/network-scripts/ifcfg-eth0
    
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


---

> Author: Laurance  
> URL: https://laurance.eu.org/posts/centos-%E5%95%9F%E5%8B%95%E7%B6%B2%E8%B7%AF%E6%99%82%E5%87%BA%E7%8F%BE-bring-up-interface-ip-address-is-already-in-use-for-device-eth0/  

