+++
author = "Hugo Authors"
title = "Linux-Iptables參數"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Iptables",
]
image = "100.jpg"
+++

    
    參數說明：
    
    -F ：清除所有的已訂定的規則；
    
    -X ：殺掉所有使用者建立的 tables ；
    
    -Z ：將所有的 chain 的計數與流量統計都歸零 
    
    -N ：建立新的規則鏈(chain)
    
    -E ：更改指定的規則鏈(chain)名稱
    
    -A ：追加規則:新增規則到某個規則鏈中，該規則將會成為規則鏈中的最後一條規則
    
    -R ：修改規則-->iptables -R INPUT 1 -s 192.168.12.0 -j DROP 取代現行規則，順序不變(1是位置)
    
    -I ：插入規則-->iptables -I INPUT 1 --dport 80 -j ACCEPT 插入一條規則，原本位置上的規則將會往後移動一個順位
    
    -L ：查看規則-->iptables -L INPUT 列出規則鏈中的所有規則
    
    -P ：policy , 定義過濾政策。 也就是未符合過濾條件之封包，預設的處理方式
    
    -t ：參數後跟上要單獨查看的表名 $IPTABLES -F -t nat (清空nat表)
    
    -p ：協定：tcp、upd、icmp...
    
    -m ：模組：state、mac、limit、owner、multiport...
    
    -m state --state :
    
    新的（NEW） — 某個封包請求開啟新的連線，例如 HTTP 請求。
    
    已建立（ESTABLISHED） — 屬於某個現有連線的封包。
    
    相關的（RELATED） — 屬於現有連線的封包，請求開啟一個新的連線，例如被動式 FTP 的連線，其連接埠為 20；但資料傳輸埠則是 1024 以上，未使用的連接埠。
    
    無效的（INVALID） — 在連結追蹤表中，不屬於任何連線的封包。
    
    lo  : 只要是本机进程内相互访问的，都会去到lo这张网卡上，所以在外部IP时对于iptables选择的是eth0这样的网卡，要捕获本机时是lo这个网卡
    
    -o ：網路介面：-o 為 out 網路介面就填 eth0... (用於 POSTROUTING、OUTPUT、FORWARD)
    
    -i ：網路介面：-i 為 in 網路介面就填 eth0... (用於 PREROUTING、INPUT、FORWARD)
    
    -s ：來源：可為 IP Address、IP 網段、網域名稱
    
    --sport：指定封包來源 Port、Port Range (配合 -p tcp、-p udp)
    
    -d ：目的地：可為 IP、IP 網段、網域名稱
    
    --dport：指定封包目的地 Port、Port Range (配合 -p tcp、-p udp)
    
    -j ：政策 / 目標：ACCEPT、DROP、REJECT、SNAT、DNAT、MASQUERADE、REDIRECT、RETURN...

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
