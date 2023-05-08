# Grafana - 建立 panel for storage


***
***

**Add an panel for monitor storage**
=====

***
***

### {step1} 右上角 `+` > Add an empty panel

***
***

### {step2} 依需求填寫 `Data source` `Query` `Visualization`

{{< admonition example >}}

Data source = InfluxDB
    
Query = 

SELECT last("used_percent") AS "percent", "used" AS "used", "total" AS "total" FROM "disk" WHERE  "host" !~ /^$interval$/ and time > now() -1m group by "host", "path"
    
Format as = Table
    
Visualization = Table

{{< /admonition >}}

***
***
    
![](201.png)

***
***

### {step3} 選擇 `Transform` 建立 `Organize fields` && 依需求填寫 `host`,`path`,`used`,`total`,`percent`,`lastupdate`

***
***

![](202.png)

![](203.png)

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

![](204.png)

![](205.png)

***
***

{{< admonition example >}}

#### Override 3 & Override 4

{{< /admonition >}}

***
***

![](206.png)

![](207.png)

***
***

{{< admonition example >}}

#### Override 5 & Override 6

{{< /admonition >}}

***
***

![](208.png)

![](209.png)

***
***

{{< admonition example >}}

#### FINAL

{{< /admonition >}}

***
***

![](210.png)

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
> URL: https://laurance.eu.org/posts/grafana-%E5%BB%BA%E7%AB%8B-panel-for-storage/  

