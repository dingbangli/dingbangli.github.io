# Linux - 系統重啟 & 檢視日誌及歷史紀錄


***
***

## 各 LOG 代表意思及存放位置

| LOG 路徑 | 代表意思 |
| --- | --- |
| /var/log/message | 系統啟動後的資訊和錯誤日誌 |
| /var/log/secure | 與安全相關的日誌資訊 |
| /var/log/maillog | 與郵件相關的日誌資訊 |
| /var/log/cron | 與定時任務相關的日誌資訊 |
| /var/log/spooler | 與UUCP和news裝置相關的日誌資訊 |
| /var/log/boot.log | 守護程序啟動和停止相關的日誌訊息 |
| /var/log/wtmp | 永久記錄每個使用者登入、登出及系統的啟動、停機的事件 |
| /var/run/utmp | 記錄當前正在登入系統的使用者資訊 |
| /var/log/btmp | 記錄失敗的登入嘗試資訊 |

***
***
    
## Linux 系統查詢機器最近重啟時間命令

***
***

| 指令 | 意思 |    
| --- | --- |
| last reboot | 檢視所有重啟日誌資訊 |    
| last reboot l head -1 | 檢視最近的一條 |

***
***
    
| 指令 | 意思 |    
| --- | --- |
| last -x  l  grep shutdown  l  head -1 | 顯示上次關機的日期和時間 |
| uptime -s | 檢視系統正常的執行時間 |

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
> URL: https://laurance.eu.org/posts/linux%E7%B3%BB%E7%B5%B1%E9%87%8D%E5%95%9F-%E6%AA%A2%E8%A6%96%E6%97%A5%E8%AA%8C%E5%8F%8A%E6%AD%B7%E5%8F%B2%E7%B4%80%E9%8C%84/  

