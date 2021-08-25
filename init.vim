""""My Plugin""""
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'machakann/vim-highlightedyank'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/vim-terminal-help'

Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'pseewald/vim-anyfold'
Plug 'dstein64/vim-startuptime'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

Plug 'kana/vim-operator-user'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'rhysd/vim-clang-format'

Plug 'mbbill/undotree'
call plug#end()

""AsyncRun
" open quickfix window automatically when AsyncRun is executed
" set the quickfix window 6 lines height.
let g:asyncrun_open = 10
noremap <silent> <F8> :AsyncRun -save=1 g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" -lm -Wall -std=c++14 -O2 -DDEBUG -Wl,--stack=134217728<cr>
" use the terminal inside vim:
noremap <silent> <F9> :cclose<cr>:AsyncRun -mode=term -pos=bottom -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>
" use the external terminal:
noremap <silent> <F10> :cclose<cr>:AsyncRun -mode=term -pos=external -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>
" F10 to toggle quickfix window
nnoremap <F11> :call asyncrun#quickfix_toggle(10)<cr>


""EnhancedHighlight
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1

""Highlight Yank
let g:highlightedyank_highlight_duration = 100

""Makrdown
let g:vim_markdown_math = 1 "Katex
let g:vim_markdown_strikethrough = 1 "删除线
let g:vim_markdown_no_extensions_in_markdown = 1 "打开文件而不是添加链接
let g:vim_markdown_folding_disabled = 1 "取消折叠

""UndoTree
nnoremap <F6> :UndotreeToggle<CR>:UndotreeFocus<CR>
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 4
endif

""CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'cra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

""commentary
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

""Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'material'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.colnr = ' :'
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ' :'
"let g:airline_symbols.maxlinenr = '☰ '
"let g:airline_symbols.dirty='⚡'

""ALE
"始终开启标志列与红色波浪线
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
"自定义 error 和 warning 图标
let g:ale_sign_error = '!>'
let g:ale_sign_warning = '?>'
let g:airline#extensions#ale#enabled = 1
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

""theme
let g:material_terminal_italics = 1
let g:material_theme_style = 'defalt'
colorscheme material

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
			\ "AlignAfterOpenBracket" : "Align",
			\ "AlignConsecutiveAssignments" : "false",
			\ "AlignConsecutiveDeclarations" : "false",
			\ "AlignEscapedNewlines" : "Right",
			\ "AlignOperands" : "true",
			\ "AlignTrailingComments" : "true",
			\ "AllowAllParametersOfDeclarationOnNextLine" : "false",
			\ "AllowShortBlocksOnASingleLine" : "true",
			\ "AllowShortCaseLabelsOnASingleLine" : "true",
			\ "AllowShortFunctionsOnASingleLine" : "All",
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AllowShortLoopsOnASingleLine" : "false",
			\ "AlwaysBreakAfterDefinitionReturnType" : "None",
			\ "AlwaysBreakAfterReturnType" : "None",
			\ "AlwaysBreakBeforeMultilineStrings" : "false",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "BinPackArguments" : "false",
			\ "BinPackParameters" : "false",
			\ "BreakBeforeBinaryOperators" : "None",
			\ "BreakBeforeBraces" : "Attach",
			\ "BreakBeforeTernaryOperators" : "false",
			\ "BreakConstructorInitializersBeforeComma" : "false",
			\ "BreakConstructorInitializers" : "BeforeColon",
			\ "ColumnLimit" : 0,
			\ "CompactNamespaces" : "false",
			\ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "false",
			\ "ConstructorInitializerIndentWidth" : 4,
			\ "ContinuationIndentWidth" : 4,
			\ "Cpp11BracedListStyle" : "true",
			\ "DerivePointerAlignment" : "false",
			\ "DisableFormat" : "false",
			\ "ExperimentalAutoDetectBinPacking" : "false",
			\ "IndentCaseLabels" : "true",
			\ "IndentPPDirectives" : "AfterHash",
			\ "IndentWidth" : 4,
			\ "IndentWrappedFunctionNames" : "false",
			\ "KeepEmptyLinesAtTheStartOfBlocks" : "true",
			\ "MaxEmptyLinesToKeep" : 1,
			\ "NamespaceIndentation" : "Inner",
			\ "ObjCBlockIndentWidth" : 4,
			\ "ObjCSpaceAfterProperty" : "false",
			\ "ObjCSpaceBeforeProtocolList" : "true",
			\ "PenaltyBreakBeforeFirstCallParameter" : 19,
			\ "PenaltyBreakComment" : 300,
			\ "PenaltyBreakFirstLessLess" : 120,
			\ "PenaltyBreakString" : 1000,
			\ "PenaltyExcessCharacter" : 1000000,
			\ "PenaltyReturnTypeOnItsOwnLine" : 60,
			\ "PointerAlignment" : "Right",
			\ "ReflowComments" : "true",
			\ "SortIncludes" : "true",
			\ "SpaceAfterCStyleCast" : "false",
			\ "SpaceAfterTemplateKeyword" : "true",
			\ "SpaceBeforeAssignmentOperators" : "true",
			\ "SpaceBeforeParens" : "ControlStatements",
			\ "SpaceInEmptyParentheses" : "false",
			\ "SpacesBeforeTrailingComments" : 1,
			\ "SpacesInAngles" : "false",
			\ "SpacesInContainerLiterals" : "false",
			\ "SpacesInCStyleCastParentheses" : "false",
			\ "SpacesInParentheses" : "false",
			\ "SpacesInSquareBrackets" : "false",
			\ "Standard" : "Auto",
			\ "TabWidth" : 4,
			\ "UseTab" : "ForIndentation"}
let g:clang_format#auto_format = 1

""""My Config""""
set autochdir "自动切换输入目录
set autoread "自动加载
set autoindent "自动换行
set smartindent "同上
set cindent "同上
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set cursorline "设置光标行高亮
set hlsearch "高亮搜索内容
set incsearch "动态显示匹配内容
set linebreak "自动换行
set scrolloff=3 "滚动时光标离最上下两行空行数
set fdm=syntax "设置折叠方式为语法
set list
set listchars=tab:\|-,trail:.

"Neovide
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_cursor_antialiasing = v:true
let neovide_remember_window_size = v:true
let g:neovide_input_use_logo = v:true
let g:neovide_fullscreen = v:false
let NEOVIDE_MULTIGRID = v:true
let g:neovide_transparency=0.5

"Netrw
let g:netrw_liststyle = 3 "tree 模式显示风格
let g:netrw_browse_split = 3 "打开窗口处于新 tab
let g:netrw_banner = 0 "隐藏上方帮助
let g:netrw_winsize = 20 "宽度为 20%

if !has('gui_running') "设置 256 色
	set t_Co=256
endif

set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set guifont=Cascadia\ Code\ PL:h12:cANSI,Consolas:h12:cANSI
" set guifont=Fira\ Code:h12:cANSI,Consolas:h12:cANSI

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"设置中文提示
language messages zh_CN.utf-8
set nocompatible "关掉乱七八糟的东西
set nowritebackup
set noswapfile "无交换文件
set nobackup "无自动备份

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
" set guioptions-=T "隐藏工具栏
" set guioptions-=m "隐藏菜单栏
set history=1000 "历史记录总数量
set laststatus=2 "总是显示状态栏
set noshowmode "关闭状态栏下方状态提示
autocmd Filetype * AnyFoldActivate               " activate for all filetypes
set foldlevel=99 " Open all folds

set wildmenu "增强模式中的命令行自动完成操作
set whichwrap+=<,>,h,l "允许backspace和光标键跨越行边界
set completeopt=longest,menu "打开文件类型检测, 加了这句才可以用智能补全

autocmd BufNewFile *.cpp, exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'cpp'
		call append(0 , '/**')
		call append(1 , ' * File              : '.expand("%"))
		call append(2 , ' * Author            : Ruakker <i@ruakker.cn>')
		call append(3 , ' * Date              : '.strftime("%Y-%m-%d %H:%M:%S"))
		call append(4 , ' */')
		call append(5 , '')
		call append(6 , '#include <bits/stdc++.h>')
		call append(7 , '#define ll long long')
		call append(8 , '#define inf 0x3f3f3f3f')
		call append(9 , '#define fre(fileName) freopen(#fileName ".in", "r", stdin), freopen(#fileName ".out", "w", stdout)')
		call append(10, '#define FastIO std::ios::sync_with_stdio(false), std::cin.tie(nullptr)')
		call append(11, 'using std::cerr;')
		call append(12, 'using std::cin;')
		call append(13, 'using std::cout;')
		call append(14, '#define endl ''\n''')
		call append(15, 'bool MEMST;')
		call append(16, '')
		call append(17, 'bool MEMED;')
		call append(18, 'signed main() {')
		call append(19, '	FastIO;')
		call append(20, '#ifdef DEBUG')
		call append(21, '	cerr << "Memory used: " << abs(&MEMST - &MEMED) / 1048576. << endl;')
		call append(22, '#endif')
		call append(23, '	')
		call append(24, '	cout.flush();')
		call append(25, '	return 0;')
		call append(26, '}')
	endif
endfunc
