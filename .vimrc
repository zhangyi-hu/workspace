syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
"set autoindent
set smartindent
set viminfo='20,<1000
set hls

execute pathogen#infect()

"for merlin
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

"for ocp-indent
set rtp^="/Users/ahu/.opam/system/share/ocp-indent/vim"
