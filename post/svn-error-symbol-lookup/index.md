# SVN - error - undefined symbol: svn_fs_util__version


***
***

**svn: symbol lookup error: /usr/local/lib/libsvn_fs_x-1.so.0: undefined symbol: svn_fs_util__version**
***
**這是因為系统中装了`rpm 版` 的 `subversion 跟 APR` , 引起版本混乱 , 清理掉即可**

***
***
    
```sql
rpm -qa|grep subversion
    
rpm -e --nodeps subversion-libs-1.7.14-16.el7.x86_64
    
rpm -qa|grep apr
    
echo '/usr/local/APR/lib'>>/etc/ld.so.conf
    
echo '/usr/local/ARP-util/lib'>>/etc/ld.so.conf
    
ldconfig
    
svnadmin create --pre-1.6-compatible /home/svn/note
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
> URL: https://laurance.eu.org/posts/svn-error-symbol-lookup/  

