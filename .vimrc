" Modified from https://github.com/chxuan/vimplus
" Author: godsome <godsome@outlook.com>
" Repository: https://github.com/godsome/xvim-conf.git
" Create Date: 2020-12-18
" License: MIT

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set noeb                 " 关闭错误的提示
set t_Co=256             " 开启256色支持
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set cursorcolumn         " 高亮显示当前列
set laststatus=2         " 总是显示状态栏
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
" set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
highlight Visual cterm=reverse ctermbg=Black ctermfg=White      " visual mode style
hi CursorColumn ctermbg=238
highlight Pmenu ctermbg=gray
hi CursorLine gui=underline cterm=underline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
" set cindent              " 设置使用C/C++语言的自动缩进方式
" set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
" set expandtab            " 将制表符扩展为空格
" set tabstop=4            " 设置编辑时制表符占用空格数
" set shiftwidth=4         " 设置格式化时制表符占用空格数
" set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'chxuan/vim-buffer'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline', {'tag': 'v0.11'}
Plug 'vim-airline/vim-airline-themes'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'wsdjeg/vim-fetch'
Plug 'vivien/vim-linux-coding-style'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': 'v0.0.80'}
Plug 'prabirshrestha/vim-lsp'
Plug 'ntpeters/vim-better-whitespace'
Plug 'shirk/vim-gas'
Plug 'andymass/vim-matchup'
Plug 'roxma/vim-paste-easy'

call plug#end()

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#coc#enabled = 0
let airline#extensions#coc#error_symbol = 'Error:'
let airline#extensions#coc#warning_symbol = 'Warning:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" airline-themes
let g:airline_theme='onedark'
if &diff
    colorscheme onedark
endif
set background=dark

" vim-buffer
nnoremap <silent> <c-p> :PreviousBuffer<cr>
nnoremap <silent> <c-n> :NextBuffer<cr>
nnoremap <silent> <leader>d :CloseBuffer<cr>
nnoremap <silent> <leader>D :BufOnly<cr>

" gutentags
let g:gutentags_modules = ['gtags_cscope']
let g:gutentags_project_root = ['.root', 'compile_commands.json']
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_plus_switch = 1
let g:gutentags_define_advanced_commands = 1
let g:gutentags_exclude_filetypes = ['sh', 'py', 'Makefile']

" quickfix不包含在bufferlist里
augroup qf
        autocmd!
        autocmd FileType qf set nobuflisted
augroup END

noremap <c-\>s :GscopeFind s <C-R><C-W><cr>
noremap <c-\>g :GscopeFind g <C-R><C-W><cr>
noremap <c-\>c :GscopeFind c <C-R><C-W><cr>
noremap <c-\>t :GscopeFind t <C-R><C-W><cr>
noremap <c-\>e :GscopeFind e <C-R><C-W><cr>
noremap <c-\>f :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <c-\>i :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <c-\>d :GscopeFind d <C-R><C-W><cr>
noremap <c-\>a :GscopeFind a <C-R><C-W><cr>
noremap <c-\>z :GscopeFind z <C-R><C-W><cr>

" vim-preview
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

" note: fonts must be installed for devicons
" fc-cache -vf .vim/fonts

" coc.nvim
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" install coc plugin
" :CocInstall coc-ccls
" CocConfig
" {
"         "languageserver": {
"                 "ccls": {
"                          "command": "ccls",
"                           "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"],
"                            "rootPatterns": ["compile_commands.json"],
"                            "requireRootPattern": true,
"                            "initializationOptions": {
"                                    "cache": {
"                                                   "directory": "/home/gelin/.cache/ccls"
"                                    }
"                            }
"                 }
"         }
" }

let g:coc_disable_startup_warning = 1

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=1
let g:show_spaces_that_precede_tabs=1

" vim-lsp
" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
      \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
