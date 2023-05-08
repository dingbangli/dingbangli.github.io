# MariaDB - CentOS 7 yum 安裝源 ( yum_repo )


***
***

**{ yum repo }**
-----

```sql
cat <<EOF | tee /etc/yum.repos.d/MariaDB.repo

# MariaDB 10.5 CentOS repository

# http://downloads.mariadb.org/mariadb/repositories/

[mariadb]

name = MariaDB

baseurl = http://yum.mariadb.org/10.5/centos7-amd64

gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB

gpgcheck=1

EOF
```

***
***
    
**yum 安裝 ` MariaDB-10.5.14 `**
-----
    
```sql
yum install -y MariaDB-server MariaDB-client MariaDB-devel*
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
> URL: https://laurance.eu.org/posts/mysql-yum%E5%AE%89%E8%A3%9D/  

