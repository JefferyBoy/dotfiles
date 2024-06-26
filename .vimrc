"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set cursorcolumn         " 设置光标所在列高亮
set relativenumber       " 开启相对行号
" set mouse=a            " 开启鼠标
" indentLine             " 开启代码对齐线
" let g:indentLine_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
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
" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macvim设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let system = system('uname -s')
    if system == "Darwin\n"
        set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h18 " 设置字体
    else
        set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 18      " 设置字体
    endif
    set guioptions-=m           " 隐藏菜单栏
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L           " 隐藏左侧滚动条
    set guioptions-=r           " 隐藏右侧滚动条
    set guioptions-=b           " 隐藏底部滚动条
    set showtabline=0           " 隐藏Tab栏
    set guicursor=n-v-c:ver5    " 设置光标为竖线
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 窗口调整
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <c-up> :resize +5<CR>
map <c-down> :resize -5<CR>
map <c-left> :vertical resize-5<CR>
map <c-right> :vertical resize+5<CR>
" 保存退出
map W :w<cr>
map Q :q<cr>
" 键0回到行首非空字符位置
map 0 ^
" 系统剪贴板
vmap <leader><leader>y "+y     
nnoremap <leader><leader>p "+p
" 分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" vim-buffer
nnoremap <a-h> :bprevious<cr>
nnoremap <a-l> :bnext<cr>

nnoremap <leader>x :bdelete<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编辑vimrc相关配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编辑vimrc文件
nnoremap <leader>e :edit ~/.vimrc<cr>
" 重新加载vimrc文件
nnoremap <leader>s :source ~/.vimrc<cr>
" 查看vimplus的help文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vim/help.md<cr>
" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:onedark_termcolors=256
try
"colorscheme monokai
" 光标行背景颜色
hi CursorLine term=bold cterm=bold ctermbg=8
hi CursorColumn term=bold cterm=bold ctermbg=8
endtry
nnoremap <silent> <F9> :PreviousColorScheme<cr>
inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
nnoremap <silent> <F10> :NextColorScheme<cr>
inoremap <silent> <F10> <esc> :NextColorScheme<cr>
nnoremap <silent> <F11> :RandomColorScheme<cr>
inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
nnoremap <silent> <F12> :ShowColorScheme<cr>
inoremap <silent> <F12> <esc> :ShowColorScheme<cr>

call plug#begin('~/.vim/plugged')

Plug 'chxuan/cppfun'
Plug 'chxuan/change-colorscheme'
Plug 'Yggdroot/LeaderF'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'                            " 内容对其
Plug 'tpope/vim-surround'                           " 快速修改代码块包裹的字符
Plug 'tpope/vim-commentary'                         " 代码添转注释 gc gcc
Plug 'tpope/vim-repeat'                             " 重复上一次的操作 .
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'                      " airline文件状态显示
Plug 'vim-airline/vim-airline-themes'               " airline主题
Plug 'ryanoasis/vim-devicons'                       " 显示字符icon(使用Nerd Font字体)
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'Shougo/echodoc.vim'                           " 底部命令中显示完整函数名（写代码时很有用）
Plug 'vim-scripts/indentpython.vim'
Plug 'terryma/vim-multiple-cursors'                 " 多光标
"Plug 'iamcco/mathjax-support-for-mkdp'
" (需要自己安装nodejs和yarn)
Plug 'iamcco/markdown-preview.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'gorodinskiy/vim-coloresque'
" Plug 'vim-scripts/DoxygenToolkit.vim'
" 主题
Plug 'crusoexia/vim-monokai'
Plug 'joshdick/onedark.vim'

call plug#end()

" load vim default plugin
runtime macros/matchit.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件参数配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" prepare-code
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

" coc.nvim
" source ~/.vim/.vimrc.coc


" tagbar
" let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>

" incsearch.vim
map /  <plug>(incsearch-forward)
map ?  <plug>(incsearch-backward)
map g/ <plug>(incsearch-stay)

" vim-easymotionsymotion-overwin-w)
let g:easymotion_smartcase = 1
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" nerdtree-git-plugin
let g:nerdtreegitstatusindicatormapcustom = {
            \ "modified"  : "✹",
            \ "staged"    : "✚",
            \ "untracked" : "✭",
            \ "renamed"   : "➜",
            \ "unmerged"  : "═",
            \ "deleted"   : "✖",
            \ "dirty"     : "✗",
            \ "clean"     : "✔︎",
            \ 'ignored'   : '☒',
            \ "unknown"   : "?"
            \ }

" LeaderF
nnoremap <leader>f :LeaderfFile .<cr>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

" ack
nnoremap <leader>F :Ack!<space>

" echodoc.vim
let g:echodoc_enable_at_startup = 1
