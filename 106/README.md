---
title: "Useful Linux Info (Keystroke Singnals and it's meanings)"
description: "'Ctrl' only works at the beginning of a line, and has no effect if the program isn't reading input from the terminal. 'D' tells the shell that you weren't going to type any more commands, so it exited"
published: "2024-01-22"
image: "images/image-post-106.png"
draft: false
---

# Useful Linux Info (Keystroke Singnals and it's meanings)

"<kbd>Ctrl</kbd>+<kbd>D</kbd> (`^D`) means [end of file](http://en.wikipedia.org/wiki/Control-D#Meaning_in_Unix). It only works at the beginning of a line (I'm simplifying a little), and has no effect if the program isn't reading input from the terminal. In your experiment, `^D` told the shell that you weren't going to type any more commands, so it exited; then the terminal exited because its subprogram had terminated.

<kbd>Ctrl</kbd>+<kbd>C</kbd> (`^C`) means “interrupt”, i.e., stop what you're doing. Technically, pressing `^C` sends the [INT signal](http://en.wikipedia.org/wiki/SIGINT_%28POSIX%29), which by default terminates an application, but which in many programs means go back to the top level (e.g., in a shell, stop typing a command line and go back to a pristine prompt).

If a program doesn't respond to `^C`, you can try <kbd>Ctrl</kbd>+<kbd>\\</kbd> (`^\`). This sends the [QUIT signal](http://en.wikipedia.org/wiki/SIGQUIT), which by default terminates an application, and which not so many programs intercept.

Another key that sends a signal is <kbd>Ctrl</kbd>+<kbd>Z</kbd> (`^Z`). It sends the [TSTP signal](http://en.wikipedia.org/wiki/SIGTSTP), which pauses the program running in the foreground. (TSTP is short for “terminal stop”; it's similar to [STOP](http://en.wikipedia.org/wiki/SIGSTOP) but TSTP can be ignored whereas STOP cannot.) From the shell, you can resume that program's execution with the `fg` command (resume in the foreground) or the `bg` command (resume in the background).

All of these keys can be changed with the [`stty`](http://en.wikipedia.org/wiki/Stty) command. Some programs, particularly full-screen programs that have key bindings, disable them."[^1]



## Resources
[^1]: https://superuser.com/questions/169051/whats-the-difference-between-c-and-d-for-unix-mac-os-x-terminal
