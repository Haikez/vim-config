call plug#begin('~/.vim/plugged')
" 底部状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'	
" 主题
Plug 'tomasr/molokai'	
Plug 'morhetz/gruvbox'
" nerdtree
Plug 'preservim/nerdtree'
" 缩进线
Plug 'nathanaelkane/vim-indent-guides' 
" cpp文件高亮
Plug 'octol/vim-cpp-enhanced-highlight'	
"代码高亮
Plug 'davidhalter/jedi-vim'
" 模糊搜索
Plug 'ctrlpvim/ctrlp.vim'
" 标签栏
Plug 'majutsushi/tagbar'
" Vim-Startify启动
Plug 'mhinz/vim-startify'
"Plug 'Valloric/YouCompleteMe',{'do':'./install.py --clang-completer','for':['c','cpp']}
" 语法检测
Plug 'w0rp/ale'
" 翻译插件
Plug 'voldikss/vim-translator'
"代码补全
Plug 'skywind3000/vim-auto-popmenu'
call plug#end()


"使用 utf-8 编码
set encoding=utf-8
"设置行号"
set number
"语法高亮"
syntax on
"底部显示，当前处于模式"
set showmode
"开启文件类型检查
filetype indent on
"F3快捷键
"set pastetoggle=<F3>
"当前行高亮
set cursorline
" 总是显示光标位置
set ruler
"显示状态栏
set laststatus=2
" 在状态栏显示正在输入的命令
set showcmd
"不创建交换文件
set noswapfile
" 高亮显示搜索结果
set hlsearch
" 输入搜索时，同时高亮部分的匹配
set incsearch
" 搜索时忽略大小写
set ignorecase
" 搜索时尝试smart，即模式中有大写字母时不忽略大小写
set smartcase
" 把 <Tab> 替换成 4 个空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set nu
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
" 帮助语言首选
set helplang=cn
" 菜单使用的语言
set langmenu=zh_CN.UTF-8
" Vim 所工作的终端的字符编码方式
set termencoding=utf-8
set termwinsize=40*0
" Vim 启动时会按照 fileencodings 所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，
" 并且将 fileencoding 设置为最终探测到的字符编码方式
set fileencodings=ucs-bom,utf8,gbk,cp936,gb2312,gb18030
" 文件输入输出使用的格式，默认为 UNIX 格式
set fileformats=unix,dos
"使用鼠标滚动
if has('mouse')
	set mouse-=a
endif


"********************************************************************************
" 代码排版
"********************************************************************************
" 自动缩进
set autoindent
" 使用 C/C++ 语言的自动缩进方式
set cindent
" C/C++ 语言的具体缩进方式
set cinoptions=g0,:0,N-s,(0
" 智能选择对齐方式
set smartindent
filetype plugin on
" 文件修改之后自动读入
set autoread
" 自动保存
set autowrite
" vim 打开文件，光标定位到上次退出的位置
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" vim 中可以使用鼠标
set mouse=a
" 选择模式使用鼠标
set selectmode=mouse,key
" 共享剪贴板
set clipboard=unnamedplus
" 插入模式竖线
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"设置相对行号
set relativenumber
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
" 括号自动补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap < <><Esc>i
inoremap { {<CR>}<Esc>O

" 命令行模式增强，ctrl-a 到行首，ctrl-e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" 插入模式增强，ctrl-a 到行首，ctrl-e 到行尾
imap <C-a> <Esc>^
imap <C-e> <Esc>$
"nnoremap tt :%s/\t/    /g<CR>
" 删除行尾多余空格
nnoremap cl :%s/\s\+$//g<CR>:w<CR>   
"TagBar
map <C-o> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags' "设置ctags所在路径
let g:tagbar_width=25 "设置tagbar的宽度
"let g:tagbar_left = 1  "让tagbar在页面左侧显示，默认右边
let g:tagbar_autofocus = 1 "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "在某些情况下自动打开tagbar
noremap <F6> :!ctags -R<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete  
autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS  
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
autocmd FileType css set omnifunc=csscomplete#CompleteCSS  
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags  
autocmd FileType php set omnifunc=phpcomplete#CompletePHP  
autocmd FileType c set omnifunc=ccomplete#Complete  


set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
let g:airline#extensions#tabline#enabled = 1   " 是否打开tabline
"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1
set laststatus=2  "永远显示状态栏
let g:airline_theme='bubblegum' "选择主题
let g:airline#extensions#tabline#enabled=1    "Smarter tab line: 显示窗口tab和buffer
"let g:airline#extensions#tabline#left_sep = ' '  "separater
"let g:airline#extensions#tabline#left_alt_sep = '|'  "separater
"let g:airline#extensions#tabline#formatter = 'default'  "formater
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""autocmd FileType python set omnifunc=pythoncomplete#Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."),"\#########################################################################") 
        call append(line(".")+1, "\# File Name: ".expand("%"))
        call append(line(".")+2, "\# Author : Haikez")
        call append(line(".")+3, "\# QQ : 1937086590")
        call append(line(".")+4, "\# Email:1937086590@qq.com")
        call append(line(".")+5, "\# Created Time: ".strftime("%c"))
        call append(line(".")+6, "\#########################################################################")
        call append(line(".")+7, "")

    elseif &filetype == 'python'
        call setline(1,"\#!/usr/bin/env python")
	call append(line('.'),"#-*-coding:UTF-8 -*-n")
        call append(line(".")+1,"\#########################################################################")
        call append(line(".")+2, "\# File Name: ".expand("%"))
        call append(line(".")+3, "\# Author :Haikez")
        call append(line(".")+4, "\# QQ : 1937086590")
        call append(line(".")+5, "\# Email:1937086590@qq.com")
        call append(line(".")+6, "\# Created Time: ".strftime("%c"))
        call append(line(".")+7, "\#########################################################################")
        call append(line(".")+8, "")

    else
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "\# File Name: ".expand("%"))
        call append(line(".")+2, "\# Author : Haikez  ")
        call append(line(".")+3, "\# QQ : 1937086590")
        call append(line(".")+4, "\# Email:1937086590@qq.com")
        call append(line(".")+5, "\# Created Time: ".strftime("%c"))
        call append(line(".")+6, " ************************************************************************/") 
        call append(line(".")+7, "")

    endif
    if &filetype == 'cpp'
        call append(line(".")+8, "#include<iostream>")
        call append(line(".")+9, "using namespace std;")
        call append(line(".")+10, "")
    endif
    if &filetype == 'c'
        call append(line(".")+8, "#include<stdio.h>")
        call append(line(".")+9,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

" 编译运行
map <C-R> :call CompileRunGcc()<CR>
function CompileRunGcc()
    exec "w"
    if &filetype == 'c'
	exec "!g++ % -std=c++11 -o %<"
	exec "!time ./%<"
""       exec """g++ % -o %<"
""	exec """:ter ++rows=12 ./%<"
    elseif &filetype == 'cpp'
	exec "!g++ % -std=c++11 -o %<"
	exec "!time ./%<"
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

" 打开vim时,自动打开NERDTree
" autocmd vimenter * NERDTree 
" 设置NerdTree打开的快捷键,可自行更改
map <C-c> :NERDTreeMirror<CR>
map <C-c> :NERDTreeToggle<CR>
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0
let NERDTreeIgnore =['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


""""""""""""""""""""""""""""""""skywind3000""""""""""""""""""""""""""""""""""
"不要自动选择第一个选项
set completeopt=menu,menuone,noselect
"禁止在下方显示哆嗦的提示
set shortmess+=c
"自动补全
let g:apc_enable_ft = {'*':1}


""""""""""""""""""""""""""""""""ale""""""""""""""""""""""""""""""""""
"打开文件时不检查
let g:ale_lint_on_enter=0
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
\	'c++': ['g++'],
\	'c': ['clang'],
\}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""vim-cpp-enhanced-highlight""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim color file
set background=dark
set t_Co=256 "告知molokai，终端支持256色。
"colorscheme molokai 
colorscheme gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1 "添加行，vim启动时启用
let g:indent_guides_start_level = 1           "添加行，开始显示对齐线的缩进级别
let g:indent_guides_guide_size = 1           "添加行，对齐线的宽度，（1字符）
let g:indent_guides_tab_guides = 0            "添加行，对tab对齐的禁用

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"翻译插件配置
" <Leader>t 翻译光标下的文本，在命令行回显
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
" Leader>w 翻译光标下的文本，在窗口中显示
nmap <silent> <Leader>r <Plug>TranslateW
vmap <silent> <Leader>r <Plug>TranslateWV
" Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>w <Plug>TranslateR
vmap <silent> <Leader>w <Plug>TranslateRV
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置书签
let g:startify_bookmarks            = [
            \ '~/C-Work',
            \]
"起始页显示的列表长度
let g:startify_files_number = 5
"自动加载session
let g:startify_session_autoload = 1
"过滤列表，支持正则表达式
let g:startify_skiplist = [
       \ '^/tmp',
       \ ]
"自定义Header和Footer
let g:startify_custom_header = [
		\'    ___       ___       ___       ___       ___       ___   ',
		\'   /\__\     /\  \     /\  \     /\__\     /\  \     /\  \  ',
		\'  /:/__/_   /::\  \   _\:\  \   /:/ _/_   /::\  \   _\:\  \ ',
		\' /::\/\__\ /::\:\__\ /\/::\__\ /::-"\__\ /::\:\__\ /::::\__\',
		\' \/\::/  / \/\::/  / \::/\/__/ \;:;-",-" \:\:\/  / \::;;/__/',
		\'   /:/  /    /:/  /   \:\__\    |:|  |    \:\/  /   \:\__\  ',
		\'   \/__/     \/__/     \/__/     \|__|     \/__/     \/__/  ',
	        \]
let g:startify_custom_footer = [
            \ '+------------------------------+',
	    \' ____ ____ ____ ____ ____ ____',
	    \'||H |||a |||i |||k |||e |||z ||',
	    \'||__|||__|||__|||__|||__|||__||',
	    \'|/__\|/__\|/__\|/__\|/__\|/__\|',
            \ '|     Keep an open mind!       |',
            \ '+----------------+-------------+',
            \]

source /home/pi/.vim/plugged/vim-auto-popmenu/plugin/apc.vim

