# Chinese and programming

Learning Chinese, or any other language, can be greatly facilitated using 
technology. One of these, I crafted using `bash` and `crow`. 

So, to learn how to pronounce a given word or phrase in Chinese, I can issue 
to bash:

```sh
crow -u 参加 -s zh-CN
```

That not only will give me the intonation of the syllables, but also 
information about it's meaning.

```txt
参加
(Cānjiā)

[ Chinese (Simplified) -> English ]

join

参加 - translation options:
adjective
        acceding: 参加

verb
        participate: 参加, 参与, 加入, 参, 插足, 厕
        join: 加入, 连接, 参加, 联合, 接合, 联结
        take part: 参加, 参, 插手, 插, 插身, 与
        partake: 参加, 分享, 参
        go in: 进入, 参加, 进, 搞
        stand in: 参加, 帮忙, 帮助, 济, 援助, 支援
```

To speed up the process, we generalize the command, with name `zh-pron` 
(zh-pronouce).

```sh
#!/usr/bin/bash
crow -u "$@" -s zh-CN
```

meaning,
```sh
zh-pron 参加
```

translates to the previous command
```sh
crow -u 参加 -s zh-CN
```

We can even use a bash alias, to speed up even more, but make the command 
more forgettable, like alias `zh-pron` to `zp`.

In `.bashrc`,
```sh
alias zp="zh-pron"
```
