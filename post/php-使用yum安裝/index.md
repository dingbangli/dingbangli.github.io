# PHP - 如何使用 YUM 安裝


***
***

**安装依賴**
--------

***
***

```sql
yum -y install gcc gcc-c++
```

***
***

**安裝 `EPEL` 和 `Remi存儲庫`**

```sql
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
```

***
***

**安装 `yum-utils`**

`這是一組用於管理 yum存儲庫和包的有用程序。它有基本上擴展 yum默認功能 的工具`

```sql
yum -y install yum-utils
```

***
***

**使用 `yum 管理` 啟用該版本 php**
-----

***
***

{{< admonition example >}}

**[安装 `PHP 7.1`]**

```sql
yum-config-manager --enable remi-php71
```

**[ 安装 `PHP 7.2` ]**

```sql
yum-config-manager --enable remi-php72 
```

**[ 安装 `PHP 7.3` ]**

```sql
yum-config-manager --enable remi-php73
```

{{< /admonition >}}

***
***

**安裝 php**
-----

```sql
yum -y install php php-mcrypt php-devel php-cli php-gd php-pear php-curl php-fpm php-mysql php-ldap php-zi
```

***
***

**查看 php 版本**

```sql
[root@VM_159_140_centos lnmp]# php -v
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
> URL: https://laurance.eu.org/posts/php-%E4%BD%BF%E7%94%A8yum%E5%AE%89%E8%A3%9D/  

