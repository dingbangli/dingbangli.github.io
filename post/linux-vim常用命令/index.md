# Linux - VIM 常用參數 & 快捷鍵


***
***

## 永久新增 標註行數

```sql
vim /etc/vimrc
```

### 加上參數 `set nu`

```sql
set nu
```

***
***

## VIM 常用編輯快捷鍵

***
***

### 複製 `y` 常用的命令如下:

| 快捷命令 | 意思解說 |
| --- | --- |
| y | 在使用 v 模式選定了某一塊的時候,複製選定塊到緩衝區用 |
| yy | 複製整行( nyy 或者 yny ,複製 n 行 , n 為數字) |
| y^ | 複製當前到行頭的內容 |
| y$ | 複製當前到行尾的內容 |
| yw | 複製一個word (nyw 或者 ynw , 複製 n 個 word , n 為數字) |
| yG | 複製至檔尾 (nyG 或者 ynG , 複製到第 n 行,例如 1yG 或者 y1G , 複製到檔尾)
   
***
***

### 剪下 `d` 常用的命令如下:

| 快捷命令 | 意思解說 |
| --- | --- |
| d | 剪下選定塊到緩衝區 |
| dd | 剪下整行 |
| d^ | 剪下至行首 |
| d$ | 剪下至行尾 |
| dw | 剪下一個word |
| dG | 剪下至檔尾 |

***
***

### 貼上 `p` 常用的命令如下:
    
| 快捷命令 | 意思解說 |
| --- | --- |
| p | 小寫 p 代表貼至遊標後 |
| P | 大寫P代表貼至遊標前 |    

***
***
    
{{< admonition example >}}
  
### 注: 
    
#### 在正則表示式中,^表示匹配字串的開始位置,$表示匹配字串的結束位置。 
    
#### 命令前面加數字表示重複的次數,加字母表示使用的緩衝區名稱。使用英文句號"."可以重複上一個命令。 
    
#### 在複製貼上時,另一組常用的命令是u(撤銷操作),U(撤銷某一行最近所有修改),Ctrl+R(重做),這些功能主要是vim中的,vi中略有差別
    
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
> URL: https://laurance.eu.org/posts/linux-vim%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4/  

