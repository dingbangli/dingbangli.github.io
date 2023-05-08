+++
author = "Hugo Authors"
title = "SVN-error (undefined symbol: svn_fs_util__version)"
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
    SVN出錯 symbol lookup error
    
    svn: symbol lookup error: /usr/local/lib/libsvn_fs_x-1.so.0: undefined symbol: svn_fs_util__version
    
    系统中装了rpm版的subversion，跟APR，引起版本混乱。故清理这些RPM包试试：
    
    rpm -qa|grep subversion
    
    rpm -e --nodeps subversion-libs-1.7.14-16.el7.x86_64
    
    rpm -qa|grep apr
    
    echo '/usr/local/APR/lib'>>/etc/ld.so.conf
    
    echo '/usr/local/ARP-util/lib'>>/etc/ld.so.conf
    
    ldconfig
    
    svnadmin create --pre-1.6-compatible /home/svn/mis-note



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
