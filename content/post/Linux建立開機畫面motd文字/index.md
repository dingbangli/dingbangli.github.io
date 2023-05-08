+++
author = "Hugo Authors"
title = "Linux-建立開機畫面motd文字"
date = "2022-08-10"
#description = ""
categories = [
    "Linux"
]
tags = [
    "Linux",
]
image = "100.png"
+++


{{< highlight html >}}

建立開機畫面motd文字
使用 vim, 替換 ^[ 為“轉義”字符
在 vim 內按 :
輸入以下內容 %s/\^\[/ (不要點擊Enter)
輸入 Ctrl+v 然後點擊 Esc 轉換字符
最後輸入 /g ，點擊 Enter 
如果操作正確 ^[ 則從灰色變為藍色，如果沒有點擊 u 返回

另一種方法 (使用echo)
echo $'\e[1;37m' > myfile

{{< /highlight >}}


    各符號意思:
    
    %s	搜索
    
    /	第一項
    
    \^\[	轉義版本^[
    
    /	第二項，使用鍵盤插入實際Esc
    
    /g	重複所有出現


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
