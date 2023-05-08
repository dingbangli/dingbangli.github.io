+++
author = "Hugo Authors"
title = "Linux-VIM常用指令"
date = "2022-08-03"
#description = ""
categories = [
    "Linux"
]
tags = [
    "VIM",
]
image = "100.png"
+++



    vim /etc/vimrc 標註行數 
    第 10 行加上 set nu
    
    ###############################################################################################
    
    1. 選定文字塊。使用v進入可視模式,移動游標鍵選定內容。 
    
     
    
    2.複製的命令是y,即yank(提起) ,常用的命令如下: 
    
        y      在使用v模式選定了某一塊的時候,複製選定塊到緩衝區用; 
    
        yy    複製整行(nyy或者yny ,複製n行,n為數字); 
    
        y^   複製當前到行頭的內容; 
    
        y$    複製當前到行尾的內容; 
    
        yw   複製一個word (nyw或者ynw,複製n個word,n為數字); 
    
        yG    複製至檔尾(nyG或者ynG,複製到第n行,例如1yG或者y1G,複製到檔尾)  
    
        
    
    3. 剪下的命令是d,即delete,d與y命令基本類似,所以兩個命令用法一樣,包括含有數字的用法.  
    
        d      剪下選定塊到緩衝區; 
    
        dd    剪下整行 
    
        d^    剪下至行首 
    
        d$     剪下至行尾 
    
        dw    剪下一個word 
    
        dG     剪下至檔尾  
    
        
    
    4. 貼上的命令式p,即put(放下) 
    
        p      小寫p代表貼至遊標後(下),因為遊標是在具體字元的位置上,所以實際是在該字元的後面 
    
        P      大寫P代表貼至遊標前(上) 
    
        整行的複製貼上在遊標的上(下)一行,非整行的複製則是貼上在遊標的前(後)
    
     
    
    注: 
    
         在正則表示式中,^表示匹配字串的開始位置,$表示匹配字串的結束位置。 
    
         命令前面加數字表示重複的次數,加字母表示使用的緩衝區名稱。使用英文句號"."可以重複上一個命令。 
    
         在複製貼上時,另一組常用的命令是u(撤銷操作),U(撤銷某一行最近所有修改),Ctrl+R(重做),這些功能主要是vim中的,vi中略有差別
    
    ###############################################################################################

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
