+++
author = "Hugo Authors"
title = "Nginx-Location參數"
date = "2022-08-03"
#description = ""
categories = [
    "Web"
]
tags = [
    "Nginx",
]
image = "100.png"
+++


    #############################################################################
    
    Location可以有以下几种形式 :
    
    	=		精确匹配
    	
    	～		正则匹配,大小写敏感
    	
    	～*		正则匹配, 大小写不敏感
    	
    	^~		忽略正则表达式的前缀匹配
    	
    			没有修饰符,前缀匹配
    	
    	@		命名location,可用来做内部重定向
    	
    	其中=和^~修饰符都可以認為是特殊形式的前缀匹配
    
    #############################################################################
    
    location{
    
    default_type text/html ;	# return 輸出為文字
    
    }
    
    #############################################################################
    
    Location Example * :
    
        server {
            listen 80 default_server;
            server_name _;
            # A
            location = / {
                    return 200 "A";
            }
    
            # B
            location / {
                    return 200 "B";
            }
    
            # C
            location /docs {
                    return 200 "C";
            }
    
            # D
            location ^~ /imgs {
                    return 200 "D";
            }
            
            # E
            location ~* \.(gif|jpg|png)$ {
                    return 200 "E";
            }
    
            # F
            location ~ /a/.*$ {
                    return 200 "F";
            }
        }
    
    #############################################################################
    
    	input		      		output			说明
    
    	http://127.0.0.1		      A		匹配到A跟B,精确匹配优先级较高
    
    	http://127.0.0.1/test		  B		只匹配到B
    
    	http://127.0.0.1/docs/1		  C		匹配到B跟C,C前缀比B长
    
    	http://127.0.0.1/docs/2.jpg	  E		匹配到B、C、E，正则匹配比普通前缀匹配优先级高
    
    	http://127.0.0.1/imgs/1		  D		只匹配到B、D,D前缀比B长
    
    	http://127.0.0.1/imgs/1.jpg	  D		匹配到B、D、E，由于D是最长匹配且有^~修饰符，
    							            所以不会再检查正则匹配
    	
    	http://127.0.0.1/docs/a/1	  F		匹配到B、C、F
    	
    #############################################################################
    
    	Location @name的用法
    
      @前缀可以用来定义一个命名的location,该location不处理正常的外部请求,一般用来供内部重定向使用。
    
      它们不能嵌套,也不能包含嵌套的location。
    
    	Location Example *
    
    location /try {
        try_files $uri $uri/ @name;
    }
    
    location /error {
        error_page 404 = @name;
        return 404;
    }
    
    location @name {
        return 200 "@name";
    }
    
    # 这时访问/try或者/error都会返回"@name"



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
