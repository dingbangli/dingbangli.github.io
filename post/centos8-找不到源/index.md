# CentOS8 - 找不到源解決方式


```sql

    dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
    dnf distro-sync

```

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
> URL: https://laurance.eu.org/posts/centos8-%E6%89%BE%E4%B8%8D%E5%88%B0%E6%BA%90/  

