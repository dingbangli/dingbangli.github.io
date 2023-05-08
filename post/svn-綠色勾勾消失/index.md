# SVN - 綠色勾勾消失解決方法


***
***

**在 `windows` 上操作**
=====

***
***

**打開 windows 登陸編輯程式中的 `ShellIconOverlayIdentifiers`**

```sql
Win + R >> regedit >> HKEY_LOCAL_MACHINE -> SOFTWARE -> Microsoft -> Windows -> CurrentVersion -> Explorer -> ShellIconOverlayIdentifiers 
```

***
***

**查看註冊表中是否有 `Tortoisesvn` 相關選項,如果有則將 `Tortoisesvn` 相關移到最前端,將首字母改爲`數字`或者`空格`** 

***
***

{{< admonition example >}}

**如果註冊表中沒有 `Tortoisesvn` 則將 `Tortoisesvn導入到註冊表` , 具體內容爲以下**
***

打開註冊表 ` HKEY_LOCAL_MACHINE -> SOFTWARE -> Microsoft -> Windows -> CurrentVersion -> Explorer -> ShellIconOverlayIdentifiers`

***

將 `ShellIconOverlayIdentifiers` 匯出

***

使用編輯器打開匯出的文件 `xxx.reg` 並加入以下內容儲存:

`Windows Registry Editor Version 5.00)`

***
 
```sql
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\1TortoiseNormal]
@="{C5994560-53D9-4125-87C9-F193FC689CB2}"
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\2TortoiseModified]
@="{C5994561-53D9-4125-87C9-F193FC689CB2}"
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\3TortoiseConflict]
@="{C5994562-53D9-4125-87C9-F193FC689CB2}"
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\4TortoiseLocked]
@="{C5994563-53D9-4125-87C9-F193FC689CB2}"
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\5TortoiseReadOnly]
@="{C5994564-53D9-4125-87C9-F193FC689CB2}"
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\6TortoiseDeleted]
@="{C5994565-53D9-4125-87C9-F193FC689CB2}"
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\7TortoiseAdded]
@="{C5994566-53D9-4125-87C9-F193FC689CB2}"
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\8TortoiseIgnored]
@="{C5994567-53D9-4125-87C9-F193FC689CB2}"
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\9TortoiseUnversioned]
@="{C5994568-53D9-4125-87C9-F193FC689CB2}"
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\Offline Files]
@="{750fdf0e-2a26-11d1-a3ea-080036587f03}"
``` 

{{< /admonition >}}

***
***
    
**重啓 `Explorer`** 
    
```sql
CND :  taskkill /f /im explorer.exe > start explorer.exe
    
PW :  stop-process -name explorer -force
```

***
***

{{< admonition example >}}
    
`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\` 
    
```sql
001Tortoise1Normal
001Tortoise2Modified
001Tortoise3Conflict
001Tortoise4Locked
001Tortoise5ReadOnly
001Tortoise6Deleted
001Tortoise7Added
001Tortoise8Ignored
001Tortoise9Unversioned
```

{{< /admonition >}}

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
> URL: https://laurance.eu.org/posts/svn-%E7%B6%A0%E8%89%B2%E5%8B%BE%E5%8B%BE%E6%B6%88%E5%A4%B1/  

