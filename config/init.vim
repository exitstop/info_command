set nocompatible
"filetype off
filetype on

" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

" ==================== VIM PLUG ==================

call plug#begin()
" VIM
"Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-abolish'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'tommcdo/vim-fugitive-blame-ext'
" Tag
Plug 'lyuts/vim-rtags'
Plug 'marxin/neo-rtags'
Plug 'ludovicchabant/vim-gutentags'
" -------------------------------------------------------------------------
" -------------------------------- Golang Plugin --------------------------
" -------------------------------------------------------------------------
Plug 'buoto/gotests-vim'
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips' "Golang
Plug 'honza/vim-snippets'
"сделать :GoUpdateBinaries если перестал работь
":GoDef :GoBuildTags "" gd = :GoDef
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "Golang
Plug 'mattn/emmet-vim' "Html completer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 
" nerd commenter
Plug 'scrooloose/nerdcommenter'


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-css-color'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"Plug 'ludovicchabant/vim-gutentags'



" Github Gist
"Plug 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
"Plug 'mattn/webapi-vim'

"Python plugin ---------------------------------------------------------
Plug 'vim-python/python-syntax'
Plug 'davidhalter/jedi-vim'
" https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
Plug 'zchee/deoplete-jedi'
" pair () "" []
"Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
"" syntax check
"Plug 'w0rp/ale'
"" Autocomplete
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-jedi'
" Formater
Plug 'Chiel92/vim-autoformat'
"Plug 'machakann/vim-highlightedyank'
"Plug 'tmhedberg/SimpylFold'

" -------------------------------------------------------------------------
" -------------------------------- C/C++ ----------------------------------
" -------------------------------------------------------------------------
"Plug 'bbchung/Clamp' "not work
" autocompletion (also a linter - diagnostics)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
"
" ale - linter / autocompletion / formatter
Plug 'w0rp/ale'

" auto formatter
Plug 'rhysd/vim-clang-format'

"Plug 'tweekmonster/deoplete-clang2'

" surround vim
Plug 'tpope/vim-surround'
 
" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'
 
" ctags indexer
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'vim-scripts/indexer.tar.gz'
 
" UltiSnips
Plug 'SirVer/ultisnips'
 
" easy motion
Plug 'easymotion/vim-easymotion'
 
" A - for switching between source and header files
Plug 'vim-scripts/a.vim'
 

 
" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'

"Plug 'airblade/vim-gitgutter'
"
" Python
" Autocomplete
Plug 'zchee/deoplete-jedi'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-jedi'
"
" -------------------------------------------------------------------------
" -------------------------------- vue js ----------------------------------
" -------------------------------------------------------------------------
"  fix bug
" npm install -g neovim
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}  " Completion as in vscode
Plug 'editorconfig/editorconfig-vim'                        " Editorconfig file support. see https://editorconfig.org/
Plug 'herringtondarkholme/yats.vim'
Plug 'posva/vim-vue'
Plug 'maxmellon/vim-jsx-pretty'                             " JSX syntax
Plug 'prettier/vim-prettier'                                " Prettier - automatically format file according to rules/editorconfig
Plug 'othree/xml.vim'                                       " to work with HTML/XML tags, see https://www.vim.org/scripts/script.php?script_id=1397
Plug 'othree/html5.vim'                                     " html5
Plug 'cakebaker/scss-syntax.vim'                            " SCSS syntax
Plug 'iamcco/markdown-preview.vim' " :MarkdownPreview


call plug#end()

nnoremap <F5> :GundoToggle<CR>

"nnoremap <silent> <F7> :call Preserve()<CR>
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction 
" Убрать пробелы в конце строки строки
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
" Убрать пустные линии
nmap _% :call Preserve("g/^$/d")<CR>

filetype plugin indent on    " requiredn
filetype plugin on    " requiredn

"let g:python3_host_prog='/home/user/anaconda3/bin/python'


"https://www.bha.ee/neovim-config-for-frontend-development/

" Go go golang
let g:go_def_mode = 'godef'

" python
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
let g:ycm_filepath_blacklist = {
            \ 'css': 0,
            \}

" как прыгать по коду python
"<leader>d: go to definition
"check documentation of class or method
"<leader>n: show the usage of a name in current file
"<leader>r: rename a name
hi HighlightedyankRegion cterm=reverse gui=reverse

"let g:deoplete#enable_at_startup = 1

"" NCM2
"augroup NCM2
"autocmd!
"" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()
"" :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect
"" When the <Enter> key is pressed while the popup menu is visible, it only
"" hides the menu. Use this mapping to close the menu and also start a new line.
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"" uncomment this block if you use vimtex for LaTex
"" autocmd Filetype tex call ncm2#register_source({
""           \ 'name': 'vimtex',
""           \ 'priority': 8,
""           \ 'scope': ['tex'],
""           \ 'mark': 'tex',
""           \ 'word_pattern': '\w+',
""           \ 'complete_pattern': g:vimtex#re#ncm2,
""           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
""           \ })
"augroup END

set omnifunc=syntaxcomplete#Complete
let mapleader = ','
colorscheme slate

set relativenumber "shows relative numbers to current line
set number "show line numbers
set laststatus=2 "for airline
set t_Co=256
set hidden
set backspace=2

if &term == "sCReen"
    set t_Co=256
endif

set pastetoggle=<F2>
set hlsearch
set nocompatible
set showcmd
autocmd BufRead,BufNewFile *.qss set filetype=css
autocmd BufRead,BufNewFile *.cu set filetype=cpp
autocmd BufRead,BufNewFile *.cuh set filetype=cpp
autocmd BufRead,BufNewFile *.cl set filetype=cpp
autocmd BufRead,BufNewFile *.ts set filetype=javascript
autocmd BufRead,BufNewFile *.gohtml set filetype=html
set clipboard=unnamedplus

let g:vim_tags_use_language_field = 1
let g:vim_tags_directories = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS", "html"]
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

" Python plugins
" ------------------------------------------------------------------------
let g:python_highlight_all = 1

" Github Gist
let g:gist_clip_command = 'xclip -selection clipboard'

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

let &path.=" /usr/include/boost, /usr/include/c++/7/, /usr/local/include/opencv4, "

nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

"Qargs рефакторинг
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()

" populate the argument list with each of the files named in the quickfix list
function! QuickfixFilenames()
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

"let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'
map <F6> :setlocal spell! spelllang=ru_ru<CR>

" markdown
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0
nnoremap <M-m> :MarkdownPreview<CR>
let g:mkdp_browser = 'chromium-browser'

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m

" ================ Suggestions ======================

" show wild menu (menu of suggestions) when typing commands in command mode
set path+=**
set wildmenu
set showcmd


" ================ File management ==================

" Turn off swap files
set noswapfile
set nobackup
set nowb

" TODO: improve behaviour
" reload files changed outside vim
set autoread
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" fast scrolling
nnoremap K 10j
nnoremap L 10k
vnoremap K 10j
vnoremap L 10k

" stay in normal mode after inserting a new line
"noremap o o <Esc>
"noremap O O <Esc>
 

"" mapping that opens .vimrc in a split for quick editing
"nnoremap <leader>ev :vsplit $MYVIMRC<CR>
"" mapping that sources the vimrc in the current file
"nnoremap <leader>sv :source $MYVIMRC<CR>


" ================ Searching ========================

" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch


" ================ Performance ======================

" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw
" vim timeout (forgot why I need this or if I do at all)
set ttyfast
set ttimeoutlen=10

set completeopt-=preview

" ################ NERDTree #########################

" shift+i (show hidden files)

" ctrl+n open/closes nerd tree
noremap <C-h> :NERDTreeToggle<CR>

" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1

" show nerd tree always on the right instead on the left
let g:NERDTreeWinPos = "left"



" ################ UltiSnips ########################

" make a dir Ultisnips in: '~/.config/nvim/UltiSnips/'
" and put your snippets in there
" eg. cpp.snippets

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsUsePythonVersion = 3


" ################ YouCompleteMe ####################

let g:ycm_show_diagnostics_ui = 0

let g:ycm_key_list_select_completion = ['<C-k>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-l>', '<Up>']
let g:SuperTabDefaulCompletionType = '<C-k>'

" disable annoying ycm confirmation
let g:ycm_confirm_extra_conf = 0

" add path to ycm_extra_conf.py (you could also copy the file in the home folder)
" delete '...98' argument from .ycm_extra_conf.py, otherwise syntastic does
" not work properly
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'

" autocompletion
let g:ale_completion_enabled = 1

let g:ale_cpp_clang_executable = 'clang++-5.0'

" linter
let g:ale_linters = {
            \   'cpp': ['clang']
            \}
let g:ale_cpp_clang_options = '-std=c++1z -O0 -Wextra -Wall -Wpedantic -I /usr/include/eigen3'
"let g:ale_cpp_clangtidy_options = '-checks="cppcoreguidelines-*"'
"let g:ale_cpp_cpplint_options = ''
"let g:ale_cpp_gcc_options = ''
"let g:ale_cpp_clangcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''

" ################ Clang format #####################

" Clang format - auto formatting

let g:clang_format#command = 'clang-format-3.8'
let g:clang_format#style_options = {
            \ "BreakBeforeBraces" : "Attach",
            \ "UseTab" : "Never",
            \ "IndentWidth" : 4,
            \ "ColumnLimit" : 100,
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortFunctionsOnASingleLine" : "false",
            \}

" shortcuts for autoformatting the entire file: Ctrl+j
inoremap <C-j> <Esc>:ClangFormat<CR>a
nnoremap <C-j> <Esc>:ClangFormat<CR>

" ################ A ################################

" A - switching between files

" header / source
nnoremap <F4> :A<CR>
inoremap <F4> <ESC>:A<CR>a

" file under cursor
nnoremap <F2> :IH<CR>
inoremap <F2> <ESC>:IH<CR>

let g:indexer_disableCtagsWarning = 1

" Tabularize
" Не работает
"if exists(":Tabularize")
    "nmap <Leader>a= :Tabularize /=<CR>
    "vmap <Leader>a= :Tabularize /=<CR>
    "nmap <Leader>a: :Tabularize /:\zs<CR>
    "vmap <Leader>a: :Tabularize /:\zs<CR>
    "nmap <Leader>a| :Tabularize /|\zs<CR>
    "vmap <Leader>a| :Tabularize /|\zs<CR>
"endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

if has("autocmd")
  " Enable file type detection
  filetype on
  " Автообновление настроек
  autocmd bufwritepost .vimrc source $MYVIMRC

  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
  set expandtab " Только пробелы

  set smartindent

  " go
  autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab

  " cpp
  autocmd FileType cpp setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType h setlocal ts=4 sts=4 sw=4 expandtab

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

nnoremap <C-W><Char-0x22> <C-W>S
nnoremap <C-W><Char-0x25> <C-W>v
