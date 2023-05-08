# GCP - Google Cloud Monitoring by Grafana


{{< admonition >}}

# Grafana 系統搭配 GCP Monitoring 資訊做監控

{{< /admonition >}}

---

## GCP 設定

### {STEP 1} 啟用API服務 `Stackdriver Monitoring API`

***
***
***

 ![](302.png)

***
***
***

### {STEP 2} 啟用API服務 `Cloud Resource Manager API`

***
***
***

 ![](303.png)

***
***
***

### {STEP 3} 點選 `API和服務` 建立服務帳號憑證

***
***
***

 ![](304.png)

***
***
***

### {STEP 4} 設定`服務帳號名稱`及`設定該帳號權限`

***
***
***

  ![](305.png)
  ![](306.png)

***
***
***

### {STEP 5} 設定 `授權此帳號的使用者`

***
***
***

 ![](307.png)

***
***
***
 
### {STEP 6} 點選剛建立的監控服務帳號 monitor-grafana 並建立 `JSON 金鑰`

***
***
***

 ![](308.png)
 ![](309.png)

***
***
***
 
### {STEP 7} 添加監控權限 `For Monitor`

***
***
***

 ![](313.png)

***
***
***

#### 添加 `授權使用者`

***
***
***

 ![](314.png)

***
***
***

#### 新增主體: `剛建立的監控服務帳號 XXX.gmail`

#### 指派角色: `監控檢視者`

***
***
***

 ![](315.png)

***
***
***

{{< admonition >}}

# Grafana

{{< /admonition >}}

***
***
***

## {STEP 8} 新增 `Data source` 資料來源 `Google Cloud Monitoring`

***
***
***

 ![](310.png)
 ![](311.png)

***
***
***

## {STEP 9} 將 `STEP 6` 新增的 `JSON 金鑰` 上傳 && `Save & test`

***
***
***

## 選擇 `Google JWT File`

## 點選 `Upload service account key file`

***
***
***

 ![](312.png)
 ![](316.png)

***
***
***

### {STEP 10} 成果驗收

***
***
***

 ![](317.png)

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
> URL: https://laurance.eu.org/posts/gcp-google-cloud-monitoring-by-grafana/  

