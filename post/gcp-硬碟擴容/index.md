# GCP - 硬碟擴容


***
***
***

**在 GCP 上，點選硬盤，直接修改想要的硬盤大小 ( 只能擴大、不能縮小 )**
=====

`這邊測試將容量增加到 1.5T`

***
***
***
    
   ![](001.png)

***
***
***

{{< admonition example >}}

**後台增加完硬碟容量後,到機器使用指令 `lsblk` 看一下目前的硬碟空間**

***
    
**會發現從原本的 1.3T 變成 1.5T，但是用 `df -h`  卻沒看到空間增加**

{{< /admonition >}}

***
***
***

**擴大分割區**
=====

***
***

**以下是針對 sda 的第一個分割區擴大**
=====

***

**安裝 `growpart` 套件**

```sql
yum install cloud-utils-growpart
```

***

**使用 `growpart ` 命令擴容該分區**

```sql
growpart /dev/sda 2
```

***
***
***

{{< admonition example >}}
    
### *擴大檔案系統空間*  

### *如果是 `ext2` `ext3` `ext4` 的 file system，則用 `resize2fs`  ,  如果是 `xfs` 則用 `xfs_growfs`*

***


**`xfs` 檔案系統**

```sql
xfs_growfs /dev/sda2
```

***

**`ext4` 檔案系統**

```sql
resize2fs /dev/sda2
```    

{{< /admonition >}}

***
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
> URL: https://laurance.eu.org/posts/gcp-%E7%A1%AC%E7%A2%9F%E6%93%B4%E5%AE%B9/  

