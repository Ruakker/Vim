" File              : _vimrc
" Author            : Ruakker <i@ruakker.cn>
" Date              : 2021/08/21
" Last Modified Date: 2021/08/21
""""My Plugin""""
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'luochen1990/rainbow'
Plug 'joshdick/onedark.vim'
Plug 'alpertuna/vim-header'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdtree'

Plug 'kana/vim-operator-user'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'rhysd/vim-clang-format'
call plug#end()

""Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='deus'

""ALE
"始终开启标志列与红色波浪线
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
"自定义 error 和 warning 图标
let g:ale_sign_error = '!>'
let g:ale_sign_warning = '?>'
let g:ale_echo_msg_format = '[%severity%] %s' "显示Linter名称,出错或警告等相关信息
"避免 Clang 与 GCC 冲突
let g:ale_linters = {
\ 'cpp': ['g++'],
\ 'c': ['gcc'],
\}
let g:ale_c_cc_executable = 'gcc' "Or use 'clang'
let g:ale_cpp_cc_executable = 'g++' "Or use 'clang++'
let g:ale_c_cc_options = '-std=c11 -Wall'
let g:ale_cpp_cc_options = '-std=c++11 -Wall -DDEBUG'


""Indent Guides
let g:indent_guides_enable_on_vim_startup = 1

""Rainbow 配置
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

""onedark theme"
colorscheme onedark
let g:onedark_hide_endofbuffer = 1

""Vim Header
let g:header_field_author = 'Ruakker'
let g:header_field_author_email = 'i@ruakker.cn'
let g:header_field_timestamp_format = '%Y/%m/%d'
let g:header_field_modified_by = 0
map <F4> :AddHeader<CR>

""vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_no_function_highlight = 1

""ClangFormat
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "IndentWidth" : 4,
			\ "TabWidth" : 4,
			\ "UseTab" : "ForIndentation",
			\ "MaxEmptyLinesToKeep" : 1,
			\ "KeepEmptyLinesAtTheStartOfBlocks" : "true",
			\ "SpacesBeforeTrailingComments" : 1,
			\ "SpaceBeforeAssignmentOperators" : "true",
			\ "SpaceBeforeParens" : "ControlStatements",
			\ "SpaceInEmptyParentheses" : "false",
			\ "SpacesInAngles" : "false",
			\ "SpacesInCStyleCastParentheses" : "false",
			\ "SpacesInParentheses" : "false",
			\ "SpacesInSquareBrackets" : "false",
			\ "BreakBeforeBraces" : "Attach",
			\ "ReflowComments" : "true",
			\ "SortIncludes" : "true",
			\ "Standard" : "Auto",
			\ "BreakBeforeTernaryOperators" : "false"}

let g:clang_format#auto_format = 1

""""My Config""""
set autochdir "自动切换输入目录
set autoread "自动加载
set autoindent "自动换行
set smartindent "同上
set cindent "同上
set cursorline "设置光标行高亮
set hlsearch "高亮搜索内容
set incsearch "动态显示匹配内容
set linebreak "自动换行
set scrolloff=3 "滚动时光标离最上下两行空行数
set fdm=indent "设置折叠方式为缩进
set foldlevel=1000 "设置缩进折叠级别
if !has('gui_running') "设置 256 色
	set t_Co=256
endif
        
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set guifont=Cascadia_Code:h12:cANSI
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"设置中文提示
language messages zh_CN.utf-8
"设置中文帮助
set helplang=cn
"设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double

set ts=4 "TabStop为4空格
set sts=4 "编辑模式下的退格量
set sw=4 "缩进量4
set noexpandtab "不让 tab 转换为空格

"colorscheme evening
set list "显示空白字符
set listchars=tab:>-,trail:.
highlight WhitespaceEOL ctermbg=red guibg=red 
match WhitespaceEOL /\s\+$/

set nocompatible "关掉乱七八糟的东西
set nowritebackup
set noswapfile "无交换文件
set nobackup "无自动备份
set noundofile "无 .un~ 文件

filetype on "侦测文件类型
filetype plugin on "载入文件类型插件
filetype indent on "载入特定缩进文件

set mouse=a
set selection=exclusive
set selectmode=mouse,key "让鼠标能用
autocmd GUIEnter * simalt ~x "打开自动全屏

set shortmess=atI "关掉“拯救可怜的乌干达儿童”
set backspace=eol,indent,start "让退格可以删掉缩进
syntax on "语法高亮
set nu "相对行号与绝对行号
augroup relative_numbser
	autocmd!
	autocmd InsertEnter * :set norelativenumber
	autocmd InsertLeave * :set relativenumber
augroup END
set showmatch "括号匹配
set ruler " 打开状态栏标尺
set cursorline "突出显示当前行
set magic "设置魔术
set guioptions-=T "隐藏工具栏
set guioptions-=m "隐藏菜单栏
set history=1000 "历史记录总数量
set laststatus=2 "总是显示状态栏
set noshowmode "关闭状态栏下方状态提示

map <F8> :call Run()<CR>
map <F9> :call St()<CR>

func! Run()
	exec "w"
	exec "!g++ % -o %< -lm -Wall -std=c++14 -O2 -DDEBUG -Wl,--stack=134217728"
	exec "!%<"
endfunc

func! St()
	exec ":!%<.exe"
endfunc

autocmd BufNewFile *.cpp exec ":call SetTitle()"

func! SetTitle()
	call setline(1, "/*")
	call append(line("."), "\tFile Name: ".expand("%"))
	call append(line(".")+1, "\tAuthor: Ruakker")
	call append(line(".")+2, "\tMail: i@ruakker.cn") 
	call append(line(".")+3, "\tCreated Time: ".strftime("%c")) 
	call append(line(".")+4, "*/")
	call append(line(".")+6, "")
	autocmd BufNewFile * normal G
endfunc

"去空行
nnoremap <F2> :g/^\s*$/d<CR>

set linespace=0 "字符间插入的像素行数目
set wildmenu "增强模式中的命令行自动完成操作
set whichwrap+=<,>,h,l "允许backspace和光标键跨越行边界
set fillchars=vert:\ ,stl:\ ,stlnc:\  "在被分割的窗口间显示空白，便于阅读
set matchtime=1 "匹配括号高亮的时间（单位是十分之一秒）


"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"以下选项在安装插件后注释关闭
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "下方状态栏

"自动补全
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i

"function! ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endfunction
