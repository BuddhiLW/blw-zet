---
title: Maintaining KEG
description: What changes to expect from KEG behaviour
published: 2024-01-19
image: "./images/image-post-178.png"
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
image: "./images/image-post-178.png"
draft: false
---
```

This will be used to render a blog entry with `elm-pages`.

## Front Matter Importance

The most popular frameworks `Hugo`, `Gatsby` and `MkDocs` all accept `YAML` as the front matter for their posts. Some will handle `JSON`, `TOML`, and for the most obscure cases, things like `EDN` (in the case of `Cryogen`).

So, if you want to plug `KEG` into these engines, it must be able to handle the front matter; or at least ignore it.

## The v0.9.4 patch

And, that's what the **KEG's patch** `v0.9.4` does. It ignores, essentially, the front matter in a *KEG node*. And, everything will work as aspected (without a front matter section).

This is great for **retro-compatibility** purposes. You can still go without front matter; at the same time, you don't need to edit all your older KEG nodes to have front matter, to still be able to `edit`, generate `dex`, `grep`, operate on `titles` etc.

## Path forward

The idea is to also **auto-generate** this **front matter** for a new *KEG*. Including an image for out blog-post etc.

This will be **optional**. But, highly recommended. This behaviour will be able to be switched on and off.

