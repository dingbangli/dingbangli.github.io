+++
author = "Hugo Authors"
title = "Grafana-建立 panel for loading"
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
    
    >> SELECT last("load1") AS "load" FROM "system" WHERE  "host" !~/^$interval$/ and time > now() -1m group by "host"
---    
    Visualization 
    
    >> Table
    
![](201.png)

{step3} 選擇 `Transform` 建立 `Organize fields` && 增加 `host` `load` `time`

![](202.png)

![](203.png)

{step4} 右側條件選單拉到最底選擇 

`Add filed override` > `Fields with name` > `LastUpdate` > `+ Add override property`

![](204.png)

![](205.png)

![](206.png)
   
`Standard options > Unit` > `Date&time` > `From Now`

![](207.png)

![](208.png)

# Override 1
![](209.png)

# Override 2
![](210.png)

# Override 3
![](211.png)

# Final
![](212.png)

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
