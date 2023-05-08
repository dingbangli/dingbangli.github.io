+++
author = "Hugo Authors"
title = "MySQL-將庫及表轉成SQL檔"
date = "2022-08-09"
#description = ""
categories = [
    "Database"
]
tags = [
    "MySQL",
]
image = "100.png"
+++

{{< highlight html >}}

將某庫某表轉成SQL檔
mysqldump -uroot -p UserAccount UserGame >/root/UserGame.sql

{{< /highlight >}}

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
