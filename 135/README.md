# Pywal with Kitty terminal

At `~/.config/kitty/kitty.conf`, you can add `include ~/.cache/wal/colors-kitty.conf` this line.

This cached scheme can be automatically generated if you add a template in wal, like so:

`vim ~/.config/wal/templates/colors-kitty.config`

Insert:

```
active_tab_foreground     {background}
active_tab_background     {foreground}
inactive_tab_foreground   {foreground}
inactive_tab_background   {background}

active_border_color   {foreground}
inactive_border_color {background}
bell_border_color     {color1}

color0       {color0}
color8       {color8}
color1       {color1}
color9       {color9}
color2       {color2}
color10      {color10}
color3       {color3}
color11      {color11}
color4       {color4}
color12      {color12}
color5       {color5}
color13      {color13}
color6       {color6}
color14      {color14}
color7       {color7}
color15      {color15}
```

That's it! Happy hacking.
