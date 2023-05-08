+++
author = "Hugo Authors"
title = "PHP-使用YUM安裝"
date = "2022-08-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "PHP",
]
image = "100.png"
+++

{{< highlight html >}}

安装必要
yum -y install gcc gcc-c++

要安装PHP 7，使用以下命令在CentOS 7系统上安装和启用EPEL和Remi存储库。
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

安装yum-utils，这是一组用于管理yum存储库和包的有用程序。它有基本上扩展yum默认功能的工具。
它可用于管理（启用或禁用）yum存储库以及包，无需任何手动配置等等#yum -y install yum-utils

yum-utils提供的程序之一是yum-config-manager，使用它来启用Remi存储库作为安装不同PHP版本的默认存储库
yum-config-manager --enable remi-php71 [ 安装PHP 7.1 ]
yum-config-manager --enable remi-php72 [ 安装PHP 7.2 ]
yum-config-manager --enable remi-php73 [ 安装PHP 7.3 ]

使用以下命令安装PHP 7以及所有必需的模块。
yum -y install php php-mcrypt php-devel php-cli php-gd php-pear php-curl php-fpm php-mysql php-ldap php-zi

查看php版本
[root@VM_159_140_centos lnmp]# php -v

{{< /highlight >}}

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
