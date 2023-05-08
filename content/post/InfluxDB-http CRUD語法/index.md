+++
author = "Hugo Authors"
title = "InfluxDB-http CRUD 語法"
date = "2023-03-23"
#description = ""
categories = [
    "Database"
]
tags = [
    "InfluxDB",
]
image = "100.jpg"
+++


#  `HTTP` API 


下面使用 GET 請求 `查詢 CPU` (帶 user : password)

```javascript
curl -G 'http://172.16.0.222:8086/query?pretty=true' --data-urlencode "db=telegraf" -u telegraf:telegraf --data-urlencode "q=SELECT * FROM "cpu" limit 1"

```

下面使用 POST 請求 `創建資料庫`

```javascript
curl -i -XPOST 'http://172.16.0.222:8086/query?pretty=true' -u laurance:telegraf --data-urlencode "q=CREATE DATABASE testdb"

```

    HTTP/1.1 200 OK
    Content-Type: application/json
    Request-Id: aeee08da-cc97-11ed-8be8-92b84f18e45a
    X-Influxdb-Build: OSS
    X-Influxdb-Version: 1.8.10
    X-Request-Id: aeee08da-cc97-11ed-8be8-92b84f18e45a
    Date: Mon, 27 Mar 2023 12:05:36 GMT
    Transfer-Encoding: chunked
    
    {
        "results": [
            {
                "statement_id": 0
            }
        ]
    }


下面使用 POST 請求 `將數據寫入 DB`

```javascript
curl -i -XPOST 'http://172.16.0.222:8086/write?db=testdb' -u laurance:kiwi888 --data-binary 'cpu_load_short,host=server01,region=us-west value=0.64 1434055562000000000'

```

    HTTP/1.1 204 No Content
    Content-Type: application/json
    Request-Id: 5dedeb7d-cc98-11ed-8cda-92b84f18e45a
    X-Influxdb-Build: OSS
    X-Influxdb-Version: 1.8.10
    X-Request-Id: 5dedeb7d-cc98-11ed-8cda-92b84f18e45a
    Date: Mon, 27 Mar 2023 12:10:30 GMT

下面使用 POST 請求 `將數據一起寫入 DB`

```javascript
curl -i -XPOST 'http://172.16.0.222:8086/write?db=testdb' -u laurance:kiwi888 --data-binary 'cpu_load_short,host=server01,region=us-west value=0.64 1434055562000000000
> cpu_load_short,host=server02,region=us-west value=0.55 1422568543702900257
> cpu_load_short,direction=in,host=server01,region=us-west value=2.0 1422568543702900257'

```

    HTTP/1.1 204 No Content
    Content-Type: application/json
    Request-Id: ccf012f8-cc98-11ed-8d78-92b84f18e45a
    X-Influxdb-Build: OSS
    X-Influxdb-Version: 1.8.10
    X-Request-Id: ccf012f8-cc98-11ed-8d78-92b84f18e45a
    Date: Mon, 27 Mar 2023 12:13:36 GMT
    

下面使用 POST 請求 `將文件 TXT 寫入 DB`

```javascript
curl -i -XPOST 'http://172.16.0.222:8086/write?db=testdb' -u laurance:kiwi888 --data-binary @influxdb.txt

```

    HTTP/1.1 204 No Content
    Content-Type: application/json
    Request-Id: 29a9ebda-cc99-11ed-8dfa-92b84f18e45a
    X-Influxdb-Build: OSS
    X-Influxdb-Version: 1.8.10
    X-Request-Id: 29a9ebda-cc99-11ed-8dfa-92b84f18e45a
    Date: Mon, 27 Mar 2023 12:16:11 GMT
    

|   返回代碼    |   說明  |
|   -----   |   -----   |
|   2xx |   如果你寫了數據後收到HTTP 204 No Content，說明寫入成功了！  |
|   4xx |   表示InfluxDB不知道你發的是什麼鬼。   |
|   5xx |   系統過載或是應用受損。 |



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
