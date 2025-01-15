---
title: "Rice up"
description: "Rational. Create an abstract `dotfile-setter-up` **terminal-cli** facilitator."
published: "2024-07-25"
image: "images/image-post-139.png"
draft: false
---

# Rice up

Create an abstract `dotfile-setter-up` **terminal-cli** facilitator.

## Rational

What do I mean?

My dotfiles[^1] is a great example of a script-based rice, which facilitates enormously the process of going from a Vanilla Ubuntu install, to my current system.

It has two things:
- Collection of scripts to install the base programs (essentials). Which can be called with one command.
- Collection of scripts to install non-critical programs. Gimp, Discord, Lazywal, Chess engines etc. And, generally, built from source.

Wouldn't it be nice if I could setup variables through a `yaml` file. To be used in my scripts, like `$DOTFILES`.

Where I could setup where the `ppa-based dependencies` is listed. And, then download it?

A place where I can structure a step-by-step guide on a `main` process install.

Currently, done like this[^2]: 

``` bash
#!/usr/bin/bash
export DOTFILES=$(pwd)
DOTFILES=$(pwd)

ln -sf $DOTFILES/.bashrc $HOME/.bashrc
rm -rf $DOTFILES/gitthings
SC="$DOTFILES/scripts/"
cd $SC
bash ./setup/bk-dots
bash ./setup/init
bash ./scripts/setup/link-config

source $HOME/.bashrc

##  `bash $DOTFILES/scripts/install/main`.
bash ./install/main
# make newly installed fonts available
fc-cache -vf

# Install the window manager
bash ./setup/xmonad
bash ./install/xmonad

echo "Congrats. If everything went well, you have the newest Buddhi WM installed."
echo "New step, you can logout from your current Ubuntu session, and chose XMonad,"
echo "instead of GNOME Window Manager. This choice is generally done at the login"
echo "interface."
```

Meaning of: `bash $DOTFILES/scripts/install/main`[^3].
``` bash
#!/usr/bin/bash
INSTALL=$DOTFILES/scripts/install
mkdir $DOTFILES/gitthings

bash $INSTALL/make-deps
bash $INSTALL/install-deps
bash $INSTALL/go
bash $INSTALL/st
bash $INSTALL/doom
bash $INSTALL/ble
bash $INSTALL/anaconda
bash $INSTALL/pywal
bash $INSTALL/pomodoro
bash $INSTALL/keg
bash $INSTALL/libxft-bgra
bash $INSTALL/joypixels
bash $INSTALL/mongo
```

Finally, a way to do `<command> install <x> <y> <z>` and install the programs listed and autocompleted, from the non-essential softwares that are built from source?

Currently, I have to call `bash $DOTFILES/scripts/install/<x>`. Which is not so bad. But, not ideal.

## Naming

arara: the bird group also known as `macaws`.


## References
[^1]: [https://github.com/BuddhiLW/dotfiles](https://github.com/BuddhiLW/dotfiles)
[^2]: [https://github.com/BuddhiLW/dotfiles/blob/ubuntu-xmonad/main.sh](https://github.com/BuddhiLW/dotfiles/blob/ubuntu-xmonad/main.sh)
[^3]: [https://github.com/BuddhiLW/dotfiles/blob/ubuntu-xmonad/scripts/install/main](https://github.com/BuddhiLW/dotfiles/blob/ubuntu-xmonad/scripts/install/main)
