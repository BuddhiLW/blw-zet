---
title: "Creation of a bootstraping/ricing system"
description: 'I would like to support to **OS** versions for my system, `Ubuntu` and `Guix. Currently, my dotfiles supports Ubuntu[^1].Since the bootstrapping is done with `bash` scripts,'
published: "2025-01-01"
image: "./images/image-post-./67.png"
draft: false
---

# Creation of a bootstraping/ricing system

I would like to support to **OS** versions for my system, `Ubuntu` and `Guix`. Currently, my dotfiles supports Ubuntu[^1].

Since the bootstrapping is done with `bash` scripts, I though to put a environment variable to switch behaviour of installation. Instead of writing duplicated code, or files.

In `dotfiles/main.sh`,

```shell
#/usr/bin/bash
UBUNTU=${uname-a | grep "Ubuntu"}
```

And, for example, to `make-deps` out of a text-file with comments, we have:

```shell
#!/usr/bin/bash
SH=$DOTFILES/scripts/install
DEPS=$DOTFILES/deps

if [ -n "$UBUNTU" ]; then
    bash $SH/read-deps $DEPS/dependencie-scratch.txt >$DEPS/dep-out.txt
else
    bash $SH/read-deps $DEPS/dependencie-scratch-guix.txt >$DEPS/dep-out-guix.txt
fi
```

In which, `$SH/read-deps` is an script to discard lines beginning with `#`-signs of a `.txt` file.

Note how we make use of `$UBUNTU`.

That's the idea to translate a system to another. Furthermore, for the non-standard packages (programs dependent of source code that were altered to a personal degree, e.g., `st`, `xmonad`, etc.) there will be `.scm` files under `dotfiles/chanelio/` in order to build it.

## References:
[^1]: [https://github.com/BuddhiLW/dotfiles](https://github.com/BuddhiLW/dotfiles)
