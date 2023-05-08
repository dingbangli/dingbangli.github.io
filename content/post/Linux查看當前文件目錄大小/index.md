+++
author = "Hugo Authors"
title = "Linux-查看當前文件目錄大小"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Linux",
]
image = "100.png"
+++



    查看当前文件目录各个文件夹大小
    du -h --max-depth=1 |sort -hr (排序)
    
    查看指定目錄  
    du -h --max-depth=1 /path
    
    查看當層目錄
    du -h - .
    
    深入到第一層目錄
    --max-depth=1
    
    查看當前目錄下user目錄的大小，并不想看其他目錄以及其子目錄
    du -sh user
    
    要通過以1024字節為單位顯示一個目錄樹及其每個子樹的磁盤使用情况
    du -k /home/linux
    
    以MB為單位顯示一個目錄樹及其每個子樹的磁盤使用情况
    du -m /home/linux
    
    以GB為單位顯示一個目錄樹及其每個子樹的磁盤使用情况
    du -g /home/linux
    
    列出當前目錄中的目錄名不包括xyz字符串的目錄的大小
    du -h --exclude='*xyz*'
    
    只顯示一個目錄樹的全部磁盤使用情况
    du -s /home/linux



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
