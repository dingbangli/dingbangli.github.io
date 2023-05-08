# Docker - 透過image傳輸至另一台內網機器


{{< admonition >}}

# 首先將image包成 .tar檔

```sql

docker save blazingdb/blazingsql > blazingsql.tar

```

{{< /admonition >}}

{{< admonition >}}

# 再執行docker load指令

```sql

docker load -i blazingsql.tar

```

{{< /admonition >}}


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
> URL: https://laurance.eu.org/posts/docker-%E9%80%8F%E9%81%8Eimage%E5%82%B3%E8%BC%B8%E8%87%B3%E5%8F%A6%E4%B8%80%E5%8F%B0%E5%85%A7%E7%B6%B2%E6%A9%9F%E5%99%A8/  

