set history=500
filetype plugin on
filetype indent on
set autoread

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>
map <silent> <leader><cr> :noh<cr>


set so=7
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=2
set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" search
set ignorecase
set smartcase
set hlsearch
set incsearch 


set showmatch 
set mat=2

" shut it up
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" look
syntax enable
colorscheme desert
set background=dark
if has("gui_running")
    set guioptions-=T
"    set guioptions+=e
"    set t_Co=256
    set guitablabel=%M\ %t

    "FD Maximize window
    set guiheadroom=0
    set lines=999 columns=999
endif


set encoding=utf8
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set noexpandtab
set smarttab
set shiftwidth=8
set tabstop=8
set lbr
set tw=500
set noai "Auto indent
set nosi "Smart indent
set wrap "Wrap lines


map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ Col:\ %c

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

""""""""""""""""""""""""""""""""
"""" FD utility for plugins """"
""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

"""""""""""""""""""""""""""""""""""
"""" FD my personnal shortcuts """"
"""""""""""""""""""""""""""""""""""

set mouse=a
set browsedir=buffer
set noautochdir " Do not change directory, this breaks ctags
map <C-s> :w<cr>
map <C-b> :make -j4<cr>
map Q :bn<cr>
map T gt
map <S-F2> :!ctags -R .<cr>
map <F2> <C-]>
map <F1> :TlistOpen<cr>

" Spaces and tabs
highlight fdTabs          ctermbg=0 guibg=grey30
highlight fdExtraSpaces   ctermbg=red guibg=red
autocmd BufWinEnter * match  fdTabs           /\t/
autocmd BufWinEnter * 2match fdExtraSpaces    /\s\+$/

" Mark column 80
highlight ColorColumn ctermbg=0 guibg=grey30
set colorcolumn=80

func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)

func GitGrepWord()
  normal! "zyiw
  call GitGrep('-w -e ', getreg('z'))
endf
map <leader>g :call GitGrepWord()<CR>


