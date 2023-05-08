# Linux - 開機出現 or type control -D to continue 解決辦法


<!--more-->
 ERROR : or type control -D to continue 解決辦法 

***
***

## Linux 開機失敗 ERROR "or type control -D to continue" 解決辦法

***
***

### 主要是磁碟問題,秀的 ERROR

***
***

#### 先使用 `root` 進入 `修復模式`

***
***

![](301.png)

***
***

#### 輸入完密碼後,進入的模式為 `唯讀模式` 使用以下指令更改為 `讀寫模式`

```sql
mount -n -o remount,rw /
```

***
***

![](303.png)

***
***

#### 使用指令 `df -h` 可以看到原本磁碟 mount 的位置

***
***

![](302.png)

***
***

#### 將正確位置寫入 `/etc/fstab` 

***
***

![](304.png)

***
***

#### 重啟後即可

```sql
reboot
```

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
> URL: https://laurance.eu.org/posts/linux-%E9%96%8B%E6%A9%9F%E5%87%BA%E7%8F%BE-or-type-control-d-to-continue-%E8%A7%A3%E6%B1%BA%E8%BE%A6%E6%B3%95/  

