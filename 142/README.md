# The "Desktop" Debate

## Assumpion
The desktop debate arises from what OS (Operational System) has better usability.

## OSes and WM/DEs

Well, let's begin with that definition, and look forward into the underlying assumptions it make.

First off, each Operational System in independent in a degree from the OS. Kernels are protocols to control the hardware. It has nothing, in particular, to do with UIs (User Interfaces). That's the job of a WM/DE (Window Manager/Desktop Environment).

There is nothing that should prohibit one WM to run in another OS. In theory. But, actually, when a company takes hold of your machine with layers and layers of proprietary software and no introspection allowed in the mechanism of the system... Then, you are left off with what they stipulate and limit you to experience. 

## Degrees of Freedom

And, here's where the notion of Degrees of Freedom a system gives to you, may come into play. At some extent, you can customize your proprietary bundle. Maybe install another proprietary program to change it's looks. Wallpapers, bar colors, maybe even some range of fonts, etc.

## How Linux freedom looks like

But, you couldn't alter how windows interpret a key-binding. Or, the fundamentals of the rules of the key-bindings. For example, you wouldn't be able to bind it to repond to pressing `S-r`, or `S-p S-t S-t`. Just to give you an example.

You could easily do that using XMonad in it's source-code, like this:

```haskell
("M-p t t",   addName "Random Lazywallpaper"    $ spawn "random-lazywal")
```
And, pressing the sequence: `M-p t t` (`M`: is the "Windows-key", in this case) would promptly launch `random-lazywal`. 

Just for context: `random-laywal` is a script written to pick a random video in my "animated-wallpapers folder", and use `lazywal` to set it as background wallpaper. As well, as automatically set all my system's colors to match the palette of the background. My editor, my terminal and everything that connects to X server (which interacts with my kernel) could receive and refresh it's looks.

## WMs/DEs

Ok. Enough for that example. You may this is a stylish, futile utility. It won't matter in your productivity-focused lifestyle anyways etc. Well, let's get back at our first statement which gave us hints about what differences people see in OSes.

What I'm saying with that example is that, anyone, that uses any customizable WM/DE in Unix can also share these configurations to other users (that includes MacOS, which is compatible with many Linux-focused applications; my `lazywal` could be installed and called from MacOS).

This is so true, that if you go to **reddit**, you can't find a range of personal configurations people post in the **unixporn** thread. 

There will be tilling window managers, conventional desktops, Cinammon, Gnome, Wayland, Xmonad, DWM, and even some crazy ones like EXWM - which boots into Emacs, and works as a full-blown window-manager.

The variety is enormous. 

## DW/DE and OSes

What's even more shocking, there are a lot of Linux distributions out there, Arch, Artix, Debian, Gentoo, Void, PopOS!, and so many other ones.

And, they are all compatible with these WMs I just listed. You could Xmonad in Ubuntu, or Archlinux.

Why can't you use another WM, even if it's a past, or slightly tweaked Window's version? You have to buy it; software won't be compatible. And, the hurdles goes on and on.

Back to the many Linux Distributions, they even function differently. In Arch you can download OS updates, while you are using your computer, without any hurdles. There is no Blue Screen of Death awaiting you in your daily upgrades. Although, it will always be running the bleeding edge version of applications.

Now, again, why is that practically important? Well, fundamentally, the WM/DE is what dictate how you interact with your computer.

## Customizability 

Let's consider the difference among vehicles. How you navigate them is pretty apart, isn't it? One the controller down, goes up. And, one you have buttons, the other a driver-wheel, etc.

What if you could customize and make your own? Wouldn't you think it would be awesome to be able to make your computer behave the way you command it to do? The limit is your imagination and your ability to modify or write software. But, the fundamental thing is, different from building a customized engine, projecting it and fabricating it etc. doing that with software is comparatively cost-free.

Even if you disagree that that is not something desirable. Pure logic and the observation of economic behavior in our society would be enough to materially prove that is something valuable.

A Ferrari, or a Dodge would always be more expensive than a Ford Fox. Because one is exclusive; unique; customized; rare. Of course it may be more powerful too. Or it could be a reliquiae kind of thing.

By this standpoint, Linux overvalues Windows, and MacOS. Much more Windows than MacOS.

## Final thoughts

Finally, a difference that arise from this analogy is: the limit-number of "users" of that car. That is, in case of WM software and your daily tools[^1], if you wish, you may share it in open-source projects repositories, like GitHub in public mode.

And, even ship script programs to automatically install your reproducible environment, in a fresh machine.

That's two worlds of apart, in Degrees of Freedom, you have in your Linux system.

So, yeah, 
- Customisability (aesthetic), 
- User-level tailored usability (practical-use), 
- Freedom,
- Full use of your hardware,
- Ability to share programs, and ship it to other OS users,
- Active voice in your system's behavior, security etc,
- Awesome free configuration examples, for virtually any program,
- Easily share your unique WM experiences with others,
- It's free, as in, zero-cost of money.

It's a heavy choice, between that, and... well, it's ugly con:
- You have to learn constantly.
- Read documentations.
- Try out examples, experiment.
- Spend time learning about other programs.
- Be curious about "how this person did that?"

Not everyone can go unharmed through this cons. It gives scars of wisdom and insight about software. Awareness.

"The world, and mainly the professional world, doesn't require that from us, right? It's not practical. It's just the fantasy world of a nerd."

At least, I'm the father of my own creation. I will leave at that. 

## Footnote
[^1]: terminal, browser, music player, bars, digital clock animations, etc 
