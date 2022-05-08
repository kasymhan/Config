set fileencoding=utf-8 "VimScript files use UTF-8

"Install plugins
call plug#begin(stdpath('data') . '/plugged')
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'Hovushka/vim-monokai-tasty'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mileszs/ack.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mhinz/vim-startify'
    Plug 'tikhomirov/vim-glsl'
    Plug 'kyazdani42/nvim-tree.lua'
    " Plug 'jesseleite/vim-noh'
    Plug 'diepm/vim-rest-console'
    Plug 'vim-airline/vim-airline'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'mkitt/tabline.vim'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'nsf/gocode', { 'rtp': 'nvim' } 
    Plug 'tmsvg/pear-tree'
    Plug 'itchyny/lightline.vim'
    Plug 'josa42/vim-lightline-coc'
    Plug 'preservim/nerdtree'
    Plug 'Shougo/deoplete.nvim'
    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
    Plug '907th/vim-auto-save'
    "Before v0.5
    " Plug 'luochen1990/rainbow'
    " Plug 'jackguo380/vim-lsp-cxx-highlight'
    " Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

    "New Era
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"Color scheme
colorscheme vim-monokai-tasty       "Set theme
let g:vim_monokai_tasty_italic=1    "Support italic
let g:auto_save = 1 
let g:go_version_warning = 0
"Basic configuration
set nocompatible		"No compatibility with Vi
filetype plugin indent on	"Language detection
syntax enable			"Syntax highlighting
imap <F6> <C-x><C-o>
set termguicolors		"Full color mode
set hidden			"Do not close unsaved files
" language en_US		"Set interface language
set noshowcmd			"Do not show last command
set noshowmode			"Do not show mode in cmd
set splitbelow			"Horizontal splits go downwards
set splitright			"Vertical splits go to the right
set mouse=a			"Full-featured mouse
set mousehide			"Hide system cursor after a while
set encoding=utf-8		"Editor's encoding is UTF-8 (not file's)
set autoindent			"Repeat indent if fyletype has none
set expandtab			"Tabs are spaces now
set shiftwidth=4		"Visible width of a tab
set softtabstop=4		"Amount of spaces in a tab
set number relativenumber	"Relative line numbers with absolute current
" set signcolumn=number         "Doesn't work
set nowrap linebreak nolist	"Break lines by words
set showtabline=0		"Hide buffer list on top
set cursorline			"Highlight current line
set ignorecase			"Ignore case when searching
set smartcase			"Case sensitive search if has uppercase letters
set foldmethod=syntax		"Syntax folding
" set foldmethod=manual		"Manual folding
" set foldnestmax=10		"Maximum folding depth
" set foldlevelstart=99		"Open file unfolded, screws with 'zm' (Use zM and zR)
" set nofoldenable		"Start unfolded, enable and disable folds by 'zc'
set visualbell			"Disable annoying beeping
let mapleader="-"		"Prefix for mappings
let maplocalleader="\\"		"Scond prefix for mappings
let g:go_def_mapping_enabled=0

"Basic settings relevant to plugins
" set nobackup                  "Disable backup 1
" set nowritebackup             "Disable backup 2
set updatetime=300              "Shorter update delay for plugins
set shortmess+=c                "Don't pass messages to completion menu

"Basic commands
"Run terminal command in a split
command! -nargs=* Term :split term://<args>

"Basic mappings
"Turn off ex mode
nnoremap Q <Nop>
"Conform 'Y' to 'D' and 'C'
nnoremap Y y$
"Move within wraped line
vnoremap <Up> gk
vnoremap <Down> gj
"Copy text. Do NOT map <Esc> to anything if you use it
vnoremap <C-c> "+y
vnoremap <Space>c "+y
"Select whole text
nnoremap <Space>a ggVG
"Save file
nnoremap <Space>s :w<CR>
nnoremap <C-s> :w<CR>
"Edit config
nnoremap <Space>e :e ~/.config/nvim/init.vim<CR>
"Source config
nnoremap <Space>w :source ~/.config/nvim/init.vim<CR>
    \:echom "~/.vimrc is sourced"<CR>
"Open location list
nnoremap <Space>l :lopen<CR>
"Close location list
nnoremap <Space>q :lclose<CR>
"Remove trailing whitespace
nnoremap <Space>t :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
    \:echom "whitespace deleted"<CR>
"Turn off highlight
nnoremap <silent> <Space>h :noh<CR>
"Basic autocommands
nnoremap <F3> :set hlsearch!<CR>
augroup basicgroup
	autocmd!
	autocmd BufRead * normal zR 				"Open file unfolded, but doesn't work consistently
	"autocmd FileType c,cpp setlocal equalprg=clang-format	"gg=G uses clang-format
        autocmd TermOpen * startinsert                          "Start terminal in insert mode
augroup END
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"Plugins' configuration

"Vim-Plug
"Install new plugins
nnoremap <Space>i :PlugInstall<CR>
"Update all plugins
nnoremap <Space>u :PlugUpdate<CR>

"Startify
let g:startify_custom_header = []   "Turn off the cow

"Pear Tree
let g:pear_tree_repeatable_expand = 0   "Put closing curly bracket on CR
"Smart portion of the plugin
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"Rainbow
let g:rainbow_active = 1

"Hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']

"Colorizer
lua require'colorizer'.setup()

"TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "python", "lua", "rust"},
  highlight = {
    enable = true,
  },
}
EOF

"Lightline
let g:lightline = {
            \ 'component_function': {
            \     },
            \ 'component': {
            \       'lineinfo': "%1{line('.') . '/' . line('$')}:%-1v",
            \     },
            \ }

let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified' ],
            \            ],
            \ 'right': [ [  'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], 
            \            [ 'coc_status'], ['lineinfo' ],
            \             ]
            \ }

let g:lightline.inactive = {
            \ 'left': [ [ 'filename' ] ],
            \ 'right': [ [ 'lineinfo' ] ] }

let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '', 'right': ''
            \}

let g:lightline#coc#indicator_warnings = "WAR:"
let g:lightline#coc#indicator_errors = "ERR:"
let g:lightline#coc#indicator_info = "INF:"
let g:lightline#coc#indicator_hints = "HIN:"
let g:lightline#coc#indicator_ok = "OK"
call lightline#coc#register()

"COC-NVIM
"Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Trigger completion in place
inoremap <silent><expr> <c-space> coc#refresh()

"Show documentaion on hover
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"Highlight symbol on hover
autocmd CursorHold * silent call CocActionAsync('highlight')

"Browse diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"GoTo mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Rename symbol
nmap <leader>rn <Plug>(coc-rename)

"Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

"Format selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"Show all diagnostics.
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>

"Clangd switch source and header
nnoremap <Space>r :CocCommand clangd.switchSourceHeader<CR>

"Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

"Invoke explorer
nnoremap <silent> <F2> :CocCommand explorer --width 30 --toggle --focus --quit-on-open<CR>

"Installed extensions
let g:coc_global_extensions=[ 'coc-rust-analyzer', 'coc-pyright' , 'coc-json', 
            \   'coc-clangd', 'coc-vimlsp', 'coc-explorer', 'coc-cmake' ]

augroup plugingroup
    autocmd!
    autocmd BufNewFile,BufRead *.rchit,*.rgen,*.rmiss set filetype=glsl
augroup END
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set renderer.indent_markers.enable (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': "",
    \ 'symlink': "",
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
