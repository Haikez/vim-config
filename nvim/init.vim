"设置相对行号
set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let mapleader = ","
"let g:mapleader = ","

"exec 'cd ' . fnameescape('/Users/itgoyo/Documents/Vim')

let mapleader = ","

nmap <leader>mo :set modifiable<cr>
set modifiable

syntax on " 自动语法高亮

" 键位绑定  Keymap

"<k0> - <k9> 小键盘 0 到 9
"<S-...> Shift＋键
"<C-...> Control＋键
"<M-...> Alt＋键 或 meta＋键
"<A-...> 同 <M-...>
"<Esc> Escape 键
"<Up> 光标上移键
"<Space> 插入空格
"<Tab> 插入 Tab
"<CR> 等于 <Enter>
"<D> Command

" ACK
map <C-a> :Ack<space>

" 窗口快速切换切换
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

inoremap <leader>l <C-w>l
"使用leader+w 直接保存
"nmap <leader>w :w!<cr>
nmap <leader>q :wqall!<cr>

"解决insert模式切换回normal模式下延迟的问题 这货会影响leader的事件触发，最好别用 浪费我很多时间
"set timeoutlen=1 ttimeoutlen=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 自定义Keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <M-y>  :call AddTitle()<CR>
nnoremap <M-t> :call DateAndTime()<CR>


"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar



"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"




"MarkdownPreview
"let g:instant_markdown_port = 8888

" 退出插入模式指定类型的文件自动保存
"au InsertLeave * write



" NERDTree
 map <C-e> :NERDTreeToggle<CR>

" Tagbar
 nmap <C-t> :TagbarToggle<CR>
 " Tagbar
nmap <silent> <leader>tb :TagbarToggle<cr>

" fzf
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

nmap <C-z> :Files<CR>
nmap <C-u> :Buffers<CR>


" <Leader>f{char} to move to {char}
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f)

"nmap <Leader>w <Plug>(easymotion-overwin-w)

"nnoremap <leader>a :echo("\<leader\> works! It is set to <leader>")<CR>

" Vim-Ranger
map <leader>r :Ranger<CR>.
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
set shell=bash

" 切换buffer
" Buffer Navigation
"nmap <C-[> :bprevious<CR> 不知道mac hhkb下面是什么原因，如果是这个组合键的话，Caps映射的ESC会经常触发这个所以打算更换快捷键
"nmap <C-]> :bnext<CR>
nmap <M-[> :bprevious<CR>
nmap <M-]> :bnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" vim-airline
Plug 'vim-airline/vim-airline'

" colorscheme gruvbox
Plug 'morhetz/gruvbox'

" nerdtree
Plug 'preservim/nerdtree'

"YouCompleteMe
Plug 'Valloric/YouCompleteMe'
" Tagbar
Plug 'majutsushi/tagbar'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" MarkdownPreview
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Fzf Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf
Plug '/usr/local/opt/fzf'


" easymotion
Plug 'easymotion/vim-easymotion'

" wakatime

" indent
Plug 'nathanaelkane/vim-indent-guides'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use release branch (recommend)

" Vim-GO
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" ACK
Plug 'mileszs/ack.vim'

" Vim-Startify
Plug 'mhinz/vim-startify'

" Vim-Surround
Plug 'tpope/vim-surround'

" Vim-Ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Rainbow
Plug 'luochen1990/rainbow'

" Color
Plug 'ap/vim-css-color'


" ACK
Plug 'mileszs/ack.vim'

" Vim-Startify
Plug 'mhinz/vim-startify'

" Vim-Surround
Plug 'tpope/vim-surround'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Methods
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" 让输入上方，搜索列表在下方
    let $FZF_DEFAULT_OPTS = '--layout=reverse'

    " 打开 fzf 的方式选择 floating window
    let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

    function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction



"have indent guides enabled by default
let g:indent_guides_enable_on_vim_startup = 1

" colorscheme
set bg=dark
colorscheme gruvbox


let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
autocmd FileType go nmap <leader>r <Plug>(go-run) %<CR>
autocmd FileType go nmap <leader>b <Plug>(go-build) %<CR>
autocmd FileType go nmap <leader>t <Plug>(go-test) %<CR>


let g:rainbow_active = 1

autocmd FileType go nmap <leader>t <Plug>(go-test) %<CR>

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
 
    elseif &filetype == 'c'
        call setline(1, "#include <stdio.h>")
        call append(line("."), "int main()")    
	call append(line(".")+1,"{")
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
 
    if expand("%:e") == 'cpp'
        call append(line(".")+8, "#include <iostream>")
        call append(line(".")+9, "using namespace std;")
        call append(line(".")+10, "")
 
    elseif &filetype == 'java'
        call append(line(".")+8,"public class ".expand("%:r"))
        call append(line(".")+9,"")

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
map <C-y> :call Rungdb()<CR>
function Rungdb()
    exec "w"
    exec "!g++ % -std=c++11 -g -o %<"
    exec "!gdb ./%<"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe  代码自动补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" youcompleteme  默认tab  s-tab 和自动补全冲突
" let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
"set completeopt=longest,menu
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf=0      " 关闭加载.ycm_extra_conf.py提示
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_tags_files=1                 " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion=2                     " 从第2个键入字符就开始罗列匹配项
let g:ycm_path_to_python_interpreter='/usr/bin/python3'
" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"
"mapping
nmap <leader>gd :YcmDiags<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>           "跳转到申明处
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>            "跳转到定义处
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 黑名单,不启用
"设置YCM语义补全自动触发条件
let g:ycm_semantic_triggers =  {
	\'c' : ['->', '.'],
	\'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
	\'re!\[.*\]\s'],
	\'ocaml' : ['.', '#'],
	\'cpp,objcpp' : ['->', '.', '::'],
	\'perl' : ['->'],
	\'php' : ['->', '::'],
	\'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
	\'ruby' : ['.', '::'],
	\'lua' : ['.', ':'],
	\'erlang' : [':'],
	\}
let g:ycm_semantic_triggers =  {
			\'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\'cs,lua,javascript': ['re!\w{2}'],
			\}


