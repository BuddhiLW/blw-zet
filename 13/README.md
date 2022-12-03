# Vim plugin for snippets

As I use vanilla vim, in general. I won't use `package managers` to install my 
plugin dependencies. Instead I will clone them locally.

So, in this case, following the tutorial[^1], this should be in your `vimrc`:
```vimrc
let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"
```

And, the packages will be downloaded to `.vim/plugin/`:
```sh
mkdir -p ~/.vim/pack/bundle/start && cd $_
git clone https://github.com/SirVer/ultisnips.git
git clone https://github.com/honza/vim-snippets.git
```

That's it. Use `<tab>` to call the snippets. Be happy.


## Resource
[^1]: https://bhupesh.me/learn-how-to-use-code-snippets-vim-cowboy/
