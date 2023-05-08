+++
author = "Hugo Authors"
title = "Linux-History增加時間顯示"
date = "2022-08-16"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Linux",
]
image = "100.png"
+++



    臨時添加
    exprt HISTTIMEFORMAT=’%F %T ’
    
    永久套用
    vim .bashrc
    HISTTIMEFORMAT="%F %T "
    source .bashrc
    
    寫入 /etc/profile 達到全體套用
    …
    HISTTIMEFORMAT="%F %T "
    source /etc/profile
    
    Shell 執行的方法
    echo 'HISTTIMEFORMAT="%F %T "' >> /etc/profile
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
