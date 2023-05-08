# XenServer - 如何擴充 root 磁區


***
***

**Citrix XenCenter (Client)**
=====

***
***

**進入 xencenter 增加該機器硬碟容量**
-----

***
***

**選擇要增加硬碟容量的機器,找到 `storage` 選單**

***

**選擇該磁區 `/dev/xvda` 右鍵點選 `Add...`**

***

**填入要新增的容量,並按 `add`**

***
***

**進入該台機器分配磁區**
-----

***
***

**查看各區硬碟**

```sql
df -h
```

***

**查看總硬碟有無新增 `30G`**

```sql
fdisk -l
```

***

**檢視已經存在的pv（物理卷）**

```sql
pvdisplay
```

***

**檢視當前已經存在的vg（邏輯卷組）**

```sql
vgdisplay
```

***

**檢視已經存在的lv（邏輯卷）**

```sql
lvdisplay
```

***

**把/dev/xvdb加入與/目錄相同的vg（邏輯卷組）**

```sql
vgextend centos /dev/xvdb
```

***

**擴容lv（邏輯卷）**

```sql
lvextend -L +30.0GB -n /dev/mapper/centos-root
```

***

**使其生效**

```sql
xfs_growfs /dev/mapper/centos-root 
```

***

**再次查看磁區已新增**

```sql
df -h
```

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
> URL: https://laurance.eu.org/posts/xen-%E6%93%B4%E5%85%85root%E7%A3%81%E5%8D%80/  

