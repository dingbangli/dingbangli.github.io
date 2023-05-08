+++
author = "Hugo Authors"
title = "Kubernetes-常見 minikube 指令"
date = "2022-10-10"
#description = ""
categories = [
    "Kubernetes"
]
tags = [
    "Kubernetes",
]
image = "100.png"
+++

**插件列表**

    minikube addons list

**插件啟用**

    minikube addons enable ADDON_NAME

**插件禁用**

    minikube addons disable ADDON_NAME
    
**不使用任何驅動開啟集群**

    minikube start --driver=none

**停止集群**

    minikube stop
    
**删除集群**

    minikube delete

**不影响已部署应用情况下暂停 Kubernetes**

    minikube pause
    
**取消暂停的instance**

    minikube unpause
    
**增加默认内存限制（需重启）**

    minikube config set memory 16384
    
**各節點操作**

    minikube node [add|start|stop|delete|list]
    
---------------------------------------------------------------------

**額外啟動參數**

    --image-mirror-country=cn # 镜像所在国家
    
    --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers # 镜像仓库地址
    
    --cpus=2 # 设置minikube虚拟机分配CPU核数
    
    --memory=2000mb # 设置minikube虚拟机分配内存
    
    --kubernetes-version=version # 使用的kubernetes版本
    
    --docker-env http_proxy=http://IP:7890 http_proxy=https://IP:7890 # minikube虚拟机内部docker使用代理地址
    
    # 指定驱动
    
    --vm-driver=none 在主机上运行Kubernetes组件，而不是在VM中,该方式驱动依赖Docker
    
    --vm-driver=virtualbox 表示用虚拟机,默认
    
**PS. 不通过--vm-driver=none参数启动，则创建的Pod、Service均不能通过外网访问，只能minikube ssh 进入集群访问操作**

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
