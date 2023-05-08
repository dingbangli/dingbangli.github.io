+++
author = "Hugo Authors"
title = "Linux-Iptables-永久關閉指令"
date = "2022-09-08"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Iptables",
]
image = "100.jpg"
+++

    
    查看防火牆狀態
    service iptables status
    
    永久性生效 (重啟不復原)
    chkconfig iptables on   (開啟)
    chkconfig iptables off  (關閉)
    
    即時性生效 (重啟後復原)
    service iptables start  (開啟)
    service iptables stop   (關閉)
    
    設置後重啟
    reboot

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
