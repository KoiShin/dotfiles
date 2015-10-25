set encoding=utf-8
set whichwrap=b,s,h,l,[,],<,>

set number
set showmatch
set ruler
set nolist
set wrap
set display=lastline
set showcmd
" set title
set virtualedit=block

set laststatus=2
set cmdheight=2
set statusline=%<
set statusline+=%y
if winwidth(0) >= 130
	set statusline+=%F
else
	set statusline+=%t
endif
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=\
set statusline+=[%l/%L]
set statusline+=\
set statusline+=[%p%%]
set statusline+=\
set statusline+=%=
set statusline+=[HEX\%02.2B]
set statusline+=\
set statusline+=[ASCII=\%03.3b]
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}

set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set cindent
set noexpandtab
set backspace=indent,eol,start
set shiftwidth=4

set ignorecase
set smartcase
set wildmenu wildmode=list:longest,full
set history=100

colorscheme molokai
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
set t_Co=256
set cursorline

set mouse=a
set nostartofline
set autoread
set hidden
autocmd BufRead,BufNewFile *.md set filetype=markdown
set wildmenu wildmode=list:longest,full

inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-l> <RIGHT>
inoremap <C-d> <BS>
inoremap <C-c> <Esc>
inoremap <C-e> <Esc>
