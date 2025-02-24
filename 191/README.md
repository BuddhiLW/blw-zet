---
title: "Python GLIBC annoyances"
description: '"importError: <path>/conda/envs/encryption/lib/python3.10.6: version GLIBCXX_3.4.32" not found. bashconda install -c cond'
published: "2025-02-07"
image: "./images/image-post-191.png"
draft: false
---

# Python GLIBC annoyances

Have you been faced with something like this?

```
ImportError: <path>/conda/envs/encryption/lib/python3.10/site-packages/numpy/_core/../../../../libstdc++.so.6: version GLIBCXX_3.4.32' not found
```

This may help:

``` bash
conda install -c conda-forge libstdcxx-ng
```

Good luck.
