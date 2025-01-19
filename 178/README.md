---
title: Maintaining KEG
description: What changes to expect from KEG behaviour
published: 2024-01-19
image: ""
draft: false
---

# Free-style evolution to integrate with `elm-pages`

`KEG` **must** evolve to be readily available in blog-type websites. Mainly, it must conform to how many blog-generators work. Who knows if maybe we bring a **modular port**; easily extensible to many *standards*.

In `elm-pages`, we have what is called `front-matter` to the markdown that will be used to be rendered. It's a short section of meta-data, right above the first actual line of note, demilited by `---\n`.

For example, this note's `front-matter` is:

``` yaml
---
title: Maintaining KEG
description: What changes to expect from KEG behaviour
published: 2024-01-19
image: ""
draft: false
---
```


