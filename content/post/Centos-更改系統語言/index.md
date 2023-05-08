+++
author = "Hugo Authors"
title = "Centos-更改系統語言"
date = "2022-08-07"
#description = ""
categories = [
    "Linux"
]
tags = [
    "CentOS",
]
image = "100.png"
+++


    更改系統引數
    
    vim /etc/locale.conf		# CentOS 7
    LANG=“zh_CN.UTF-8”
    source  /etc/locale.conf
    
    vim /etc/sysconfig/i18n	        # CentOS6
    LANG=“zh_CN.UTF-8”
    source /etc/sysconfig/i18n
    
    重啟系統
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
