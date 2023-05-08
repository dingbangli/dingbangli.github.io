+++
author = "Hugo Authors"
title = "Docker-透過image傳輸至另一台內網機器"
date = "2022-08-10"
#description = ""
categories = [
    "Docker"
]
tags = [
    "Docker",
]
image = "100.png"
+++

{{< highlight html >}}

首先將image包成 .tar檔
docker save blazingdb/blazingsql > blazingsql.tar

再執行docker load指令
docker load -i blazingsql.tar

{{< /highlight >}}

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
