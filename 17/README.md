---
title: "Input-method in the terminal - tmux"
description: 'vimim.vim(2) “点石成金”）“ 牳”  安装：(1)'
published: "2023-03-05"
image: "./images/image-post-17.png"
draft: false
---

# Input-method in the terminal - tmux

https://github.com/ki-chi/tmux-inputmethod
install details
　　　　
【操作示范】
　　　
体验“点石成金”（英文字母为“石”，中文汉字为“金”）
　　　　
　安装：
　　　　(1)　下载插件　vimim.vim
　　　　(2)　把插件扔到vim的plugin文件夹里面
　彩蛋：
　　　　(1)　进入vim, 进入插入模式
　　　　(2)　输入彩蛋　vimim
　　　　(3)　按 CTRL-^，显示菜单
　　　　(4)　按 h，切换菜单左右排列
　　　　(5)　按 j， 下移光标　
　　　　(6)　按 k，上移光标　
　　　　(7)　按 l， 切换菜单上下排列
　　　　(8)　按 CTRL-^，输出菜单
　输入：
　　　　(1)　进入vim, 进入插入模式
　　　　(2)　输入 dscj
　　　　(3)　按 CTRL-^
　　　　(4)　验证：“点石成金”出现在菜单　
　搜索：
　　　　(1)　进入vim
　　　　(2)　输入 /dscj 回车
　　　　(3)　按 n
　　　　(4)　验证：“点石成金”四个字被搜索
　　　　
　　　　
体验“彩云飘飘”（多种云输入）
　　　　　　　　　　　
　安装：
　　　　(1)　下载插件　vimim.vim
　　　　(2)　(Windows) 安装 Python2或Python3 或wget或curl
　彩蛋：
　　　　(1)　进入vim, 进入插入模式
　　　　(2)　输入彩蛋　dscj''''
　　　　(3)　按 CTRL-^，显示四朵云输入结果　
　　　　(4)　按 CTRL-^，输出四朵云输入结果　
　输入：
　　　　(1)　进入vim, 进入插入模式
　　　　(2)　按 CTRL-_，进入谷歌云输入
　　　　(3)　按 CTRL-_，退出谷歌云输入 　　　　　
　　　　　　　
　　　　　　　　　　　　　　　
体验“输入法切换”（包括切换四种云输入）
　　　　　
　安装：
　　　　(1)　下载插件　vimim.vim
　　　　(2)　(option) 下载一个五笔文本文件，例如　vimim.wubi.txt
　　　　(3)　(option) 下载一个拼音文本文件，例如　vimim.pinyin.txt
　　　　(4)　把上述文件扔到vim的plugin文件夹里面　　　　　　
　玩法：
　　　　(1)　进入VimIM （插入模式：CTRL-_）（正常模式：gi）
　　　　(2)　按 CTRL-^，进入五笔输入
　　　　(3)　按 CTRL-^，进入拼音输入
　　　　(4)　按 CTRL-^，进入谷歌云输入
　　　　(5)　按 CTRL-^，进入搜狗云输入
　　　　(6)　按 CTRL-^，进入百度云输入
　　　　(7)　按 CTRL-^，进入ＱＱ云输入　
　　　　　
　　　
体验“海量词库”（百万词条，即插即用，想删就删）
　　　　　
　安装：
　　　　(1)　安装 Python2
　　　　(2)　下载47MB拼音数据库　vimim.gbk.bsddb
　　　　(3)　把插件和数据库扔到vim的plugin文件夹里面　
　玩法：
　　　　(1)　进入vim, 进入插入模式
　　　　(2)　按 CTRL-_，进入拼音输入
　　　　(3)　按 CTRL-_，退出拼音输入
　　　　　　　
　　　　　　　　　　　　　　　　　　　　　
体验“无菜单窗中文输入”（敲中文犹如敲英文）
　　　　　　　
　范例：
　　　　(1)　英文：She has ten dreams. （字母加空格：20键）
　　　　(2)　中文：她有十个梦。　　　  （字母加空格：22键）　　　　　　　　　　　　　　　　　　　　　　　
　玩法：
　　　　(1)　进入vim, 输入 gi
　　　　(2)　输入 ta　　按空格，按空格，出“她”
　　　　(3)　输入 you　 按空格，出“有”
　　　　(4)　输入 shige  按空格，按空格，按空格，出“十个”
　　　　(5)　输入 meng  按空格，出“梦”
　　　　(6)　输入　.　　按空格，出句号。 　　　　　　　　　　　　
　背景：　　　　　　　　　
　　　　(1) 候选窗：无菜单之菜单显示在窗口标题或者状态栏之上
　　　　(2) 数字键：选词：1 用于刷新 234567890 用于选词
　拼音：　　　　　　　　　
　　　　(1) 空格键：既可上字又可选词
　　　　(2) 回车键：取消无菜单选择状态 (stop active completion)
　五笔：　　　　　　　　　
　　　　(1) 空格键：上字（取消无菜单选择状态）或空格
　　　　(2) 打英文：建议在vimrc中设置 :set 
pastetoggle=<C-H>　　
