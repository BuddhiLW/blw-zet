---
title: "Multiple requests `day8.re-frame/http-fx`"
description: 'You can also pass a list or vector of these options maps where multiple HTTPs are required. To make multiple requests is simples, you supply a vector for `:http-xhrio`[^1].'
published: "2023-05-11"
image: "./images/image-post-53.png"
draft: false
---

# Multiple requests `day8.re-frame/http-fx`

To make multiple requests is simples, you supply a vector for `:http-xhrio`[^1].

```quote
You can also pass a list or vector of these options maps where multiple HTTPs are required.

To make multiple requests, supply a vector of options maps:
```

```clj
{:http-xhrio [ {...}
               {...}]}
```


## Resources
[^1]: [https://cljdoc.org/d/day8.re-frame/http-fx/0.2.4/doc/readme](https://cljdoc.org/d/day8.re-frame/http-fx/0.2.4/doc/readme)

