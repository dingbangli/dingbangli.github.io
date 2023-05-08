+++
author = "Hugo Authors"
title = "Linux-使用 locate 尋找檔案教學與範例"
date = "2023-02-01"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Locate",
]
image = "100.png"
+++


安裝 locate 工具

    yum install mlocate
    
更新 locate 資料庫

    updatedb
    
預設的 locate 資料庫檔案位置

    ls -l /var/lib/mlocate/mlocate.db
    
# 快速尋找檔案

尋找含有 .bashrc 關鍵字的檔案

    locate .bashrc
    
計算含有 .bashrc 關鍵字的檔案數量

    locate -c .bashrc
    
不分大小寫

    locate -i my.txt
    
查看 locate 資料庫狀態

    locate -S



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
