# AWS - VPC 建置


<!--more-->
"紀錄一下建立 VPC 的流程"

{{< admonition >}}
# 1. 建立 VPC
{{< /admonition >}}

## 點選 Create VPC

   ![](101.png)
   
   ---
   
## 輸入名稱及網段 , 這邊設置為 172.25.0.0/16

   ![](102.png)
   
   ---
   
{{< admonition >}} 
# 2. 新增4個subnets (2個Public、2個private)  

# 用途:預防AZ出現故障無法切換
{{< /admonition >}}

## 點選 Create subnet 

   ![](103.png)
   
   ---
   
## 確認 CIDR 為目前設置網段 && 遮罩為 /16

   ![](104.png)
   
   ---
   
## 建立 public-a 為 172.25.1.0/24

   ![](105.png)
   
   ---
   
## 建立 public-c 為 172.25.2.0/24

   ![](106.png)
   
   ---
   
## 建立 private-a 為 172.25.3.0/24

   ![](107.png)
   
   ---
   
## 建立 private-c 為 172.25.4.0/24

   ![](108.png)
 
   ---

{{< admonition >}}
# 3. 新增Internet gateways，並將IGW掛上VPC
{{< /admonition >}}


## 新增Internet gateways (此步驟要先做完，才能新增 NAT GW)

   ![](109.png)
   
   ---
   
## 輸入名稱 > Create internet gateway

   ![](110.png)
   
   ---
   
## 選取剛剛建立的 internet gateway 右鍵點選 attach

   ![](111.png)
   
   ---
   
## 選擇剛剛建立好的 VPC

   ![](112.png)
   
   ---

{{< admonition >}}
# 4.新增NAT gateways，選擇Public subnet，並給一個外網IP
{{< /admonition >}}


## 新增 NAT Gateways

   ![](113.png)
   
   ---
   
## 設定名稱,subnet,Elastic IP 點選 Create

   ![](114.png)
   
   ---
   
{{< admonition >}}   
# 5.新增2個route table，1個叫igw、1個叫nat
{{< /admonition >}}

## 新增 route table

   ![](115.png)
   
   ---
   
## 建立1個 route for NAT gateway

   ![](116.png)
   
   ---
   
## 點選剛剛建立的 private-route-nat 設定 route 規則

   ![](117.png)
   
   ---
   
## 設定 NAT - route 目的為全通

   ![](118.png)
   
   ---
   
## 建立1個 route for Internet gateway

   ![](119.png)
   
   ---
   
## 點選剛剛建立的 public-route-igw 設定 route 規則

   ![](120.png)
   
   ---
   
## 設定 IGW - route 目的為全通
   
   ![](121.png)
   
   ---

{{< admonition >}}
# 6.subnets 套用route talbe，Public套用igw，private套用nat
{{< /admonition >}}

## 回到 subnet 選擇 public-a 點選設置 route table

   ![](122.png)
   
   ---
   
## public-a 套用 public-route-igw 規則

   ![](123.png)
   
   ---
   
## 回到 subnet 選擇 public-c 點選設置 route table

   ![](124.png)
   
   ---

## public-c 套用 public-route-igw 規則

   ![](125.png)
   
   ---
   
## 回到 subnet 選擇 pricate-a 點選設置 route table

   ![](126.png)
   
   ---

## private-a 套用 private-route-nat 規則

   ![](127.png)
   
   ---

## 回到 subnet 選擇 pricate-c 點選設置 route table

   ![](128.png)
   
   ---
   
## private-c 套用 private-route-nat 規則

   ![](129.png)
   
   ---
   
   
# VPC 設置完成 

---

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
> URL: https://laurance.eu.org/posts/aws-vpc-%E5%BB%BA%E7%BD%AE/  

