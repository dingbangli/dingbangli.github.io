+++
author = "Hugo Authors"
title = "shell script-清除內部解析暫存"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "shell script",
]
image = "100.png"
+++



    #!/bin/bash
    
    rndc flush
    service named restart
    rndc flush



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
