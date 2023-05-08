# CentOS - 安装 speedtest-cli


<!--more-->
"(紀錄一下 Centos 安装 speedtest-cli 網速測試)"

 ```sql
    
    wget https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py

    vim speedtest.py >> (第一行#改python3)

    chmod a+rx speedtest.py

    mv speedtest.py /usr/local/bin/speedtest-cli

    chown root:root /usr/local/bin/speedtest-cli

```

{{< admonition >}}
  # 命令後追加 --share 可以得到測試信息圖片
    
  # speedtest-cli --share
{{< /admonition >}}

{{< admonition >}}
  # 追加 --list 可以得到所有的測試服務器
    
  # speedtest-cli --list
{{< /admonition >}}

{{< admonition >}}
 # 使用 – server 測試指定服務器的下載或上傳速度
    
 # speedtest-cli --server 41009 (站点ID可通過 --list 獲取)
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
> URL: https://laurance.eu.org/posts/centos-%E5%AE%89%E8%A3%85speedtest-cli/  

