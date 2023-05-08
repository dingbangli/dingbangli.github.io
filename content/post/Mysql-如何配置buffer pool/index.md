+++
author = "Hugo Authors"
title = "Mysql-如何配置 buffer pool"
date = "2022-10-26"
#description = ""
categories = [
    "Database"
]
tags = [
    "MySQL",
]
image = "100.png"
+++

   **主要修改參數**
   
    innodb_buffer_pool_size
    
    默認大小為128M,健康比例為內存大小 50% (值越大,IO讀寫就越少,數據讀寫就越快)
    
    innodb_log_file_size
    
    一般取256M的倍數,並結合innodb_buffer_pool_size設置其大小 25%-50%
    
    innodb_log_buffer_size
    
    一般取16M的倍數
    
    innodb_buffer_pool_instances
    
    一般取innodb_buffer_pool_size的50% 效果最優
    
{{< highlight html >}}

EX: 跑兩套 mysqld_multi  本機記憶體:31798M (32G)

innodb_buffer_pool_size = 8G 
innodb_log_buffer_size = 32M
innodb_log_file_size = 1G
innodb_flush_log_at_trx_commit = 2
innodb_buffer_pool_instances = 6
#innodb_file_format=barracuda
#innodb_file_format_max=barracuda
innodb_file_per_table=1
    
{{< /highlight >}}

    配置完後,重啟服務生校
    
    進入mysql查看配置是否正確
    
{{< highlight html >}}

show variables where variable_name in ('innodb_buffer_pool_size', \
'innodb_buffer_pool_instances' ,\
'innodb_log_buffer_size' ,\
'innodb_log_file_size');

{{< /highlight >}}

    整理公式: ps. percent 必須 >= 95% 
    
    percent = innodb_buffer_pool_read_requests / (innodb_buffer_pool_reads + innodb_buffer_pool_read_requests) * 100%
    
    innodb_buffer_pool_pages_total = innodb_buffer_pool_size / innodb_page_size
    
    percent = innodb_buffer_pool_pages_data / innodb_buffer_pool_pages_total * 100%
    
    innodb_buffer_pool_size = innodb_buffer_pool_pages_data * innodb_page_size * 1.05 / (1024*1024*1024)
    
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
