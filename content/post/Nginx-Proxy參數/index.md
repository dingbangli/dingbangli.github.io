+++
author = "Hugo Authors"
title = "Nginx-proxy常用配置"
date = "2022-11-17"
#description = ""
categories = [
    "Web"
]
tags = [
    "Nginx",
]
image = "100.png"
+++



    server
      {
        listen       80;
        server_name aaa.abc.com;
    
          location  /
        {
    
    
          proxy_set_header X-Real-IP $remote_addr;						# 定義header記錄使用者真实IP
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;	                # 讓後端的Web伺服器可以取得使用者真實IP
          proxy_redirect off;								# 重新定向url-OFF
          proxy_http_version 1.1;								# 默认http版本为1.0,开启对http1.1支持
          proxy_pass http://127.0.0.1:3001;
          proxy_set_header X_FORWARDED_HOST $host;						# 客戶端調用服務端所使用的 host-ip
          #proxy_set_header X_FORWARDED_PORT 90;						# 用於連接到負載均衡器的端口號
          proxy_set_header Host $http_host;							# 反向代理後標頭為HOST原始字段
          proxy_ignore_client_abort on;							# 默認是關閉的，即請求過程中如果客戶端主動關閉請求或者客戶端網絡斷掉，那麼Nginx會記錄499 
          proxy_read_timeout 300;								# 定義一個nginx等待real server響應數據的超時時間
    
          proxy_ignore_headers "Cache-Control";						#忽略被代理伺服器設定的"Cache-Control"頭資訊
          add_header X-Cache "$upstream_cache_status from $server_addr"; #顯示緩存是否命中
          add_header    Cache-Control  max-age=60;					        # 客戶端本地的緩存，在配置的生存時間內的，客戶端可以直接使用
          proxy_cache_valid  304 1m;							# 對響應狀態碼為304的響應快取1m
          #proxy_cache_valid  301 302 1m;
          proxy_cache two;
          #proxy_cache_valid any 1m;
          proxy_cache_key $host$uri$is_args$args;						# 每筆快取儲存的鍵值方式
        }
        access_log  logs/aaa.abc.acc  access;
      }


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
