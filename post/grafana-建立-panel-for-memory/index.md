# Grafana - 建立 panel for memory


***
***

**Add an panel for monitor memory**
=====

***
***

### {step1} 右上角 `+` > Add an empty panel

***
***

### {step2} 依需求填寫 `Data source` `Query` `Visualization`

***
***

{{< admonition example >}}

Data source = InfluxDB

Query = 

SELECT last("used_percent") AS "percent", "used" AS "used", "total" AS "total" FROM "mem" WHERE  "host" !~/^$interval$/ and time > now() -1m group by "host"

Visualization = Table

{{< /admonition >}}

***
***

### {step3} 依需求新增 `Transform`

***
***

{{< admonition example >}}

Transform = Organize fields

host = Host

used = Used

total = Total

percent = Percent

Time = LastUpdate
    
{{< /admonition >}}

***
***

![](101.png)

![](102.png)

![](103.png)

***
***

### {step4} 右側條件選單拉到最底選擇 `Add filed override`

***
***

{{< admonition example >}}

#### Override 1 & Override 2

{{< /admonition >}}

***
***

![](104.png)

![](105.png)

![](106.png)

***
***

{{< admonition example >}}

#### Override 3 & Override 4 & Override 5 

{{< /admonition >}}

***
***

![](107.png)

![](108.png)

![](109.png)

***
***

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


---

> Author: Laurance  
> URL: https://laurance.eu.org/posts/grafana-%E5%BB%BA%E7%AB%8B-panel-for-memory/  

