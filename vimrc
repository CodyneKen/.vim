" PUT IN $HOME and make hidden ".vimrc"

let mapleader =" "

" lets H and L switch betweens tabs
nnoremap H gT
nnoremap L gt

" activates mouses control
set mouse=a

" hybrid number lines
set number relativenumber


" autoindents code :
filetype indent on
set smartindent
set autoindent
autocmd BufRead,BufWritePre *.sh normal gg=G

" sets tab to 2 white spaces
set expandtab
set shiftwidth=2


nnoremap gcc I/* <ESC>A */<ESC>
" to select whole function : V$%
" :%s/\<foo\>/bar/gc

" config necessary for vimtex
" idk dude : filetype-plugin-on
set encoding=utf-8

call plug#begin()
" https://github.com/junegunn/vim-plug/wiki/tutorial



" VIMTEX with Gilles Castel config
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ULTISNIPS FOR SNIPPETS
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

call plug#end()
