# Docker - overlay2佔用大量磁碟空間處理方法



{{< admonition >}}
    
# docker system命令  

{{< /admonition >}}

{{< admonition >}}
    
    docker system df        整體磁區使用狀況
    
    docker system events    獲取系統即時LOG
    
    docker system info      查看整體系統基本信息
    
    docker system prune     清理不常用的docker資源 (包括: 容器 鏡像 磁區 網路)

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
> URL: https://laurance.eu.org/posts/docker-overlay2%E4%BD%94%E7%94%A8%E5%A4%A7%E9%87%8F%E7%A3%81%E7%A2%9F%E7%A9%BA%E9%96%93%E8%99%95%E7%90%86%E6%96%B9%E6%B3%95/  

