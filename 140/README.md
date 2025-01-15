---
title: "Interesting commands Unix"
description: "rootlessk   26989    45423 - 0t0  TCP *:5432 (LISTEN) bashsudo lsof -i -P -n -n  | grep '5432'"
published: "2024-07-26"
image: "images/image-post-140.png"
draft: false
---

# Interesting commands Unix

``` bash
sudo lsof -i -P -n  | grep "5432"
```

```
rootlessk   26989           euler   13u  IPv4    45423      0t0  TCP *:5432 (LISTEN)
rootlessk   26989           euler   16u  IPv6    42362      0t0  TCP *:5432 (LISTEN)
```
