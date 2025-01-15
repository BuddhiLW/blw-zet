---
title: "'Solving' `tmux` using the `/bin/sh`"
description: "First off, you want tmux to be set to `/bin/bash. Then, if you're using bash, probably you want your `.bashrc` to be used as default. So, just put the following"
published: "2023-03-05"
image: "./images/image-post-24.png"
draft: false
---

# "Solving" `tmux` using the `/bin/sh`

First off, you want `tmux` to be set to 
`/bin/bash`. And, then you will tell me "well, 
[insert insult slur e.g., dumb fuck], that's 
exactly (and only) what we want". And, you 
would be wrong[1].

So, put `set-option -g default-shell $SHELL` in 
your config[2]. 

But then, if you're using bash, probably you 
want your `.bashrc` to be used in you bash 
sessions inside tmux, as default - of course, 
who wouldn't?. So, just put the following line 
to your `.bash_profile`, `. ~/.bashrc`.

That's it, now. Be happy. Merry Hacking!

## Resources
[1]: 
https://stackoverflow.com/questions/9652126/bashrc-profile-is-not-loaded-on-new-tmux-session-or-window-why
[2]:  
https://superuser.com/questions/1207463/tmux-doesnt-use-default-shell

