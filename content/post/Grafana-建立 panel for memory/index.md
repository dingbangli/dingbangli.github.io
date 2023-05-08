+++
author = "Hugo Authors"
title = "Grafana-建立 panel for memory"
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

# Add an panel for monitor loading

{step1} 右上角 `+` > Add an empty panel

{step2} 依需求填寫 `Data source` `Query` `Visualization`

    Data source 
    
    >> InfluxDB:databases
---    
    Query 
    
    >> SELECT last("used_percent") AS "percent", "used" AS "used", "total" AS "total" FROM "mem" WHERE  "host" !~/^$interval$/ and time > now() -1m group by "host"
---    
    Visualization 
    
    >> Table
    
---
    Transform
    
    Organize fields
    
    host
    
    >> Host
    
    used
    
    >> Used
    
    total
    
    >> Total
    
    percent
    
    >> Percent
    
    Time
    
    >> LastUpdate
    
    
![](101.png)

![](102.png)

![](103.png)

{step4} 右側條件選單拉到最底選擇 `Add filed override`

# Override 1 & Override 2

![](104.png)

![](105.png)

![](106.png)
   
# Override 3 & Override 4 & Override 5 

![](107.png)

![](108.png)

![](109.png)

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
