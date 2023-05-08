# Kubernetes - 常見 kubectl 指令


**取得所有 Pods 的資訊**

```sql
kubectl get pods -o wide
```

**取得某 Pod 的詳細資料**

```sql
kubectl describe pod <pod Name>
```

**修改 Pods 的資訊**

```sql
kubectl edit pods -n <namespace> <pod Name>
```    

**查看 Pods 事件**

```sql
kubectl describe pod <pod Name>
```

**查看 Pods 日志文件**

```sql
kubectl logs -f <pod Name>
```    

**刪除這個 pod**

```sql
kubectl delete -f pod-demo.yaml
```

**使用 yaml 創建 Pods**

```sql
kubectl apply -f laurance-test.yaml
```
    
**進入 Pods 內部**

```sql
kubectl exec -it <pod Name> /bin/bash
```
    
**查看各節點狀態**

```sql
kubectl get node <node name>
```
    
**查看各節點事件**

```sql
kubectl describe node <node name>
```
    
**查看系统 Kubelet 日志 1000行**

```sql
journalctl -l -u kubelet -n 1000
```
    
**將 YAML 導出**

```sql
kubectl get service <serviceName> -o yaml > backup.yaml
```

**檢查叢集狀態**

```sql
kubectl get all
```


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
> URL: https://laurance.eu.org/posts/kubernetes-%E5%B8%B8%E8%A6%8B-kubectl-%E6%8C%87%E4%BB%A4/  

