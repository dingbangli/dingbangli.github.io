# CentOS6 - 安裝socks5代理


<!--more-->
"紀錄一下 安裝 SS5代理 語法"

```sql

wget https://nchc.dl.sourceforge.net/project/ss5/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz
    
yum -y install gcc automake make
yum -y install pam-devel openldap-devel cyrus-sasl-devel openssl-devel

tar xvf ss5-3.8.9-8.tar.gz
cd ss5-3.8.9
./configure && make && make install
    
vi /etc/opt/ss5/ss5.conf
auth    0.0.0.0/0               -              -
permit -        0.0.0.0/0       -       0.0.0.0/0

```

{{< admonition >}}
# 加入用戶名及密碼 /etc/opt/ss5/ss5.passwd
{{< /admonition >}}
    
## 修改 ss5 啟動的 port ( 默認是 1080 )
    
```sql

vi /etc/sysconfig/ss5
    
#SS5_OPTS=” -u root”
    
註解新增
    
SS5_OPTS=" -u root -b 0.0.0.0:8080"

```
    
## 給予 bash 檔增執行權限 /etc/rc.d/init.d/ss5

```sql

chmod 755 /etc/rc.d/init.d/ss5

service ss5 start # 重啟

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
> URL: https://laurance.eu.org/posts/centos6-%E5%AE%89%E8%A3%9Dsocks5%E4%BB%A3%E7%90%86/  

