# Linux - Rsync 基本設定


***
***

# **測試環境**
    
**A主機 ( Server端 ) IP :192.168.1.222**
    
**B主機 ( Clinet端 ) IP :192.168.1.122**

***
***
***

## B主機( Clinet端 ) 設定

### 安裝服務

```sql
yim install xinetd rsync
```
    
### 修改服務設定 xinetd.conf

```sql
vim /etc/xinetd.d/rsync
    

service rsync
{
        disable         = no
        socket_type     = stream
        wait            = no
        user            = root
        server          = /usr/bin/rsync
        server_args     = --daemon
        log_on_failure  += USERID
}
```

### 修改服務設定 rsyncd.conf

```sql
vim /etc/rsyncd.conf
    
    
[update]
path =          /
auth users =    update
hosts allow =   XX.XX.XX.XX  //來源IP
uid =           root
gid =           root
secrets file =  /etc/rsync.secrets
read only =     no
```

### 設定帳號密碼

```sql
vim /etc/rsync.secrets
    

update:123abc

```

### 啟動服務

```sql
systemctl start xinetd
``` 

***
***
***
   
## A主機 (Server端) 設定

### 設定密碼即可

```sql
vim rsync.secrets
    

123abc
```
    
**同步語法**
=====

```sql
rsync -aHSz  --delete --contimeout=5 --password-file=/etc/rsync.secrets /hugoserver update@XX.XX.XX.XX::update
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
> URL: https://laurance.eu.org/posts/linux-rsync-%E5%9F%BA%E6%9C%AC%E8%A8%AD%E5%AE%9A%E6%95%99%E5%AD%B8/  

