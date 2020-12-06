call plug#begin('~/.config/nvim/plugged')
" colorscheme gruvbox
Plug 'morhetz/gruvbox'
"snippets代码片段
Plug 'honza/vim-snippets'
" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'f-person/pubspec-assist-nvim', { 'for' : ['pubspec.yaml'] }

"模糊查找
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"nvim主题
Plug 'Iron-E/nvim-highlite'
Plug 'srcery-colors/srcery-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
"Plug 'preservim/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'davidhalter/jedi-vim'
Plug 'majutsushi/tagbar'
"nvim启动
Plug 'glepnir/dashboard-nvim'
" Vim-Startify启动
"Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"调试插件
Plug 'w0rp/ale'
"markdown-preview
Plug 'iamcco/markdown-preview.vim', { 'for' :['markdown','vim-plug'] }
"clap模糊查找
"Plug 'liuchengxu/vim-clap'
call plug#end()
set nocompatible
set backspace=indent,eol,start
"TagBar
map <C-o> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags' "设置ctags所在路径
let g:tagbar_width=25 "设置tagbar的宽度
"let g:tagbar_left = 1  "让tagbar在页面左侧显示，默认右边
let g:tagbar_autofocus = 1 "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "在某些情况下自动打开tagbar
noremap <F6> :!ctags -R<CR>
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
let g:airline#extensions#tabline#enabled = 1   " 是否打开tabline
"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1
set laststatus=2  "永远显示状态栏
let g:airline_theme='bubblegum' "选择主题
let g:airline#extensions#tabline#enabled=1    "Smarter tab line: 显示窗口tab和buffer
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
" ************************************************************
" 命令行模式增强，ctrl-a 到行首，ctrl-e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" 插入模式增强，ctrl-a 到行首，ctrl-e 到行尾
imap <C-a> <Esc>^
imap <C-e> <Esc>$
" 把 <Tab> 替换成 4 个空格
"nnoremap tt :%s/\t/    /g<CR>
set tabstop=4        
set shiftwidth=4
set softtabstop=4
" 删除行尾多余空格
nnoremap cl :%s/\s\+$//g<CR>:w<CR>
    
"********************************************************************************
" 编译调试
"********************************************************************************
" 编译运行
map <C-R> :call CompileRunGcc()<CR>
function CompileRunGcc()
    exec "w"
    if &filetype == 'c'
    exec "!g++ % -std=c++11 -o %<"
    exec "term ./%<" 
    elseif &filetype == 'cpp'
    exec "!g++ % -std=c++11 -o %<"
    exec "term ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc

" <Ctrl+T> gdb调试
map <C-T> :call Rungdb()<CR>
function Rungdb()
    exec "w"
    exec "!g++ % -std=c++11 -g -o %<"
    exec "!gdb ./%<"
endfunc
"********************************************************************************
" 主题设置
"********************************************************************************
" GUI 模式浅色背景，终端模式深色背景
if has('gui_running')
    set background=light
else
    set background=dark
endif
"********************************************************************************
" 编码设置
"**************************************************************************
" 帮助语言首选
set helplang=cn
" 菜单使用的语言
set langmenu=zh_CN.UTF-8
" Vim 所工作的终端的字符编码方式
set termencoding=utf-8
" Vim 内部使用的字符编码方式
set encoding=utf8
" Vim 启动时会按照 fileencodings 所列出的字符编码方式逐一探测即将打开的文件的字符编码方式,并且将 fileencoding 设置为最终探测到的字符编码方式
set fileencodings=ucs-bom,utf8,gbk,cp936,gb2312,gb18030
" 文件输入输出使用的格式，默认为 UNIX 格式
set fileformats=unix,dos

"********************************************************************************
" 代码排版
"********************************************************************************
" 自适应不同语言的智能缩进
filetype indent on
" 自动缩进
set autoindent
" 使用 C/C++ 语言的自动缩进方式
set cindent
" C/C++ 语言的具体缩进方式
set cinoptions=g0,:0,N-s,(0
" 智能选择对齐方式
set smartindent
filetype plugin on

"********************************************************************************
" 搜索配置
"********************************************************************************
" 高亮显示当前行
set cursorline
" 高亮显示搜索结果
set hlsearch
" 输入搜索时，同时高亮部分的匹配
set incsearch
" 搜索时忽略大小写
set ignorecase
" 搜索时尝试smart，即模式中有大写字母时不忽略大小写
set smartcase

"********************************************************************************
" 缓存配置
"********************************************************************************
" 自动保存
set autowrite
"********************************************************************************
" 基本设置
"********************************************************************************
 " 启动时不显示援助乌干达儿童的提示
set shortmess=atI
" 开启语法高亮功能
syntax enable
" 开启语法高亮
syntax on
" 关闭 vi 一致性模式，避免以前版本的一些bug和局限
set nocompatible
" 去掉输入错误的提示声音
set noerrorbells
" 关闭使用可视响铃代替呼叫
set novisualbell
" 总是显示光标位置
set ruler
" 高亮显示当前行
set cursorline
" 在状态栏显示正在输入的命令
set showcmd
" 命令行的高度
"set cmdheight=2
" 总是显示状态栏
set laststatus=2
" 状态行显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" <ESC> 键响应时间
set ttimeoutlen=0
" 显示括号配对，当键入“]”“)”时，高亮度显示匹配的括号
set showmatch
" 配对括号高亮时选中的括号显示黄色
hi MatchParen ctermbg=Yellow guibg=lightblue
" 允许光标出现在最后一个字符的后面
set virtualedit=block,onemore
" 文件修改之后自动读入
set autoread
" 自动保存
set autowrite
" vim 打开文件，光标定位到上次退出的位置
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"使用鼠标滚动
if has('mouse')
    set mouse-=a
endif
" 开启行号显示
set number
" vim 中可以使用鼠标
set mouse=a
" 选择模式使用鼠标
set selectmode=mouse,key
" 共享剪贴板
set clipboard=unnamedplus
"设置相对行号
set relativenumber
set nocompatible    " be iMproved, required
filetype off        " required
" Ctrl-n 打开/关闭相对行号显示
nnoremap <C-n> :call RelativenumberToggle()<CR>
function RelativenumberToggle()
    if (&relativenumber == 1)
       set norelativenumber number
   else
       set relativenumber
   endif
endfunc
" 窗口快速切换
nmap J <C-w>j
nmap H <C-w>h
nmap K <C-w>k
nmap L <C-w>l
nmap W <C-w>w
nmap C <C-w>c

"多窗口切换
nmap bb :bn<CR>
"快速保存退出
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>w :w<CR>
" 括号自动不全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap { {<CR>}<Esc>O

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim color file
set background=dark
set t_Co=256 "告知molokai，终端支持256色。
colorscheme srcery
set termguicolors

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ale
"打开文件时不检查
let g:ale_lint_on_enter=1
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
let g:ale_linters={
\    'c++': ['g++'],
\    'c': ['clang'],
\}
"coc.nvim"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"翻译插件配置
" <Leader>t 翻译光标下的文本，在命令行回显
nmap <silent> <Leader>t :CocCommand translate.popup 
vmap <silent> <Leader>t <Plug>TranslateV
" Leader>w 翻译光标下的文本，在窗口中显示
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV

"打开lazygit
"noremap <A-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR> i
"noremap <A-r> :tabe<CR>:-tabmove<CR>:term ranger<CR> i
noremap <A-g> :term lazygit<CR> i
noremap <A-r> :term ranger<CR> i

"主题设置
set guicursor+=v:vCursor
"disable italics
let g:vorange_italic = 0
"disable bold
let g:vorange_bold = 0
"disable underline
let g:vorange_underline=0
"disable undercurl
let g:vorange_undercurl=0

"coc.nvim设置
"使用回车补全代码
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"使用[g ]g上下查找错误
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"使用\h查看文档
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"coc侧边栏
map tt :CocCommand explorer<CR>
"coc翻译插件配置0
" <Leader>t 翻译光标下的文本，在命令行回显
nmap <silent> <Leader>t :CocCommand translator.echo<CR>
vmap <silent> <Leader>t :CocCommand translator.echo<CR>
" Leader>w 翻译光标下的文本，在窗口中显示
nmap <silent> <Leader>r :CocCommand translator.popup<CR>
vmap <silent> <Leader>r :CocCommand translator.popup<CR>
" Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>w :CocCommand translator.replace<CR>
vmap <silent> <Leader>w :CocCommand translator.replace<CR>
"
"新启动界面设置
" Default value is clap 默认查找插件
let g:dashboard_default_executive ='fzf'
let g:indentLine_fileTypeExclude = ['dashboard']

let s:header_commicgirl11 =[
    \'',
    \'⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⣀⣀⣀⡀⠀⢀⡀⠀⢀⣀⣀⣀⠀⡀⠀⠀⠀⠀⠀⠀',
    \'⠀⠀⠀⠀⠀⣠⣎⣀⣀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠀⠀⠀⠀',
    \'⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀',
    \'⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡿⠏⠿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⡆⠀⠀',
    \'⠀⠀⠀⣿⣿⣿⣿⣿⣿⡿⢿⠋⠉⠀⠀⠀⠀⠀⡀⠀⠀⠘⢿⣿⣿⣿⣿⣧⠀⠀',
    \'⠀⠀⢰⣿⣿⣿⣿⠟⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⡈⠀⠻⣿⣿⣿⣿⠀⠀',
    \'⠀⠀⣼⣿⣿⡿⠁⠀⢸⠀⠈⢳⣶⣤⣄⠀⠈⠀⠁⠀⠀⠀⢀⠀⠹⣿⣿⡟⠀⠀',
    \'⠀⠀⣿⣿⣿⠀⠀⠈⣼⡇⠀⠘⠻⠟⠁⠀⠀⠀⠀⢤⣀⡀⠌⠀⠀⣿⣿⠃⠀⠀',
    \'⠀⠀⣿⣿⣿⡀⠀⠀⡏⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡿⠋⢰⢠⣿⡏⠀⠀⠀',
    \'⠀⠀⣿⣿⣿⡇⠀⠀⢷⡃⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣯⣾⡟⠀⠀⠀⠀',
    \'⠀⠀⣿⣿⣿⡿⠀⠀⣼⣿⡄⠀⠈⠀⢑⠶⠀⠀⠀⠀⢀⣾⣿⣿⣿⡇⠀⠀⠀⠀',
    \'⠀⠀⣿⣿⣿⠁⠀⠀⣿⣿⠁⠀⠀⠀⢀⣀⣠⣤⣤⣴⠟⣿⣿⣿⣿⡇⠀⠀⠀⠀',
    \'⠀⠀⠙⢿⠃⠀⠀⢸⣿⣟⠀⠀⢀⣤⣾⣿⣿⣿⠟⠁⢰⣿⣿⣿⣿⠃⠀⠀⠀⠀',
    \'⠀⠀⠠⠴⠀⠀⠀⠿⠿⠿⠧⠾⠿⠿⠿⠿⠿⠃⠀⠀⠾⠿⠿⠟⠁⠀    ',
    \'',
    \]
let g:dashboard_custom_header =[
   \' ███████████████████████████ ',
   \' ███████▀▀▀░░░░░░░▀▀▀███████ ',
   \' ████▀░░░░░░░░░░░░░░░░░▀████ ',
   \' ███│░░░░░░░░░░░░░░░░░░░│███ ',
   \' ██▌│░░░░░░░░░░░░░░░░░░░│▐██ ',
   \' ██░└┐░░░░░░░░░░░░░░░░░┌┘░██ ',
   \' ██░░└┐░░░░░░░░░░░░░░░┌┘░░██ ',
   \' ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██ ',
   \' ██▌░│██████▌░░░▐██████│░▐██ ',
   \' ███░│▐███▀▀░░▄░░▀▀███▌│░███ ',
   \' ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██ ',
   \' ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██ ',
   \' ████▄─┘██▌░░░░░░░▐██└─▄████ ',
   \' █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████ ',
   \' ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████ ',
   \' █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████ ',
   \' ███████▄░░░░░░░░░░░▄███████ ',
   \' ██████████▄▄▄▄▄▄▄██████████ ',
   \ ]

"fzf设置
nnoremap fh :DashboardFindHistory<CR>
nnoremap ff :DashboardFindFile<CR>
nnoremap tc :DashboardChangeColorscheme<CR>
nnoremap fa :DashboardFindWord<CR>
nnoremap fb :DashboardJumpMark<CR>
nnoremap cn :DashboardNewFile<CR>

" === coc.nvim自动加载
let g:coc_global_extensions = [
	\ 'coc-actions',
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-todolist',
	\ 'coc-translator',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-yank']

"snippets代码片段
" Use <C-h> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-h>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-l>'


