+++
author = "Hugo Authors"
title = "Docker-overlay2佔用大量磁碟空間處理方法"
date = "2022-09-13"
#description = ""
categories = [
    "Docker"
]
tags = [
    "Docker",
]
image = "100.png"
+++

    docker system命令  
    
    docker system df        整體磁區使用狀況
    docker system events    獲取系統即時LOG
    docker system info      查看整體系統基本信息
    docker system prune     清理不常用的docker資源 (包括: 容器 鏡像 磁區 網路)

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
