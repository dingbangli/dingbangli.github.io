+++
author = "Hugo Authors"
title = "SVN-刪除早期版本庫 (記得先備份!!!)"
date = "2022-12-26"
description = "SVN-DUMP太肥導致硬碟爆了,因此決定瘦身一下"
categories = [
    "SVN"
]
tags = [
    "SVN",
]
image = "100.png"
+++


   查看目前版本號
    
    svnlook youngest /home/svn/mis-note
    
   保留 130-138 版本號的 dump
   
    svnadmin dump /home/svn/mis-note -r 130:138 > repo_dump_130-138.dmp 2>repo_dump_130-138.log
    
   將舊的庫移成 .bak
   
    mv mis-note/ mis-note-20230105.bak/
    
   新建庫
   
    svnadmin create /home/svn/mis-note

   將設定檔複製過來
   
    cp -r ../mis-note-20230105.bak/conf .

   查看乾淨庫的容量
   
    du -hs mis-note
    
   導入 dump
   
    svnadmin load /home/svn/mis-note < repo_dump_130-138.dmp >repo_load_130-138.log 2>repo_load_130-138.errlog
    
   看一下新庫容量有沒有增加
   
    du -hs mis-note
    
# Client 端 (Windows): 砍掉舊有的SVN資料夾 , 並取出新資料夾

# Server重啟
    
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
