# Kubernetes - install minikube on Linux


***
***

**PS:安装Minikube 之前需要先把docker安装好**

***
***

**依賴**

```sql
yum install conntrack
```

***
***

**[官方載點](https://minikube.sigs.k8s.io/docs/start/)**

```sql
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

***
***

**啟動集群**

```sql
minikube start --driver=none
```

***
***
    
**啟動時想要指定resource**

```sql
minikube start --cpus=4 --memory=4096
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
> URL: https://laurance.eu.org/posts/kubernetes-install-minikube-on-linux/  

