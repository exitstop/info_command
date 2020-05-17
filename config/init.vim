set nocompatible
filetype off

call plug#begin()
"Golang Plugin ---------------------------------------------------------
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips' "Golang
Plug 'honza/vim-snippets'
// сделать :GoUpdateBinaries если перестал работь
// :GoDef :GoBuildTags "" gd = :GoDef
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
Plug 'ap/vim-css-color'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Github Gist
"Plug 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
"Plug 'mattn/webapi-vim'

"Python plugin ---------------------------------------------------------
"Plug 'vim-python/python-syntax'
"Plug 'davidhalter/jedi-vim'
" https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
"Plug 'zchee/deoplete-jedi'
" pair () "" []
"Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
"Plug 'machakann/vim-highlightedyank'
"Plug 'tmhedberg/SimpylFold'

" C-Family
"Plug 'bbchung/Clamp' "not work
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'tweekmonster/deoplete-clang2'

" Git
Plug 'tpope/vim-fugitive'
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
" vue js
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}  " Completion as in vscode
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

filetype plugin indent on    " requiredn
filetype plugin on    " requiredn

"https://www.bha.ee/neovim-config-for-frontend-development/

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
autocmd BufRead,BufNewFile *.gohtml set filetype=html
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
