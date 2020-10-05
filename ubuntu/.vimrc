" For Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'ycm-core/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'wakatime/vim-wakatime'
Plugin 'itchyny/lightline.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'Yggdroot/indentLine'
Bundle "lepture/vim-jinja"
Plugin 'Vimjas/vim-python-pep8-indent'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ----------------------------------------------
" settings for yaml files
" ----------------------------------------------
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
au! BufNewFile,BufReadPost *.{yaml,yml}.gotmpl set filetype=yaml
au! BufNewFile,BufReadPost *.{yaml,yml}.dec set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"" ----------------------------------------------
" settings for python files
" ----------------------------------------------
au! BufNewFile,BufReadPost *.{py,py.j2} set filetype=python
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
let g:pyindent_open_paren='&sw'
"let g:pyindent_open_paren=0
"let g:pyindent_nested_paren = '&sw'
"let g:pyindent_continue = '&sw'

" ----------------------------------------------
" Delete trailing white space on save
" ----------------------------------------------
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" ----------------------------------------------
" colorscheme and highlight
" ----------------------------------------------
"let g:rehash256 = 1
"let g:molokai_original = 1
hi Cursor ctermfg=none ctermbg=235
hi Visual ctermfg=none ctermbg=25
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=236
hi Pmenu ctermfg=White ctermbg=237
hi PmenuSel ctermfg=White ctermbg=25
hi WildMenu ctermfg=none ctermbg=27
hi StatusLine ctermfg=None ctermbg=239
hi TabLineFill ctermfg=LightGreen ctermbg=Yellow
hi TabLine ctermfg=Blue ctermbg=Yellow
hi TabLineSel ctermfg=Red ctermbg=Yellow

set ai
set background=dark
set cursorline
set enc=utf8
set number
set relativenumber
"set expandtab
"set smarttab
set showtabline=2
" 1 tab == 4 spaces
"set shiftwidth=4
set tabstop=4
set softtabstop=4
" Set to auto read when a file is changed from the outside
set autoread
au CursorHold * checktime
set scrolloff=5

set laststatus=2
set noshowmode

map <C-b> :NERDTreeToggle<CR>

set ve+=onemore
set mouse=a
set ttymouse=xterm2


set cursorline
set listchars=tab:\|\ ,
set list

set whichwrap+=<,>,[,]

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader = ","

map <leader>w :w<CR>

map <leader>pp :setlocal paste!<cr>

map <leader>tn :tabnew<cr>
map <leader><Left> :tabp<CR>
map <leader><Right> :tabn<CR>
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()"

" Press F4 to toggle highlighting on/off, and show current value.
nnoremap <F4> :set hlsearch! hlsearch?<CR>
