+++
author = "Hugo Authors"
title = "Kubernetes-ERROR-unable to create new content is being terminated"
date = "2022-10-12"
description = "Namespace-kubernetes-dashboard 一直卡在 termnating，所以導致無法有效刪除."
categories = [
    "Kubernetes"
]
tags = [
    "Kubernetes",
]
image = "100.png"
+++

**查看 namespace**

    kubectl get ns
    
   ![](00001.png)
   
**查看 kubernetes-dashboard 的 namespace**

    kubectl get ns kubernetes-dashboard  -o json > kubernetes-dashboard.json
    
**編輯 kubernetes-dashboard.json 檔**

    vim kubernetes-dashboard.json
    
**刪除前**

   ![](00002.png)
   
**刪除後**

   ![](00003.png)
   
**重新掛起 Proxy**

    kubectl proxy --address='0.0.0.0' &
    
**curl刪除**

    curl -k -H "Content-Type:application/json" -X PUT --data-binary @kubernetes-dashboard.json http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/finalize
    
**kubernetes-dashboard 已刪除**

   ![](00005.png)

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
