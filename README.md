# This repository has been migrated to the self-hosted ari-web Forgejo instance: <https://git.ari.lt/ari/subby.vim>
# subby.vim

> inline buffer substitute in vim

# what does it do

exactly what the description says, _inline buffer substitute in vim_,
what it means is that if u type for example `\sh` and u have `let g:subby = {'sh': 'š'}`,
itll get automatically substituted with `š`

# why

bc im annoyed at manually typing lithuanian letters when i need to do my homework
so yh, enjoy ig lol

# installation

-   VimPlug :

```vim
Plug 'TruncatedDinosour/subby.vim'
```

# config

```vim
" the substitution map
let g:subby = {'sh': 'š'}

" the delimiter ( exactly 1 character )
let g:subby_delim = '\'
```

:) enjoy
