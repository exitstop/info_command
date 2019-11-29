"https://github.com/landonp1203/.dotfiles/blob/master/.vimrc
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

":PluginInstall
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'fugitive.vim'
Plugin 'sCRooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tmux-plugins/vim-tmux'
"Plugin 'tomasiser/vim-code-dark'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'taglist.vim'
"Plugin 'lifepillar/vim-mucomplete'
"Plugin 'maralla/completor.vim'
"Plugin 'szw/vim-tags'
"Plugin 'bbchung/clighter8'
"Plugin 'fatih/vim-go'
Plugin 'hari-rangarajan/CCTree' 
Plugin 'vim-javascript'
"Plugin 'vim-scripts/Conque-GDB'
"Plugin 'vim-vdebug/vdebug'
Plugin 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
"Plugin 'sakhnik/nvim-gdb', { 'branch': 'legacy' }
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
"Plugin 'zxqfl/tabnine-vim'
"Plugin 'rip-rip/clang_complete'
"Plugin 'fatih/vim-go'
"Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " requiredn

let mapleader = ','
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"/usr/lib/llvm-7/lib/libclang.so.1
"let g:clang_use_library=1
"let g:clang_library_path='/usr/lib/llvm-7/lib'
"let g:clang_library_path='/usr/lib/llvm-7/lib/libclang.so.1'
"let g:clang_complete_copen=1
"let g:clang_hl_errors=1
"let g:clang_complete_auto=1
"let g:clang_complete_auto = 0
"let g:clang_complete_copen = 1
"let g:clang_use_library = 1
"let g:clang_library_path='/usr/lib/llvm-7/lib/libclang.so.1'
"let g:clang_auto_user_options='path, .clang_complete'
"let g:clang_user_options='|| exit 0'

" адекватные цветовые схемы deleck, peachpuff, ron, slate, zellner 
colorscheme slate 
"colorscheme codedark
":syntax on

"let g:completor_clang_binary =  '/usr/lib/clang'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"Plugin 'lifepillar/vim-mu_omplete'
"set completeopt+=menuone
"------------------------------------------
"set completeopt-=preview
"set completeopt+=menuone,noselect
" The following line assumes `brew install llvm` in macOS
"let g:clang_library_path = '/usr/local/opt/llvm/lib/libclang.dylib'
"let g:clang_user_options = '-std=c++14'
"let g:clang_complete_auto = 1
"let g:mucomplete#enable_auto_at_startup = 1

"let g:airline_theme='codedark' "airline theme (status bar)

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




filetype plugin indent on
" show existing tab with 4 spaces width
" when indenting with '>', use 4 spaces width
" On pressing tab, insert 4 spaces

"sCReen 256 color
if &term == "sCReen"
  set t_Co=256
endif

"For proper tabbing and bracket insertion"
"inoremap {<CR> {<CR>}<c-o><s-o>
"inoremap [<CR> [<CR>]<c-o><s-o>
"inoremap (<CR> (<CR>)<c-o><s-o>

map <C-m> :NERDTreeToggle<CR>
set pastetoggle=<F2>
set hlsearch
set nocompatible
set showcmd
autocmd BufRead,BufNewFile *.qss set filetype=css
autocmd BufRead,BufNewFile *.cu set filetype=cpp
autocmd BufRead,BufNewFile *.cuh set filetype=cpp
autocmd BufRead,BufNewFile *.cl set filetype=cpp
autocmd BufRead,BufNewFile *.gohtml set filetype=html
autocmd BufRead,BufNewFile *.ts set filetype=javascript
set clipboard=unnamedplus

let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_show_diagnostics_ui = 0
let g:YcmErrorSection = 0
let g:ycm_filepath_completion_use_working_dir = 0
"highlight YcmErrorLine guibg=#330000
highlight SyntasticError guibg=#330000
highlight SyntasticWarning guibg=#330000
"highlight YcmErrorSign guibg=#330000

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

"if &diff
"    colorscheme evening
"endif

"highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
set path=$PWD/**

"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
"let g:CCTreeCscopeDb = "cscope.out"
let g:CCTreeRecursiveDepth = 3
"let g:CCTreeOrientation = "leftabove"
"let g:CCTreeWindowVertical = 1
"let g:CCTreeWindowHeight
"let g:CCTreeWindowWidth = -1
"
"javascript
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1
"let g:javascript_plugin_flow = 1

"augroup javascript_folding
"    au!
"    au FileType javascript setlocal foldmethod=syntax
"augroup END
"

" ConqueGDB Setting
"let g:ConqueTerm_Color=2            " 1: strip color after 200 line, 2:
"always with color
"let g:ConqueTerm_CloseOnEnd=1       " close conque when program ends running
"let g:ConqueTerm_StartMessages=0    " display warning message if conqueTerm
"is configed incorrect
"let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
"let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
"let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly
"https://medium.com/vim-drops/be-a-html-ninja-with-emmet-for-vim-feee15447ef1
filetype indent on
let g:user_emmet_leader_key=','
"for format html
"!tidy -mi -html -wrap 0 %
set undofile
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

