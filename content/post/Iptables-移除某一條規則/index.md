+++
author = "Hugo Authors"
title = "Linux-Iptables-移除某一條規則"
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

    將規則用號碼列出,並篩出該IP
    iptables -nL --line-number |grep 52.52.52.52
    
    將該chain裡的第41行砍掉
    iptables -D deny 41

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
