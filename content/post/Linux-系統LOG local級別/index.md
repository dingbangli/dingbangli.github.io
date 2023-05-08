+++
author = "Hugo Authors"
title = "Linux 核心 & 系統日誌檔 (local 級別)"
date = "2023-03-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "System",
]
image = "100.png"
+++

|  等級數值  |  等級名稱   |  							 							說明  
|  --------  |  --------   |  -------------------------------------------------------------------------------------------------------------------
|	  7		 |    debug    |  用來 debug (除錯) 時產生的訊息資料；																				|
|	  6		 |    info     |  僅是一些基本的訊息說明而已；																						|
|	  5		 |	  notice   |  雖然是正常資訊，但比 info 還需要被注意到的一些資訊內容；															|
|	  4		 |    warning  |  警示的訊息，可能有問題，但是還不至於影響到某個 daemon 運作的資訊；												|
|	  3		 |    err      |  一些重大的錯誤訊息，例如設定檔的某些設定值造成該服務服法啟動的資訊說明 ;											|
|	  2		 |    crit     |  比 error 還要嚴重的錯誤資訊，這個 crit 是臨界點 (critical) 的縮寫 ;												|
|	  1		 |    alert    |  警告警告，已經很有問題的等級，比 crit 還要嚴重！ ;																|
|	  0		 |    emerg    |  疼痛等級，意指系統已經幾乎要當機的狀態！ 很嚴重的錯誤資訊了。通常大概只有硬體出問題，導致整個核心無法順利運作 ;	|

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
