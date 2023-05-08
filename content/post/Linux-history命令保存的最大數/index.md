+++
author = "Hugo Authors"
title = "Linux-history命令保存的最大數"
date = "2022-12-10"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Linux",
]
image = "100.png"
+++



   ***~/.bash_history 裡面紀錄的是上一次登出的歷史紀錄 (默認保存1000條)***
    
   查看目前保留配置
    
    echo $HISTSIZE
    
   修改環境變量 (永久配置)
   
    sed -i 's/^HISTSIZE=1000/HISTSIZE=100000/' /etc/profile
    source /etc/profile



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
