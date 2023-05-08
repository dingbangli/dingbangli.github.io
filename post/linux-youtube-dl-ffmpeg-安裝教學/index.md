# Linux - youtube-dl && ffmpeg 安裝教學


***
***

## youtube-dl 安裝

**[youtube-dl官方連結](https://youtube-dl.org)**

***
***

### 安裝最新穩定版本

```sql
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/bin/youtube-dl
```

### 給予權限

```sql
chmod a+rx /usr/bin/youtube-dl
```

### 查看版本

```sql
youtube-dl --version
```

### 若要更新版本

```sql
youtube-dl --update
```

***
***

## ffmpeg 安裝

**[ffmpeg官方連結](https://ffmpeg.org/download.html)**

### 安裝依賴

```sql
yum install yasm
```

### 下載官方 tar 包

```sql
wget https://ffmpeg.org/releases/ffmpeg-5.1.2.tar.gz
```

### 解壓 && 安裝

```sql
tar zxvf ffmpeg-5.1.2.tar.gz
    
./configure --prefix=/usr/local/ffmpeg --enable-openssl
    
make && make install
```
    
### 建立 Link

```sql
ln -s /usr/local/ffmpeg/bin/ffmpeg /usr/bin/ffmpeg
```    

### 查看版本

```sql
ffmpeg -version
```

***
***
    
參考: https://guopengzhen.com/%E7%BF%BB%E8%AF%91/205/


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
> URL: https://laurance.eu.org/posts/linux-youtube-dl-ffmpeg-%E5%AE%89%E8%A3%9D%E6%95%99%E5%AD%B8/  

