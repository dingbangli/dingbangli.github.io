+++
author = "Hugo Authors"
title = "Linux-Iptables-轉發PORT"
date = "2022-10-20"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Iptables",
]
image = "100.jpg"
+++

    
   **將 80 PROT 轉向 8000 PORT**
   
    iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8000
    
   **利用 OUTPUT 的規則，從本機連到自己**
   
    iptables -t nat -A OUTPUT -p tcp -d localhost --dport 80 -j REDIRECT --to-ports 8000

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
