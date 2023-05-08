+++
author = "Hugo Authors"
title = "Kubernetes-Ingress"
date = "2022-10-12"
description = "Ingress 簡單製作紀錄"
categories = [
    "Kubernetes"
]
tags = [
    "Kubernetes",
]
image = "100.png"
+++

**Docker file包製作**

    mkdir dockerfile/ && cd dockerfile/
    
    vim Dockerfile
    
{{< highlight html >}}

#/bin/bash
  
FROM nginx
ARG HTML
    
 #Change nginx config
RUN rm /usr/share/nginx/html/index.html
COPY ./$HTML /usr/share/nginx/html/index.html

{{< /highlight >}}

    vim green.html
    
{{< highlight html >}}
  
   <!DOCTYPE html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   </head>
   <body style="background-color: green; color:#fff">
     <h1>2022/10/12 ---Ingress-test</h1>
     <table>
         <tbody>
               <tr>
                   <td>Author</td>
                   <td>: Laurance</td>
               </tr>
               <tr>
                   <td>Article Link</td>
                   <td>: <a href="https://note.laurance.ml" target="_blank">2022/10/12 ---Ingress-test</a></td>
               </tr>
               <tr>
                   <td>Topic</td>
                   <td>: <a href="https://note.laurance.ml" target="_blank">2022/10/12 ---Ingress-test</a></td>
               </tr>
         </tbody>
     </table>
   </body>
   </html>

{{< /highlight >}}
   
    vim red.html
    
{{< highlight html >}}
  
   <!DOCTYPE html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   </head>
   <body style="background-color: red; color:#fff">
     <h1>2022/10/12 ---Ingress-test</h1>
     <table>
         <tbody>
               <tr>
                   <td>Author</td>
                   <td>: Laurance</td>
               </tr>
               <tr>
                   <td>Article Link</td>
                   <td>: <a href="https://note.laurance.ml" target="_blank">2022/10/12 ---Ingress-test</a></td>
               </tr>
               <tr>
                   <td>Topic</td>
                   <td>: <a href="https://note.laurance.ml" target="_blank">2022/10/12 ---Ingress-test</a></td>
               </tr>
         </tbody>
     </table>
   </body>
   </html>

{{< /highlight >}}
   
    使用 docker build 建立 image 

{{< highlight html >}}
    
   $ docker build --build-arg HTML=green.html -t laurance/green .
    
   $ docker build --build-arg HTML=red.html -t laurance/red .
   
{{< /highlight >}}
   
    更改 TAG 名稱為 docker 用戶名 / image 名稱

{{< highlight html >}}
   
   $ docker tag laurance/red ihatemis/red
    
   $ docker tag laurance/green ihatemis/green

{{< /highlight >}}
   
    上傳至 Docker hub ，需要先 docker login

{{< highlight html >}}
   
   $ docker push ihatemis/red:latest
    
   $ docker push ihatemis/green:latest

{{< /highlight >}}
   
  **Deplyment**
  
    vim ingress.deployment.yaml
 
 {{< highlight html >}}
   
   #apiVersion: extensions/v1beta1
   apiVersion: apps/v1
   kind: Deployment
   metadata:
       name: red-nginx
       namespace: simple2
   spec:
     selector:
       matchLabels:
         app: red-nginx
     replicas: 4
     template:
       metadata:
         labels:
           app: red-nginx
       spec:
         containers:
         - name: nginx
           image: ihatemis/red:latest
           ports:
           - containerPort: 80
---   
   #apiVersion: extensions/v1beta1
   apiVersion: apps/v1
   kind: Deployment
   metadata:
       name: green-nginx
       namespace: simple2
   spec:
     selector:
       matchLabels:
         app: green-nginx
     replicas: 2
     template:
       metadata:
         labels:
           app: green-nginx
       spec:
         containers:
         - name: nginx
           image: ihatemis/green:latest
           ports:
           - containerPort: 80

{{< /highlight >}}
   
    kubectl apply -f ingress.deployment.yaml 
   
   **service**
   
    vim ingress.service.yaml

{{< highlight html >}}
   
   apiVersion: v1
   kind: Service
   metadata:
     name: green-service
     namespace: simple2
   spec:
     type: NodePort
     selector:
       app: green-nginx
     ports:
       - protocol: TCP
         port: 80    
    ---
   apiVersion: v1
   kind: Service
   metadata:
     name: red-service
     namespace: simple2
   spec:
     type: NodePort
     selector:
       app: red-nginx
     ports:
       - protocol: TCP
         port: 80
 
{{< /highlight >}}
      
    kubectl apply -f ingress.service.yaml
    
   **Ingress**
   
    vim ingress.yaml

{{< highlight html >}}
   
   #apiVersion: extensions/v1beta1
   apiVersion: networking.k8s.io/v1
   kind: Ingress
   metadata:
     name: web
     namespace: simple2
     annotations:
       nginx.ingress.kubernetes.io/rewrite-target: /
   spec:
     rules:
     - host: green.ingress.com
       http:
         paths:
           - path: /
             pathType: Prefix
             backend:
               service:
                 name: green-service
                 port:
                   number: 80
     - host: red.ingress.com
       http:
         paths:
           - path: /
             pathType: Prefix
             backend:
               service:
                 name: red-service
                 port:
                   number: 80
  
{{< /highlight >}}      
   
    kubectl apply -f ingress.yaml 
    
   **將域名綁至 HOSTS**
   
    172.16.0.223 red.ingress.com green.ingress.com
   
   **訪問 http://red.ingress.com**
   
   ![](008.png)

   **訪問 http://green.ingress.com**

   ![](009.png)    

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
