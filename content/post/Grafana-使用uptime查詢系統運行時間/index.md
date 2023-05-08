+++
author = "Hugo Authors"
title = "Grafana-使用uptime查詢系統運行時間"
date = "2022-12-16"
#description = ""
categories = [
    "Grafana"
]
tags = [
    "Grafana"
]
image = "100.png"
+++

# 建立 `panel for uptime`

點選 `uptime` 的 `panel` 選擇 `edit`

 ![](303.png)

旁邊細節設定可參照 :

 ![](301.png)
 
 ![](302.png)

# InfluxDB查詢語法:

    select last(uptime_format) as value from system
    
    SELECT last("uptime_format") AS "value" FROM "system" WHERE "host" =~ /$server$/ AND $timeFilter GROUP BY time($interval)



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
