"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Load Vim-Plug
""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim_runtime/plugged')

" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'vim-airline/vim-airline-themes'

" File navigation
Plug 'scrooloose/nerdtree',{ 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ycm-core/YouCompleteMe' 
" Symble index
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'skywind3000/gutentags_plus'
Plug 'CatKang/taglist.vim'
  
" Symble index
"Plug 'ycm-core/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Preview
Plug 'skywind3000/vim-preview'

" Search
Plug 'mileszs/ack.vim'

" Object
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'h', 'cc','cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

Plug 'Raimondi/delimitMate' "自动补全括号引号 
"Plug ' 
" Markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Git
Plug 'tpope/vim-fugitive'


" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>You complete me 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim_runtime/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0  " 打开vim时不再询问是否加载ycm_extra_conf.py配置"
"set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
nnoremap <C-]> :YcmCompleter GoToDefinition<CR> "定义跳转快捷键
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR> "生命跳转
""""""""""""""""""""""""""""""
" => Load taglist
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidth =30                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Left_Window=1           "在右侧窗口中显示taglist窗口
let Tlist_Auto_Open=0
let Tlist_Auto_Update=1
let Tlist_Sort_Type="name"
let Tlist_Process_File_Always=1         "taglist始终解析文件中的tag，不管taglist是否打开
"let Tlist_Enable_Fold_Column=1
nnoremap <silent> <F2> :TlistToggle<CR>
""""""""""""""""""""""""""""""
" => airline plugin
""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


""""""""""""""""""""""""""""""
" => airline theme plugin
""""""""""""""""""""""""""""""
"let g:airline_theme='molokai'

""""""""""""""""""""""""""""""
" => Ack plugin
""""""""""""""""""""""""""""""
" Shortcuts
" ?    a quick summary of these keys, repeat to close
" o    to open (same as Enter)
" O    to open and close the quickfix window
" go   to preview file, open but maintain focus on ack.vim results
" t    to open in new tab
" T    to open in new tab without moving to it
" h    to open in horizontal split
" H    to open in horizontal split, keeping focus on the results
" v    to open in vertical split
" gv   to open in vertical split, keeping focus on the results
" q    to close the quickfix window

""""""""""""""""""""""""""""""
" => Gutentags
""""""""""""""""""""""""""""""
"" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"" 所生成的数据文件的名称
"let g:gutentags_ctags_tagfile = '.tags'
"" 同时开启 ctags 和 gtags 支持：
"let g:gutentags_modules = []
"if executable('ctags')
"    let g:gutentags_modules += ['ctags']
"endif
"if executable('gtags-cscope') && executable('gtags')
"    let g:gutentags_modules += ['gtags_cscope']
"endif
"" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"let g:gutentags_cache_dir = expand('~/.cache/tags')
"" 配置 ctags 的参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"" 如果使用 universal ctags 需要增加下面一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
"" 禁用 gutentags 自动加载 gtags 数据库的行为
"let g:gutentags_auto_add_gtags_cscope = 1
"" change focus to quickfix window after search (optional).
"let g:gutentags_plus_switch = 0

""""""""""""""""""""""""""""""
" => Ctags
""""""""""""""""""""""""""""""
" Set ctags 
"set tags=./.tags;,.tags
"noremap <leader>g g<C-]>
"noremap <leader>r :tselect<cr>
"
""""""""""""""""""""""""""""""
" => Object
""""""""""""""""""""""""""""""

" i, 和 a, ：参数对象，写代码一半在修改，现在可以用 di, 或 ci, 一次性删除/改写当前参数

" ii 和 ai ：缩进对象，同一个缩进层次的代码，可以用 vii 选中，dii / cii 删除或改写
 
" if 和 af ：函数对象，可以用 vif / dif / cif 来选中/删除/改写函数的内容

""""""""""""""""""""""""""""""
" => Fzf
""""""""""""""""""""""""""""""
"let g:fzf_command_prefix = 'Fzf'

""""""""""""""""""""""""""""""
" => LeaderF
""""""""""""""""""""""""""""""
let g:Lf_ShortcutF = '<c-f>'
let g:Lf_ShortcutB = '<c-b>'
"noremap <c-m> :LeaderfMru<cr>
"noremap <leader>f :LeaderfFunction!<cr>
noremap <c-b> :LeaderfBuffer<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'monokai'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

