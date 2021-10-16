~~~
" .%%%%%....%%%%...%%......%%..%%...%%%%...........%%%%%....%%%%...%%%%%%..........%%%%%%..%%%%%%..%%......%%%%%%...%%%%..
" .%%..%%..%%..%%..%%......%%.%%...%%..%%..........%%..%%..%%..%%....%%............%%........%%....%%......%%......%%.....
" .%%%%%...%%..%%..%%......%%%%....%%%%%%..........%%..%%..%%..%%....%%............%%%%......%%....%%......%%%%.....%%%%..
" .%%......%%..%%..%%......%%.%%...%%..%%..........%%..%%..%%..%%....%%............%%........%%....%%......%%..........%%.
" .%%.......%%%%...%%%%%%..%%..%%..%%..%%..........%%%%%....%%%%.....%%............%%......%%%%%%..%%%%%%..%%%%%%...%%%%..
" ........................................................................................................................
" Author: Miguel
" Github: tralfarlaw@gmail.com
" E-mail: m16uel123@gmail.com 
~~~

# Configuracion de Neovim 

Este archivo de configuracion se basa en el paradigma descrito en [Literate-Config](http://azure.github.io/autorest/user/literate-file-formats/configuration.html)
Los archivos `~/.vimrc` por lo general suelen sere dificiles de documentar y mantener y es por eso que eleji escribir  este en markdown para evitar problemas a futuro y mantener el codigo ma facilmente

Este archivo puede ser un poco verbose y tener refrencias que solo yo entienda ademas de ser una mezcolanza de ingles y espanol


# Indice

1. [General](#general)
2. [Plugins](#plugins)
3. [KeyBindings]()
4. [Plugins SetUp]()
5. [Indent]()
6. [Autocomplete]()

# General

Ponemos un Reload SourceFile en `F12`

```vim
nnoremap <F11> :source $MYVIMRC<CR>
nnoremap <F12>: source $MYVIMRC \| :PlugInstall<CR>
```


Python paths para algunos plugins

```vim
if has('macunix')
  " OSX
  let g:python3_host_prog = '/usr/local/bin/python3' "---------- Set python 3 provider
  let g:python_host_prog = '/usr/local/bin/python2' "-------------- Set python 2 provider
elseif has('unix')
  " Ubuntu
  let g:python3_host_prog = '/usr/bin/python3' "---------- Set python 3 provider
  let g:python_host_prog = '/usr/bin/python' "-------------- Set python 2 provider
elseif has('win32') || has('win64')
  " Window
endif
```

## GUI Setups

```
:set guioptions-=m "-------------------------------------------- Remove menu bar
:set guioptions-=T "--------------------------------------------- Remove toolbar
:set guioptions-=r "------------------------------- Remove right-hand scroll bar
:set guioptions-=L "-------------------------------- Remove left-hand scroll baj

```

# Display Options

```
set encoding=utf8
set nowrap "---------------------------------- do not automatically wrap on load
set nospell "-------------------------------------------------- Disable spelling
set formatoptions-=t "--------------- Do not automatically wrap text when typing
set listchars=tab:\|\ ,trail:▫
set formatoptions=tcqronj "-------------------- Set vims text formatting options
set title "-------------------------------------- Let vim set the terminal title
set updatetime=500 "-------------------------------- Redraw the status bar often
set list "--------------------------------------------- Show trailing whitespace
set listchars=tab:•\ ,trail:•,extends:»,precedes:« "-- Unprintable chars mapping
set showcmd	"--------------------------------------- Display incomplete commands
set termencoding=utf-8 "------------------------------------------- Always utf-8
set fileencoding=utf-8
set hid "---------------------------------- Buffer becomes hidden when abandoned
set shortmess+=c
set cmdheight=1 "--------------------------- Just need one line for command line
set laststatus=2 "-------------------------------------- Always show status line
set showtabline=2 "----------------------------------------- Always show tabline
" set noshowmode "--------------------------- Hide default mode text (e.g. INSERT)
set display+=lastline "--------------------- As must as possible of the lastline
set signcolumn=yes "---------------------------------- Always open gutter column
set previewheight=3 "------------------------------------ Smaller preview height

set number "------------------------------------------------- Show line number
set ruler "---------- Line number, column's number, virtual column's number...
" set relativenumber "------------------------------------- Show relative number
set cursorline "-------------------- Highlight the current line for the cursor
```

## Filetypes

Para React por ejemplo

```
augroup language_react
    autocmd!
    autocmd bufnewfile,bufread *.tsx set filetype=javascriptreact
augroup END
```

## Syntax Highlight

```

syntax on "---------------------------------------------- Enable Syntax for Code
syntax enable
set foldmethod=manual "---------------------------------- Support fold by indent

```

## File Settings

```
set autoread "---------------------------------------- Auto reloaded Edited File
set noswapfile "------------------------------------------ Dont create wrap file
set nobackup "------------------------------------------------- Dont save backup
filetype plugin on "--------------------------------------------- Turn on plugin
let g:jsx_ext_required = 1 "------------------------- Dont detect js file as jsx
```

## Type Settings

```
set backspace=indent,eol,start "----------------- Allow backspace in insert mode
set tabstop=4 "---------------------------------------------- 2 spaces for 1 tab
set softtabstop=2
set shiftwidth=2
set expandtab "------------------------------------------ Add tab in insert mode
set smarttab
filetype indent on "------------------------------------- Turn on default indent
set autoindent
set smartindent
```

Setup highlingtings for search results

```
set hlsearch "------------------------------------------ Highlight search result
set incsearch "------------------------------------------ Allow Insert higtlight
```

## Folding

```
augroup folding_vim
  autocmd!
  autocmd FileType vim        setlocal foldmethod=marker
  autocmd FileType snippets   setlocal foldmethod=marker
augroup END
```
## Mouse Support
```
if has('mouse')
    set mouse=a "----------------------------- Allow use mouse, possible in nvim
endif
```
## Undo settings 

```
set undolevels=100 "------------------------------- Default is 1000 -> Too large
set undoreload=1000 "----------------------------- Default is 10000 -> Too large
set undodir=~/.config/nvim/undodir "--------------- Default folder for undo step
```


# Plugins

Cargamos  lo Plugins usando `Plug` como [Plugin Manager](https://github.com/junegunn/vim-plug) primero deveriamos instalarlo si no esta 

```vim
" Install vim-plug if not found

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Begin Plugin List
call plug#begin('~/.config/nvim/plugged')
```
## Themes

### [Purify](https://github.com/kyoz/purify)

```vim
Plug 'kyoz/purify', { 'rtp': 'vim' }
```

## Toolbar

```vim
Plug 'bling/vim-airline' "---------------------------------- Status bar, Tabline
Plug 'vim-airline/vim-airline-themes' "- Vim-Airline Themes (To use tabline ext)
Plug 'tpope/vim-fugitive' "---------- Just use to show git status in Vim-Airline
```

## Fuzzy Finder

```vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' "-------------------------------------------- fzf in vim
Plug 'mcchrish/nnn.vim'
Plug 'airblade/vim-rooter'
```

## Navegacion

```vim
Plug 'scrooloose/nerdtree' "------------------------------------------ Nerd Tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "-- Nerdtree syntax & Icon colors
Plug 'ryanoasis/vim-devicons' "------------------------------------------- Icons
Plug 'easymotion/vim-easymotion' "----------- Jump around the screen like a boss
Plug 'andymass/vim-matchup' "------------- Better % and highlight matching words
Plug 'tommcdo/vim-exchange' "-------------------------------- Easy text exchange
Plug 'rhysd/clever-f.vim' "-------------------------------- Make f more powerful
```
- [Rnvimr](https://github.com/kevinhwang91/rnvimr)
> \# ArchLinux install all requirements is extremely convenient
> yay -S ranger python-pynvim ueberzug
>
> \# pip
>
> \# macOS users please install ranger by `pip3 ranger-fm` instead of `brew install ranger`
> \# There're some issues about installation, such as https://github.com/ranger/ranger/issues/1214
> \# Please refer to the issues of ranger for more details
> pip3 install ranger-fm pynvim
> 
> \# ueberzug is not supported in macOS because it depends on X11
> pip3 install ueberzug
>
```vim
Plug 'kevinhwang91/rnvimr' "--- Testing
```

## Syntax HighLighting

```vim
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }"  Typescript's Syntax

" Help colorize text color
Plug 'ap/vim-css-color', {
  \ 'for': [
    \ 'html',
    \ 'css',
    \ 'scss',
    \ 'sass',
    \ 'less'
    \ ] }
Plug 'Valloric/MatchTagAlways' "------- Always highlights the XML/HTML tags that enclose your cursor location
Plug 'MTDL9/vim-log-highlighting', {'for': 'log'} "----------------- For Vim Log

" Frameworks
Plug 'MaxMEllon/vim-jsx-pretty' "----------------------------------------- React
Plug 'habamax/vim-godot' "-------------------------------------------------Godot
```

## Code Utilities

```vim
Plug 'tmsvg/pear-tree' "------------------------------------- Auto pair brackets
Plug 'alvan/vim-closetag' "--------------------------------- Auto close html tag
Plug 'tpope/vim-surround' "--------------------------------------- Auto surround
Plug 'tpope/vim-commentary' "------------------------------- Comment code faster
Plug 'tpope/vim-repeat' "------------------------------ dot repeat with pluggins
Plug 'Yggdroot/indentLine' "---------------------------- Indent code with v-line
Plug 'wellle/targets.vim' "--------------------- Provides additional text object
Plug 'mg979/vim-visual-multi' "--------------------------------- Multiple Cursor
Plug 'mattn/emmet-vim' "------------------------------------------ Emmet for vim
```

## Code Formating

```vim
Plug 'FooSoft/vim-argwrap' "------ Wrap and unwrap function args, list, dicts...
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'sass',
    \ 'scss',
    \ 'json',
    \ 'markdown',
    \ 'html' ] }
```

## Addons

```vim
Plug 'NLKNguyen/copy-cut-paste.vim' "---------------- Copy, Paste with Clipboard
Plug 'skywind3000/asyncrun.vim' "--------------- Run async shell commands in vim
Plug 'kyoz/ezbuf.vim' "------------------------------- Fast and easy use buffers
Plug 'kyoz/npm.vim' "-------------------------- Work with npm more easier in Vim
Plug 'segeljakt/vim-silicon'
```

### Markdown

```vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'godlygeek/tabular', {'for': 'markdown'} "-------------- Alignment for text
Plug 'dhruvasagar/vim-table-mode',{'for': 'markdown', 'do': ':TableFormat'}
Plug 'lervag/vimtex', {'for': 'tex'} "------------------- For editing Latex file

" Performance
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'tweekmonster/startuptime.vim', {'on': 'StartupTime'}

" Colors
Plug 'KabbAmine/vCoolor.vim' "------------------------------------- Color picker
Plug 'guns/xterm-color-table.vim'

" Focus
Plug 'junegunn/goyo.vim' "---------------------- Distraction-free writing in Vim
Plug 'junegunn/limelight.vim' "----------------------- Hyperfocus-writing in Vim
Plug 'RRethy/vim-illuminate' "--- Auto highlight other uses of word under cursor

" Searching
Plug 'voldikss/vim-search-me' "------------------------ Search google within vim
```

## Conqueror of Commands (CoC)

```vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```

## Notas

- [ ] MEjorar la descripcion de cada Plugin

```vim
call plug#end() "---------------------------------------- End of Vim-Plug define
```

# KeyBindings

## Leader Key `<leader>`

Declaramos la Leader Key `Space`

```vim
nnoremap <Space> <NOP>
let mapleader = " "
```

## Guardar Todo `<C-s>`

```vim
nnoremap <C-s> :wa<CR>
```

## Buffer Navigation

```vim
nnoremap gB :bprevious <CR> 
nnoremap gb :bnext <CR>
```

## Window Size 

Como ya tenemos las teclas de navegacion no necesitamos las flechas, Iniciando `Elite Mode`

```vim
nnoremap <Up>  :resize +4<CR>
nnoremap <Down> :resize -4<CR>
nnoremap <Left> :vertical resize -4<CR>
nnoremap <Right> :vertical resize +4><CR>
```

ahora las flechas nos sirven para cambial tamano de los buffers

## Movimiento

### Window Navigation

Utilizamos `Alt` para movernos entre Ventanas

```vim
map <M-j> <C-W>j
map <M-k> <C-W>k
map <M-h> <C-W>h
map <M-l> <C-W>l
```

### Tabs Navigation

Utilizamos `Ctrl` para movernos entre tabs

```vim
map <C-h> :tabprevious<CR>
map <C-l> :tabNext<CR>
```

Para el resto de las funciones de Tabs usaremos com oleader `Ctrl+T`

```vim
map <C-t> <NOP>
map <C-t>n :tabnew<CR>
map <C-t>w :tabclose<CR>
map <C-t>o :tabedit<CR>
```

### Buffers Navigation

Navegamos entre buffers con `Ctrl+j|k`

```vim
map <C-j> :bnext<CR>
map <C-k> :bprevious<CR>
```

### Code Navigation

Mapeamos
|Tecla|Comando|
|-----|-----|
|`H`|`Inicio/Home`
|`J`|`Page Down`
|`K`|`Page Up`
|`L`|`End`

```vim
map H 0
map L $
map J <PageDown>
map K <PageUp>
```

# Plugin Config

## [Nerdtree](https://github.com/preservim/nerdtree)

### Settings

```vim
let g:NERDTreeWinSize=30 "-------------------------------------- Default columns
let g:NERDTreeNaturalSort = 1

highlight! link NERDTreeFlags NERDTreeDir
```
### KeyMaps
Abrimos  y Cerratmos el NerdTree  usando `Ctrl+n`

```vim
map <C-n> :NERDTreeToggle<CR> 
```

## [DevIcons](https://github.com/ryanoasis/vim-devicons)

```
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
```

## [Airline](https://github.com/vim-airline/vim-airline)

### General
```vim
let g:airline_theme='purify' "--------------------------- Set status bar's theme
let g:airline_powerline_fonts = 1 "----------- Just work with patched NERD fonts
let g:airline_section_c = '%t' "--filename "-------------- Only show file's name
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' "- Hide format type

let g:airline#extensions#tabline#enabled = 1 "------------------- Enable tabline
let g:airline#extensions#tabline#fnamemod = ':t' "--- Just show file name in tab
let g:airline#extensions#tabline#enabled=1 "--------- Buffers at the top as tabs
let g:airline#extensions#tabline#show_tab_type=1 "---------- Don't show tab type
```

### Icons

```vim
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''

let g:airline#extensions#quickfix#quickfix_text = 'QF'
let g:airline#extensions#quickfix#location_text = 'LL'

" Disable unused extensions (Improve Performance)
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 1
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#taboo#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
```

## Fuzzy Search

En Arch linux se necesitan los siguientes paquetes para que FZF Funcione

> sudo pacman -S fzf
> 
> sudo pacman -S ripgrep
> 
> yay -S universal-ctags-git
> 
> sudo pacman -S the_silver_searcher
> 
> pacman -S fd


### Settings

```vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
```

### KeyBindings

- Con `Ctrl+P - F` buscamos en todos los archivos
- Con `Ctrl+P - B` buscamos en todos los Buffers
- Con `Ctrl+P - G` buscamos en los archivos **_Tracked_** por Git
- Con `Ctrl+P - A` buscamos en el texto de los archivos (util para encontrar funciones y constantes a lo largo de todo el proyecto)
- Con `Ctrl+P - T` buscamos en Tags
- Con `Ctrl+P - M` buscamos en Marks
- Con `Ctrl+P - R` buscamos en RipGrep

```vim
nnoremap <C-p>f :Files<CR>
nnoremap <C-P>g :GFiles<CR>
nnoremap <C-p>a :Ag<CR>
nnoremap <C-p>r :Rg<CR>
nnoremap <C-p>t :Tags<CR>
nnoremap <C-p>m :Marks<CR>
nnoremap <C-p>b :Buffers<CR>
```
## NNN

```vim
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
```
## Autoindent

```vim
let g:indentLine_char = ''
let g:indentLine_char_list = ['▏', '⎸', '|', '¦', '┆', '┊']


```
## Emmet 
```vim
" Enable just for html, css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_leader_key='tab' " Trigger emmet with ,,

autocmd FileType html,css,scss,sass,less,typescript EmmetInstall " Support files
```

## Easy Motion

```vim
map <leader><leader>. <Plug>(easymotion-repeat)
map <leader><leader>f <Plug>(easymotion-overwin-f)
map <leader><leader>j <Plug>(easymotion-overwin-line)
map <leader><leader>k <Plug>(easymotion-overwin-line)
map <leader><leader>w <Plug>(easymotion-overwin-w)
```

## Tree Pairs

```vim

let g:pear_tree_pairs = {
  \ '(':    {'closer': ')'},
  \ '[':    {'closer': ']'},
  \ '{':    {'closer': '}'},
  \ "'":    {'closer': "'"},
  \ '"':    {'closer': '"'},
  \ '/*':   {'closer': '*/'},
  \ '<!--': {'closer': '-->'}
  \ }

let g:pear_tree_repeatable_expand = 0
```

## AirWrap

```vim
nnoremap <silent> gw :ArgWrap<CR>
```

## Markdown Plugin 

```vim
autocmd FileType markdown let g:indentLine_enabled=0 " Prevent markdown side effect
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0
```

Para una Preview del Mark Down usar `Space M`

```vim
nmap <leader>m <Plug>MarkdownPreviewToggle
```

## Prettier
```vim
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'
```
## Vim Matchup

```vim
let g:matchup_matchpref = {}
let g:matchup_matchpref.vue = {'tagnameonly': 1}
let g:matchup_matchpref.html = {'tagnameonly': 1}
```

## Vim Iluminate

```vim
hi link illuminatedWord Visual
```

## ViColor

```vim
let g:vcoolor_map        = '<localleader>c'
let g:vcool_ins_rgba_map = '<localleader>C'
```

## Goyo

```vim
nnoremap <Leader>z :Goyo<CR>
```
Config Color Lime Light

```vim
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
```
Apply configs
```vim
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave silent! source $HOME/.config/nvim/init.vim
```

## Vim Search

```vim
nmap <silent> <localleader>s <Plug>SearchNormal
vmap <silent> <localleader>s <Plug>SearchVisual
```

# Indents by File

```vim
augroup languages_indent
    autocmd!
    autocmd FileType vim      setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd FileType python   setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd FileType gdscript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END
```

~~~
runtime configs/autocomplete.vim "------------------------- Autocomplete configs
~~~
