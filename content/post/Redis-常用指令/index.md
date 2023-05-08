+++
author = "Hugo Authors"
title = "Redis-常用指令"
date = "2023-01-19"
#description = ""
categories = [
    "Cache"
]
tags = [
    "Redis",
]
image = "100.png"
+++

# 常用語法

|	指令					|	說明						|
|   ----------------------  |   --------------------------  |
|	keys *					|	查看所有鍵					|
|	exists <key>			|	判斷某個鍵是否存在			|
|	type <key>				|	查看鍵的類型				|
|	del <key>				|	刪除某個鍵					|
|	expire <key> <seconds>	|	為鍵設置過期時間			|
|	ttl <key>				|	查看還有多少秒過期			|
|	dbsize					|	查看當前數據庫的key的數量	|

# 刪除指令

|	指令					|	說明						|
|   ----------------------  |   --------------------------  |
|	flushdb					|	清空當前庫					|
|	flushall				|	清空所有庫					|


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
