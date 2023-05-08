+++
author = "Hugo Authors"
title = "SVN-綠色勾勾消失"
date = "2022-08-03"
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
    SVN綠色勾勾消失
    
    1. Win + R >> regedit >> HKEY_LOCAL_MACHINE->SOFTWARE->Microsoft->Windows->CurrentVersion->Explorer->ShellIconOverlayIdentifiers 
    
    2. 查看註冊表中是否有Tortoisesvn相關選項，如果有，將Tortoisesvn相關移到最前端，將首字母改爲數字，或者空格 
    (如果註冊表中沒有Tortoisesvn相關，則將Tortoisesvn導入到註冊表，具體內容爲：
    Windows Registry Editor Version 5.00)
    
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
    
    將上面內容保存到svn.reg文件中，然後導入註冊表
    
    3. 重啓Explorer 
    
    CND :  taskkill /f /im explorer.exe > start explorer.exe
    
    PW :  stop-process -name explorer -force
    
    4. EX: 電腦\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\ 
    
       001Tortoise1Normal
       001Tortoise2Modified
       001Tortoise3Conflict
       001Tortoise4Locked
       001Tortoise5ReadOnly
       001Tortoise6Deleted
       001Tortoise7Added
       001Tortoise8Ignored
       001Tortoise9Unversioned



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
