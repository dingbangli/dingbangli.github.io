# Linux - 使用 locate 尋找檔案教學與範例


***
***

### 安裝 locate 工具

```sql
yum install mlocate
```
    
### 更新 locate 資料庫

```sql
updatedb
```
    
### 預設的 locate 資料庫檔案位置

```sql
ls -l /var/lib/mlocate/mlocate.db
```

***
***
    
### 快速尋找檔案

#### 尋找含有 .bashrc 關鍵字的檔案

```sql
locate .bashrc
```
    
#### 計算含有 .bashrc 關鍵字的檔案數量

```sql
locate -c .bashrc
```
    
#### 不分大小寫

```sql
locate -i my.txt
```
    
#### 查看 locate 資料庫狀態

```sql
locate -S
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
> URL: https://laurance.eu.org/posts/linux-%E4%BD%BF%E7%94%A8-locate-%E5%B0%8B%E6%89%BE%E6%AA%94%E6%A1%88%E6%95%99%E5%AD%B8%E8%88%87%E7%AF%84%E4%BE%8B/  

