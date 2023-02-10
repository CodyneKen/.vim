" PUT IN $HOME and make hidden .vimrc
" to open terminal in new window : <term_com> && detach (remplacer <term_com> par xfce4-terminal, ou la commande de terminal au choix )
"
" MEMO : zf% to create fold, then zo to open, zc to close
" :%s/\<foo\>/bar/gc
" to select whole function : V$%

source ~/.vim/autoload/plug.vim

" Put all swap files in .vim/swap for organization purposes
set directory^=$HOME/.vim/swap//

" Allows to display pdf, more or less doesnt work
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt-csw78

" leader is space
nnoremap <SPACE> <Nop>
" ATTENTION : leader mapping shortcuts are only actualized when new vim
" window is open (:so $MYVIMRC doesnt allow to test)
let mapleader ="\<Space>"
set showcmd

" lets H and L switch betweens tabs
nnoremap H gT
nnoremap L gt

" activates mouses control
set mouse=a

" hybrid number lines
set number relativenumber

" autoindents code :
filetype indent on
" set autoindent
set smartindent
" set cindent
" set indexexpr=
autocmd BufRead,BufWritePre *.sh normal gg=G

" sets tab to n white spaces
set expandtab
set shiftwidth=4

"REPMO (no plugin)
" map a motion and its reverse motion:
:noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
:noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

" if you like `:noremap j gj', you can keep that:
:map <expr> j repmo#Key('gj', 'gk')|sunmap j
:map <expr> k repmo#Key('gk', 'gj')|sunmap k

" repeat the last [count]motion or the last zap-key:
:map <expr> ; repmo#LastKey(';')|sunmap ;
:map <expr> , repmo#LastRevKey(',')|sunmap ,

" add these mappings when repeating with `;' or `,':
:noremap <expr> f repmo#ZapKey('f')|sunmap f
:noremap <expr> F repmo#ZapKey('F')|sunmap F
:noremap <expr> t repmo#ZapKey('t')|sunmap t
:noremap <expr> T repmo#ZapKey('T')|sunmap T
" END REPMO


" COC remap completion
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" END COC



" config necessary for vimtex
" idk dude : filetype-plugin-on
set encoding=utf-8

call plug#begin('~/.vim/plugged')
" https://github.com/junegunn/vim-plug/wiki/tutorial

" VIMTEX with Gilles Castel config (https://castel.dev/)
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

" Comment in & out easily, supports plenty of file types
Plug 'tpope/vim-commentary'

" CoqIDE in vim
Plug 'whonore/Coqtail'

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nerdtree for displaying file hierarchy
  Plug 'preservim/nerdtree'
  :noremap <Leader>t :NERDTree<cr>

" for nodejs management
" https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04
call plug#end()
