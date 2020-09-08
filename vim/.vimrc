
"设置相对行号
set relativenumber

set nocompatible              " be iMproved, required
filetype off                  " required
 
" 窗口快速切换切
nmap J <C-w>j
nmap H <C-w>h
nmap K <C-w>k
nmap L <C-w>l
nmap W <C-w>w
nmap C <C-w>c

" 括号自动不全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap { {<CR>}<Esc>O

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'vim-scripts/indentpython.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
"autocmd vimenter * NERDTree
let g:NERDTreeWinSize = 25
let NERDTreeShowBookmarks=1
map <C-c> :NERDTreeMirror<CR>
map <C-c> :NERDTreeToggle<CR>
autocmd vimenter * if !argc()|NERDTree|endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore =['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" All of your Plugins must be added before the following line
call vundle#end()        
filetype plugin indent on  


"********************************************************************************
" 新建 .c, .h, .sh, .java .py 文件时，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
" 定义函数 SetTitle，自动插入文件头
function SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
 
    else
        call setline(1, "/**")
        call append(line("."), " * Copyright (C) 2019-2019 XXX Technology Co., Ltd. All rights reserved.")
        call append(line(".")+1, " * ")
        call append(line(".")+2, " * File Name: ".expand("%"))
        call append(line(".")+3, " * Author: NiChu")
        call append(line(".")+4, " * Mail: 1937086590@qq.com")
        call append(line(".")+5, " * Created Time: ".strftime("%Y-%m-%d %H:%M"))
        call append(line(".")+6, " */")
        call append(line(".")+7, "")
    endif
 
    if &filetype == 'c'
        call append(line(".")+8, "#include <stdio.h>")
        call append(line(".")+9, "int main()")    
	call append(line(".")+10,"{")
    elseif &filetype == 'java'
        call append(line(".")+8,"public class ".expand("%:r"))
        call append(line(".")+9,"")
    endif
 
    if expand("%:e") == 'cpp'
        call append(line(".")+8, "#include <iostream>")
        call append(line(".")+9, "using namespace std;")
        call append(line(".")+10, "")
 
    elseif expand("%:e") == 'h'
        call append(line(".")+8, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+9, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+10, "")
        call append(line(".")+11, "#ifdef __cplusplus")
        call append(line(".")+12, "extern \"C\"")
        call append(line(".")+13, "{")
        call append(line(".")+14, "#endif")
        call append(line(".")+15, "")
        call append(line(".")+16, "")
        call append(line(".")+17, "")
        call append(line(".")+18, "#ifdef __cplusplus")
        call append(line(".")+19, "}")
        call append(line(".")+20, "#endif")
        call append(line(".")+21, "")
        call append(line(".")+22, "#endif /* _".toupper(expand("%:r"))."_H */")
        call append(line(".")+23, "")
    endif
 
    " 新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc
" ************************************************************
" <F1> ~ <F12> 配置
" <F1> 打开 vim 帮助，保留
 
" ************************************************************
" 命令行模式增强，ctrl-a 到行首，ctrl-e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" 插入模式增强，ctrl-a 到行首，ctrl-e 到行尾
imap <C-a> <Esc>^
imap <C-e> <Esc>$
 
" Ctrl-n 打开/关闭相对行号显示
"nnoremap <C-n> :call RelativenumberToggle()<CR>
"function RelativenumberToggle()
"    if (&relativenumber == 1)
"       set norelativenumber number
"   else
"       set relativenumber
"   endif
"endfunc
" ************************************************************

" ************************************************************
" 使用大写字母 H、L 替换行首行尾符号
"noremap H ^
"noremap L $
 
" 把 <Tab> 替换成 4 个空格
nnoremap tt :%s/\t/    /g<CR>
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
        exec "!g++ % -o %<"
        exec "!time ./%<"
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
 
" <F8> gdb调试
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
 
" 主题设置为 solarized
"colorscheme solarized
"colorscheme molokai
"********************************************************************************
" 编码设置
"********************************************************************************
" 帮助语言首选
set helplang=cn
" 菜单使用的语言
set langmenu=zh_CN.UTF-8
" Vim 所工作的终端的字符编码方式
set termencoding=utf-8
" Vim 内部使用的字符编码方式
set encoding=utf8
" Vim 启动时会按照 fileencodings 所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，
" 并且将 fileencoding 设置为最终探测到的字符编码方式
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
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3


"********************************************************************************
" 搜索配置
"********************************************************************************
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
"set cursorline
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
" 开启行号显示
set number
" vim 中可以使用鼠标
set mouse=a
" 选择模式使用鼠标
set selectmode=mouse,key
" 共享剪贴板
set clipboard+=unnamed


