+++
author = "Hugo Authors"
title = "Kubernetes-常見 kubectl 指令"
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

**取得所有 Pods 的資訊**

    kubectl get pods -o wide

**取得某 Pod 的詳細資料**

    kubectl describe pod <pod Name>

**修改 Pods 的資訊**

    kubectl edit pods -n <namespace> <pod Name>
    
**查看 Pods 事件**

    kubectl describe pod <pod Name>

**查看 Pods 日志文件**

    kubectl logs -f <pod Name>
    
**刪除這個 pod**

    kubectl delete -f pod-demo.yaml

**使用 yaml 創建 Pods**

    kubectl apply -f laurance-test.yaml
    
**進入 Pods 內部**

    kubectl exec -it <pod Name> /bin/bash
    
**查看各節點狀態**

    kubectl get node <node name>
    
**查看各節點事件**

    kubectl describe node <node name>
    
**查看系统 Kubelet 日志 1000行**

    journalctl -l -u kubelet -n 1000
    
**將 YAML 導出**

    kubectl get service <serviceName> -o yaml > backup.yaml

**檢查叢集狀態**

    kubectl get all


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
