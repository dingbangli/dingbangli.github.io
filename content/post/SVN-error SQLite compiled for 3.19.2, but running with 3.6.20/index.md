+++
author = "Hugo Authors"
title = "SVN-error (SQLite compiled for 3.19.2, but running with 3.6.20)"
date = "2022-08-04"
#description = ""
categories = [
    "SVN"
]
tags = [
    "SVN",
]
image = "100.png"
+++


    ---------------------------------------
    #svn --version
    
    svn: E200029: Couldn't perform atomic initialization
    svn: E200030: SQLite compiled for 3.19.2, but running with 3.6.20
    
    這是因為編譯SVN用的sqlite 版本3.19.2和系統中已安裝的sqlite3.6.20版本不一致
    
    #cd /usr/local/svn/bin
    #ldd svn
    
    從輸出中看出 libsqlite3.so.0 => /usr/lib64/libsqlite3.so.0 (0x00007f0f8572d000)
    
    [root@localhost lib64]# find / -name libsqlite3.so.0 -print
    /usr/local/sqlite/lib/libsqlite3.so.0
    /usr/local/sqlite-autoconf-3190200/.libs/libsqlite3.so.0
    /usr/local/lib/libsqlite3.so.0
    /usr/lib64/libsqlite3.so.0
    [root@localhost lib64]# mv libsqlite3.so.0 libsqlite3.so.0.old
    [root@localhost lib64]# ln -s /usr/local/lib/libsqlite3.so.0 libsqlite3.so.0



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
