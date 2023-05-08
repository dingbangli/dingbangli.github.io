# XenServer - 透過虛擬機做 NFS-Server & 製作 xencenter 映像檔


***
***

**建立 nfs-server**
-----

***
***

**安裝 nfs 依賴**

```sql
yum -y install nfs-utils nfs-utils-lib
```

***
***

**建立要做 `nfs-server` 的目錄,並給予`權限`**

```sql
mkdir -p /data2/nfs

chmod 777 /data2/nfs
```

***
***

**允許 `172.16.0.0/16` 網段的機器掛載 `/data2/nfs`**

```sql
echo ‘data2/nfs 172.16.0.0/24(rw,sync,no_root_squash,no_all_squash)’ >> /etc/exports

service nfs start
```

***
***

**製作 174 的 `xva 映像檔`**
-----

***
***

**使用 `XenServer–170` 匯出 174 的 `xva映像檔`**
    
```sql
mkdir -p /data2/export

mount -t nfs 172.16.0.222:/data2/nfs /data2/export
    
xe vm-list name-label=174	(查看174的uuid)
    
xe vm-export filename=/data2/export/174.xva vm=8fa16dde-c06d-726c-56da-c0fe47cf3d06	(使用174的uuid 製作映像檔)
```

***
***

**將 `xva映像檔` 匯入 `新建的機器 XenServer–180`**

```sql
mkdir -p /data2/export

mount -t nfs 172.16.0.222:/data2/nfs /data2/export
    
xe vm-import filename=/data2/export/174.xva
```

***
***
    
**匯入完成之後在 XenServer–180 底下會自動生成該 instance**

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
> URL: https://laurance.eu.org/posts/xen-%E9%80%8F%E9%81%8E%E8%99%9B%E6%93%AC%E6%A9%9F%E5%81%9Anfs-server/  

