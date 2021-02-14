set nocompatible              " 去除VI一致性,必须
set nu
set history=2000
set incsearch
set ts=4

" 汇编语法高亮和默认配色
autocmd BufEnter *.asm,*.inc :setlocal filetype=nasm
autocmd BufEnter *.asm,*.inc :colorscheme darkblue 
" 读取linux学习时的配置文件
source ~/linuxProgram/.linuxvimrc
" 删除所有
nnoremap da ggdG 
" 保存, 首先要在.bashrc里设置stty -ixon把<C-s>原本暂停输入功能关了
inoremap <C-s> <ESC>:w<CR>a
nnoremap <C-s> :w<CR>
vnoremap <C-s> <ESC>:w<CR>gv
" 括号和引号补全
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i

" 循环和判断补全,防止误触发就把括号反正来
inoremap i)( if(){<CR>}<ESC>k^f(a
inoremap e)( else(){<CR>}<ESC>k^f(a
inoremap ei)( else if(){<CR>}<ESC>k^f(a
inoremap f)( for(;;){<CR>}<ESC>k^f(a
inoremap w)( while(){<CR>}<ESC>k^f(a
inoremap s)( sizeof()<ESC>i
inoremap #d #define
inoremap #in #include
inoremap #ifn #ifndef<CR>#define<CR>#endif<ESC>kkA 
filetype off                  " 必须
 
" 设置包括 vundle 和初始化相关的 runtimepath
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 "增量搜索插件
 Plugin 'haya14busa/incsearch.vim'
" 另一种选择, 指定一个 vundle 安装插件的路径
"call vundle#begin('~/some/path/here')
" 让 vundle 管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
"主题
Plugin 'altercation/vim-colors-solarized'
"目录树
Plugin 'scrooloose/nerdtree'

" 所有插件需要在下面这行之前配置
call vundle#end()            " 必须
filetype plugin indent on    " 必须
"   加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
filetype plugin on


"主题插件 
"Plugin 'altercation/vim-colors-solarized'
"设置
colorscheme solarized
let g:solarized_termtrans  = 1
let g:solarized_visibility = "high"
if has('gui_running')
	set background=light
else
	set background=dark
endif

"目录树配置
let NERDTreeHighlightCursorline = 1 " 高亮当前行
let NERDTreeShowLineNumbers = 1 " 显示行号
" <leader>nt 打开 nerdtree 窗口，在左侧栏显示
map <leader>nt :NERDTreeToggle<CR>
" <leader>tc 关闭当前的 tab
map <leader>tc :tabc<CR>
" <leader>to 关闭所有其他的 tab
map <leader>to :tabo<CR>
" <leader>ts 查看所有打开的 tab
map <leader>ts :tabs<CR>
" <leader>tp 前一个 tab
map <leader>tp :tabp<CR>
" <leader>tn 后一个 tab
map <leader>tn :tabn<CR>

