# Kubernetes - Install kubectl on Linux by yum


<!--more-->
yum 官方安裝版本

***
***

**新增` yum `源**

```sql
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
```
    
***
***

**使用YUM安裝**

```sql
sudo yum install -y kubectl kubelet kubeadm
```

***
***
    
**開機啟動**
    
```sql
systemctl enable kubelet
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
> URL: https://laurance.eu.org/posts/kubernetes-install-kubectl-on-linux-by-yum/  

