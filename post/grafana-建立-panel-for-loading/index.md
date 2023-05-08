# Grafana - 建立 panel for loading


***
***

**Add an panel for monitor loading**
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

{{< /admonition >}}

{{< admonition example >}}

Query = SELECT last("load1") AS "load" FROM "system" WHERE  "host" !~/^$interval$/ and time > now() -1m group by "host"

{{< /admonition >}}

{{< admonition example >}}
   
Visualization = Table

{{< /admonition >}}

***
***
    
![](201.png)

***
***

### {step3} 選擇 `Transform` 建立 `Organize fields` && 增加 `host` `load` `time`

***
***

![](202.png)

![](203.png)

***
***

### {step4} 右側條件選單拉到最底選擇 

***
***

{{< admonition example >}}

`Add filed override` > `Fields with name` > `LastUpdate` > `+ Add override property`

{{< /admonition >}}

***
***

![](204.png)

![](205.png)

![](206.png)

***
***

{{< admonition example >}}

`Standard options > Unit` > `Date&time` > `From Now`

{{< /admonition >}}

***
***

![](207.png)

![](208.png)

***
***

{{< admonition example >}}

#### Override 1

{{< /admonition >}}

***
***

![](209.png)

***
***

{{< admonition example >}}

#### Override 2

{{< /admonition >}}

***
***

![](210.png)

***
***

{{< admonition example >}}

#### Override 3

{{< /admonition >}}

***
***

![](211.png)

***
***

{{< admonition example >}}

#### Final

{{< /admonition >}}

***
***

![](212.png)

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
> URL: https://laurance.eu.org/posts/grafana-%E5%BB%BA%E7%AB%8B-panel-for-loading/  

