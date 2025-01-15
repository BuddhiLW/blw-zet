---
title: "Vim formatting text"
description: 'The formatoptions variable is a variable that can be tweaked in **vim** An alias for it is `fo`. For example, if we want to format `.md` and `.txt` in a certain way, we can'
published: "2025-01-01"
image: "./images/image-post-./7.png"
draft: false
---

# Vim formatting text

`formatoptions` is a variable that can be tweaked in **vim**, in 
order to make files formatted. An alias for it is `fo`. 

For example, if we want to _automatically_ format `.md` and `.txt` 
in a certain way, we can use something like this in our `.vimrc`:

```vimrc
au BufEnter *.txt setl tx ts=4 sw=4 fo+=n2a
au BufEnter *.md setl tx ts=4 sw=4 fo+=n2a
au BufEnter *.md setl fo=aw2tq
```


## Resources
- https://vim.fandom.com/wiki/Automatic_formatting_of_paragraphs
- `? vim how to automatically break lines`
