" For Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'ycm-core/YouCompleteMe'
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'Raimondi/delimitMate'
" Plugin 'wakatime/vim-wakatime'
" Plugin 'itchyny/lightline.vim'
" Plugin 'fatih/vim-go'
" Plugin 'tpope/vim-fugitive'
" Plugin 'preservim/nerdtree'
" Plugin 'Yggdroot/indentLine'
" Bundle 'lepture/vim-jinja'
" Plugin 'Vimjas/vim-python-pep8-indent'
" Plugin 'tpope/vim-commentary'
" Plugin 'dense-analysis/ale'
" Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
" call vundle#end()            " required
" filetype plugin indent on    " required
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

call plug#begin('~/.vim/plugged')
" Plugin 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'Raimondi/delimitMate'
Plug 'wakatime/vim-wakatime'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
call plug#end()


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

"" ----------------------------------------------
" settings for go files
" ----------------------------------------------
au! BufNewFile,BufReadPost *.{go} set filetype=go
" autocmd FileType go setlocal ts=4 sts=4 sw=4 expandtab

" ----------------------------------------------
" fatih/vim-go
" ----------------------------------------------
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:go_gocode_propose_source=0

let g:godef_split=2

" show function definition on cursor
let g:go_auto_type_info = 1
set updatetime=100

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
" set listchars=tab:\|\ ,
" set list

set whichwrap+=<,>,[,]

nnoremap <C-J> <C-W><down>
nnoremap <C-K> <C-W><up>
nnoremap <C-L> <C-W><right>
nnoremap <C-H> <C-W><left>

nnoremap <Esc>h :tabp<CR>
nnoremap <Esc>l :tabn<CR>
" keys for mac
nnoremap ˙ :tabp<CR>
nnoremap ¬ :tabn<CR>


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

" turn off number and indentlines for copying
map <leader>c :set relativenumber!<CR>:set number!<CR>:IndentLinesToggle<CR>

" Press F4 to toggle highlighting on/off, and show current value.
nnoremap <F4> :set hlsearch! hlsearch?<CR>

let g:ale_linters = {
      \   'python': ['flake8'],
      \}


let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'helloworld': '%{LinterStatus()}'
      \ },
      \ }

" sets linter output in lightline
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

" -----
"  settings for coc
" -----
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

