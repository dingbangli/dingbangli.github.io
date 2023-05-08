+++
author = "Hugo Authors"
title = "Debian-編輯模式下無法使用刪除鍵 (backspace)"
date = "2022-12-03"
#description = ""
categories = [
    "Debian"
]
tags = [
    "Debian",
]
image = "100.png"
+++

編輯以下文件

`vim /etc/vim/vimrc.tiny`

    set nocompatible
    
    set backspace=2
   
    
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
