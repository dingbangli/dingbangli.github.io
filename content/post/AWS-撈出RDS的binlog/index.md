+++
author = "Hugo Authors"
title = "AWS-撈出RDS的binlog"
date = "2022-08-05"
#description = ""
categories = [
    "AWS"
]
tags = [
    "AWS",
]
image = "100.png"
+++



    撈出 RDS binlog

    cd /home/mariadb/binlog

    mysqlbinlog --base64-output=decode-rows -v --set-charset="utf8" --start-datetime="2021-11-04 14:06:00" --stop-datetime="2021-11-04 14:09:00"   mysql-bin-changelog.450599 > /home/laurance/RDS-1104-1405-1410.sql

    SCP過去跳板機

    scp RDS-1005-1330-1430.sql laurance@admin:~ 



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
