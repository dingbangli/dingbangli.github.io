+++
author = "Hugo Authors"
title = "SVN_SERVER-安裝教學 (CentOS7)"
date = "2022-10-06"
#description = ""
categories = [
    "SVN"
]
tags = [
    "SVN",
]
image = "100.png"
+++


    yum install apr* gcc zlib-devel automake autoconf libtool make
    wget https://archive.apache.org/dist/subversion/subversion-1.10.8.tar.gz
    tar zxvf subversion-1.10.8.tar.gz
    cd subversion-1.10.8
    mkdir sqlite-amalgamation
    
    [configure: error: Subversion requires SQLite]
    cd ../
    wget https://www.sqlite.org/2022/sqlite-autoconf-3400000.tar.gz --no-check-certificate
    tar zxvf sqlite-autoconf-3400000.tar.gz
    
    cd subversion-1.10.8/sqlite-amalgamation
    cp -r ../../sqlite-autoconf-3400000/* .

    
    cd ../
    ./configure --prefix=/usr/local/svn --without-berkeley-db --with-lz4=internal --with-utf8proc=internal
    make && make install
    cp /usr/local/svn/bin/* /usr/local/bin/

    
    啟動 svnserve:
    /usr/local/bin/svnserve --daemon --pid-file=/var/run/svnserve.pid
    
    adduser svn
    passwd svn
    
    建立資料庫
    svnadmin create /home/svn/project/
    
    增加使用者與密碼
    vim /home/svn/project/conf/passwd
    [users]
    mis=yoyoyo
        
    權限
    vim /home/svn/project/conf/auth
    [/]
    laurance=rw
    
    設定檔
    vim /home/svn/project/conf/svnserve.conf
    [general]
    anon-access=read
    auth-access=write
    password-db=passwd
    authz-db=authz
    realm=/home/svn/nowblog
    [sasl]
    
    重啟
    
    windows client 
    
    SVN 取出:
    svn://192.168.1.146/home/svn/project
    
    
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
