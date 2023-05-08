+++
author = "Hugo Authors"
title = "Docker-建立telegraf"
date = "2022-08-03"
#description = ""
categories = [
    "Docker"
]
tags = [
    "telegraf",
]
image = "100.png"
+++



    [prometheus]
    
    docker run -d -p 9090:9090 \
      -v /root/docker-service/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
      --name prometheus \
      --net=host \
      prom/prometheus



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
