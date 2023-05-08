+++
author = "Hugo Authors"
title = "Nginx-參數配置 tri_files $uri"
date = "2023-02-19"
description = "進行內部重定向URI"
categories = [
    "Web"
]
tags = [
    "Nginx",
]
image = "100.png"
+++

# 按指定順序檢查文件是否存在，並使用第一個找到的文件進行請求處理

配置

    try_files $uri  $uri/ /index.html;
    
`$uri`  這個是nginx的一個變量，存放著用戶訪問的地址,

EX： `http://www.xxx.com/index.html` 那麼 `$uri` 就是 `/index.html`


`$uri/` 代表訪問的是一個目錄

EX： `http://www.xxx.com/hello/test/` 那麼 `$uri/` 就是 `/hello/test/`


    比如用戶訪問這個網地址     http://www.xxx.com/test.html
        
    try_files 首先會判斷他是文件，還是一個目錄，結果發現他是文件，與第一個參數 $uri 變量匹配
        
    然後去到網站目錄下去查找 test.html 文件是否存在，如果存在直接讀取返回。如果不存在就跳去匹配 $uri/
    
    如果 $uri/ 不存在則匹配原路徑底下 /index.html



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
