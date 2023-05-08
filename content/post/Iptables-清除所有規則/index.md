+++
author = "Hugo Authors"
title = "Linux-Iptables-清除所有規則"
date = "2022-11-18"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Iptables",
]
image = "100.jpg"
+++

    # 清除預設表 filter 中，所有規則鏈中的規則    
    iptables -F
    
    # 清除預設表 filter 中，使用者自訂鏈中的規則   
    iptables -X
    
    # 將所有的 chain 的計數與流量統計都歸零 
    iptables -Z
    
    # 允許所有輸入的封包
    iptables -P INPUT  ACCEPT
    
    # 允許所有輸出的封包
    iptables -P OUTPUT  ACCEPT
    
    # 允許所有轉發的封包
    iptables -P FORWARD  ACCEPT


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
