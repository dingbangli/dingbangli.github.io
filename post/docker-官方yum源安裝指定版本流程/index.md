# Docker - 官方 yum 源安裝指定版本流程



{{< admonition >}}

 # 卸載舊版本
    
 ```sql
 
yum remove docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-selinux \
docker-engine-selinux \
docker-engine

```
```sql

rpm -qa |grep docker && docker -e --nodeps

```

{{< /admonition >}}

{{< admonition >}}
    
# 配置官方yum源

```sql

echo '[docker-ce-stable]
    name=Docker CE Stable - $basearch
    baseurl=https://download.docker.com/linux/centos/7/$basearch/stable
    enabled=1
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-stable-debuginfo]
    name=Docker CE Stable - Debuginfo $basearch
    baseurl=https://download.docker.com/linux/centos/7/debug-$basearch/stable
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-stable-source]
    name=Docker CE Stable - Sources
    baseurl=https://download.docker.com/linux/centos/7/source/stable
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-edge]
    name=Docker CE Edge - $basearch
    baseurl=https://download.docker.com/linux/centos/7/$basearch/edge
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-edge-debuginfo]
    name=Docker CE Edge - Debuginfo $basearch
    baseurl=https://download.docker.com/linux/centos/7/debug-$basearch/edge
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-edge-source]
    name=Docker CE Edge - Sources
    baseurl=https://download.docker.com/linux/centos/7/source/edge
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-test]
    name=Docker CE Test - $basearch
    baseurl=https://download.docker.com/linux/centos/7/$basearch/test
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-test-debuginfo]
    name=Docker CE Test - Debuginfo $basearch
    baseurl=https://download.docker.com/linux/centos/7/debug-$basearch/test
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-test-source]
    name=Docker CE Test - Sources
    baseurl=https://download.docker.com/linux/centos/7/source/test
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-nightly]
    name=Docker CE Nightly - $basearch
    baseurl=https://download.docker.com/linux/centos/7/$basearch/nightly
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-nightly-debuginfo]
    name=Docker CE Nightly - Debuginfo $basearch
    baseurl=https://download.docker.com/linux/centos/7/debug-$basearch/nightly
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg
    
    [docker-ce-nightly-source]
    name=Docker CE Nightly - Sources
    baseurl=https://download.docker.com/linux/centos/7/source/nightly
    enabled=0
    gpgcheck=1
    gpgkey=https://download.docker.com/linux/centos/gpg'>/etc/yum.repos.d/docker-ce.repo

```

{{< /admonition >}}


{{< admonition >}}

# 要啟用哪個版本的源就將其下的 enable 值設為 1，其餘設為 0
    
## 查看當前源的可用版本
    
```sql

yum list docker-ce --showduplicates|grep "^doc"|sort -r
  
yum list docker-ce-cli --showduplicates|grep "^doc"|sort -r

```

{{< /admonition >}}

{{< admonition >}}    
 
# 指定安裝 client 跟 server 一樣的版本 ( 不指定版本會自動安裝最新版 )

```sql

yum install docker-ce-20.10.2-3.el7 docker-ce-cli-20.10.2-3.el7 containerd.io

```

{{< /admonition >}}

{{< admonition >}}
    
# 查看版本
    
```sql

docker version

```
    
# 設置開機啟動
    
```sql

systemctl enable docker

```

{{< /admonition >}}

{{< admonition >}}

# **安裝 docker-compose**

```sql

yum list docker-compose-plugin --showduplicates|grep "^doc"|sort -r
    
yum install docker-compose-plugin-2.6.0-3.el7
    
ln -s /usr/libexec/docker/cli-plugins/docker-compose /usr/bin/docker-compose
    
docker-compose version

```
    
{{< /admonition >}}

    
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
> URL: https://laurance.eu.org/posts/docker-%E5%AE%98%E6%96%B9yum%E6%BA%90%E5%AE%89%E8%A3%9D%E6%8C%87%E5%AE%9A%E7%89%88%E6%9C%AC%E6%B5%81%E7%A8%8B/  

