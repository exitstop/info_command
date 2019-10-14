set nocompatible
filetype off

call plug#begin()
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips' "Golang
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "Golang
Plug 'mattn/emmet-vim' "Html completer
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sCRooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

filetype plugin indent on    " requiredn
filetype plugin on    " requiredn
set omnifunc=syntaxcomplete#Complete
"let mapleader = ','
colorscheme slate 

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set smartindent
set relativenumber "shows relative numbers to current line
set number "show line numbers
set laststatus=2 "for airline
set t_Co=256
set hidden
set backspace=2

if &term == "sCReen"
    set t_Co=256
endif

map <C-m> :NERDTreeToggle<CR>
set pastetoggle=<F2>
set hlsearch
set nocompatible
set showcmd
autocmd BufRead,BufNewFile *.qss set filetype=css
autocmd BufRead,BufNewFile *.cu set filetype=cpp
autocmd BufRead,BufNewFile *.cuh set filetype=cpp
autocmd BufRead,BufNewFile *.cl set filetype=cpp
autocmd BufRead,BufNewFile *.ts set filetype=javascript
set clipboard=unnamedplus

let g:vim_tags_use_language_field = 1
let g:vim_tags_directories = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']
let g:vim_tags_extension = '.tags'
let g:vim_tags_cache_dir = expand($HOME)
let g:vim_tags_use_vim_dispatch = 0
let g:vim_tags_gems_tags_command = "{CTAGS} -R {OPTIONS} `bundle show --paths` 2>/dev/null"
let g:vim_tags_project_tags_command = "{CTAGS} -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_auto_generate = 1

set exrc
set secure

map <unique> <F3> :let @/ = ""<CR>
nnoremap g[ :YcmCompleter GoToDeclaration<CR>

" tab
nnoremap tn :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
"nmap <c-f> :cs find g <c-r>=expand("<cword>")<cr><cr>
" Подстветка табов и всякой гадости
set list
set listchars=tab:»·
set listchars+=trail:·
set endofline

set path=$PWD/**
let g:CCTreeRecursiveDepth = 3

filetype indent on
"let g:user_emmet_leader_key=','
"for format html
"!tidy -mi -html -wrap 0 %
set undofile
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_operators = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4