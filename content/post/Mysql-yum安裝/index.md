+++
author = "Hugo Authors"
title = "MariaDB-yum_repo"
date = "2022-08-03"
#description = ""
categories = [
    "Database"
]
tags = [
    "MySQL",
]
image = "100.png"
+++



    echo [mariadb] >  /etc/yum.repos.d/MariaDB.repo
    
    echo name = MariaDB >>  /etc/yum.repos.d/MariaDB.repo
    
    echo baseurl = http://mirror.mariadb.org/yum/10.8.6/centos74-amd64/ >> /etc/yum.repos.d/MariaDB.repo
    
    echo gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB >>  /etc/yum.repos.d/MariaDB.repo
    
    echo gpgcheck=1 >>  /etc/yum.repos.d/MariaDB.repo
    
    ##########################################
    
    yum install -y MariaDB-server MariaDB-client MariaDB-devel*
    
    mysql_secure_installation	#初始化



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
