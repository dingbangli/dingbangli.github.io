+++
author = "Hugo Authors"
title = "SVN-解決每次都需要輸入密碼"
date = "2023-02-04"
#description = ""
categories = [
    "SVN"
]
tags = [
    "SVN",
]
image = "100.png"
+++


刪除原本緩存密碼的文件

    rm -f ~/.subversion/auth/svn.simple/*
    
執行一次 "svn update" 讓密碼緩存文件重新生成

    cd nowblog-2023-02-08/ 
    
    svn up --username laurance
    
修改緩存目錄下的文件

    vim ~/.subversion/auth/svn.simple/1b47431ba1edd4463343286aca5a7e1
    
```yaml
K 15
svn:realmstring
V 43
<svn://192.168.168.1:3690>
K 8
passtype
V 6
simple
K 8
username
V 8
laurance
K 8
password
V 10
XXXXXX   (密碼)
END
```

# { passtype 固定是 simple ,  K 和 V 後面的數字分別代表 key 和 value 的長度 }

參考: https://blog.csdn.net/u013304850/article/details/124821651

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
