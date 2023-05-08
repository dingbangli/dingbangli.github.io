# Kubernetes - 常見 minikube 指令


**插件列表**

```sql
minikube addons list
```

**插件啟用**

```sql
minikube addons enable ADDON_NAME
```

**插件禁用**

```sql
minikube addons disable ADDON_NAME
```
    
**不使用任何驅動開啟集群**

```sql
minikube start --driver=none
```

**停止集群**

```sql
minikube stop
```
    
**删除集群**

```sql
minikube delete
```

**不影响已部署应用情况下暂停 Kubernetes**

```sql
minikube pause
```
    
**取消暂停的instance**

```sql
minikube unpause
```
    
**增加默认内存限制（需重启）**

```sql
minikube config set memory 16384
```
    
**各節點操作**

```sql
minikube node [add|start|stop|delete|list]
```
    
---------------------------------------------------------------------

**額外啟動參數**
=====

镜像所在国家
---

```sql
--image-mirror-country=cn 
``` 

镜像仓库地址
---
   
```sql
--image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers
```

设置minikube虚拟机分配CPU核数
---
    
```sql
--cpus=2
```

设置minikube虚拟机分配内存
---
    
```sql
--memory=2000mb
```

使用的kubernetes版本
---    

```sql
--kubernetes-version=version
```

minikube虚拟机内部docker使用代理地址
---
    
```sql
--docker-env http_proxy=http://IP:7890 http_proxy=https://IP:7890
```
    
指定驱动
=====

在主机上运行Kubernetes组件，而不是在VM中,该方式驱动依赖Docker
---
    
```sql
--vm-driver=none
```

表示用虚拟机,默认
---
    
```sql
--vm-driver=virtualbox
```
    
`**PS. 不通过--vm-driver=none参数启动，则创建的Pod、Service均不能通过外网访问**`

`**只能minikube ssh 进入集群访问操作**`

[參考文獻](https://juejin.cn/post/7081256561280024606)


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
> URL: https://laurance.eu.org/posts/kubernetes-%E5%B8%B8%E8%A6%8B-minikube-%E6%8C%87%E4%BB%A4/  

