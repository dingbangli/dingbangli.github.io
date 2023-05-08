+++
author = "Hugo Authors"
title = "GCP-將MySQL-DB及BINLOG備份至Cloudstorage"
date = "2022-09-21"
#description = ""
categories = [
    "GCP"
]
tags = [
    "GCP",
]
image = "100.png"
+++

    1. 使用 nohup+& 背景執行資料庫壓縮 (除掉binlog)
   ![](001.png)
   
    2. 取第一支binlog跟最後一隻binlog的日期 (當作到時候壓縮的檔名)
   ![](002.png)
   
    3. 使用 nohup+& 背景執行binlog壓縮
   ![](003.png)
   
    4. 原本的驗證機制被刪除了 (gcloud auth login)
   ![](004.png)
   
   ![](005.png)
   
    5. 將壓縮好的TAR包傳到中繼機 (之前跟GCP驗證過的機器)
   ![](006.png)
   
    6. 上傳到GCP對應的目錄
   ![](007.png)
   
   

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
