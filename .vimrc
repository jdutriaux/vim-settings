" http://www.entuall.info/blog/public/config/vimrc
"
" Liste des racourcis clavier:
"
"   * Touches fonctions
"
"é       F2 - paste mode
"       F3 - desactivate search HL
"
"   * Déplacements entre buffers
"
"       TAB - next buffer
"       Shift-TAB - previous buffer
"
"   * Window resizing
"       F4 - vertical +1
"       F5 - vertical -1
"       F6 - horizontal +1
"       F7 - horizontal -1
"
"   * Insertion mode
"       TAB : insert indent or open completion window if cursor is after a
"             character.
"       C-c : cancel completion
"
"   * Misc
"       Leader : !
"       !s - recharge le .vimrc
"       !t - Affiche/cache la liste des tags
"       !n - Toggle NerdTree
"
"   * Movement
"       !!w / !!b / !!e / !!s ... > Easymotion
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Général
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
call vundle#rc()
"
" " let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Interface plugins
Bundle 'bling/vim-airline'
Bundle 'nacitar/terminalkeys.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'christoomey/vim-tmux-navigator'


" Language specific plugins
Bundle 'kchmck/vim-coffee-script'
Bundle 'jdonaldson/vaxe'

" Utilities
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'dantler/vim-alternate'
Bundle 'moll/vim-bbye'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/powerline'

Bundle 'vhdirk/vim-cmake'

Bundle 'lervag/vim-latex'
Bundle 'moll/vim-node'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'Yggdroot/indentLine'
" Syntax highlight coloration
Bundle 'altercation/vim-colors-solarized'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'tomasr/molokai'
Bundle 'digitaltoad/vim-jade'
Bundle 'jelera/vim-javascript-syntax'

" Writing
Bundle 'tpope/vim-markdown'
Bundle 'mikewest/vimroom'
Bundle 'vim-pandoc/vim-pandoc'
"""""" END VUNDLE

"""""" General
set nocompatible
set history=400
set encoding=utf-8
set fileencoding=utf-8
set viminfo='20,\"500,h

" Pour que le backspace fonctionne convenablement
set backspace=indent,eol,start

" mapleader
let mapleader = "!"
let g:mapleader = "!"
let maplocalleader = "!"
let g:maplocalleader = "!"

" Recharger et éditer le .vimrc
nnoremap <leader>s :source ~/.vimrc<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu              " numérotation des lignes ...
set numberwidth=1   " ... mais pas plus de place que nécessaire !
set ruler           " Montre la position du curseur
set shm=tToOIA      " Formatage des messages
set showmode        " affiche le mode actuel
set showcmd         " affiche les commandes incomplètes
set wildmenu        " Menu pour la complétion des commandes
set wildmode=list:longest
set wildignore=*.o,*.bak,*.pyc,*.swp,*.jpg,*.gif,*.png

" Silence !
set noerrorbells
set visualbell t_vb=
autocmd GUIEnter * set vb t_vb=

" Mouse
set mouse=a         " la souris est activée tout le temps
set mousehide       " mais on la cache quand on s'en sert pas

set ttymouse=xterm2
set ttyfast


set noscrollbind

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Couleurs et polices
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" La coloration syntaxique
syntax on
syntax sync fromstart
autocmd BufEnter * :syntax sync fromstart

filetype plugin indent on

set t_Co=256        " 256 couleurs inside (marche avec gnome-terminal debian)
set background=light

let colors="molokai"
colorscheme molokai

if colors == "solarized"
    let g:solarized_termcolors=256
    set background=light
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    colorscheme solarized
elseif colors == "lucius"
    colorscheme lucius
    LuciusDarkLowContrast
elseif colors == "molokai"
    let g:rehash256 = 1
    colorscheme molokai
endif


if has("gui_running")
    set guifont=Dejavu\ Sans\ Mono\ 8
    set guioptions=acei
    set columns=140
    set lines=75
endif

" Filetype detection
au BufRead,BufNewFile *.hx set filetype=haxe

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation - Gestion des tabs/espaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent

" Voir :help smartindent pour comprendre le raccourci suivant
:inoremap # X<C-H>#

set smarttab        " 'shiftwidth' en début en ligne, '(soft)tabstop' ailleurs
set expandtab       " Utilise des espaces, et non des tabulations
set tabstop=2       " Indentation de 4 espaces
set softtabstop=2   " Nombre d'espaces pour une tabulation en mode édition
set shiftwidth=2    " Nombre d'espaces pour indent (<<, >>)
set shiftround      " Les tabs sont toujours multiples de shiftwidth (<<, >>)


" filetype plugin indent on

" Linux Kernel coding standard
autocmd FileType c set noexpandtab tabstop=8 shiftwidth=8

" Pep 8 style FTW
autocmd FileType python,py,javascript,js,coffee,haxe set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab

autocmd FileType html,xhtml,xml,css,mako,smarty setl tabstop=2
autocmd FileType html,xhtml,xml,css,mako,smarty setl softtabstop=2
autocmd FileType html,xhtml,xml,css,mako,smarty setl shiftwidth=2

" Supprime automatiquement les espaces de fin de ligne
autocmd BufWritePre * :%s/\s\+$//e


set ff=unix
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Édition
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline      " Montre la ligne courante
set nostartofline   " Conserve la colonne
set showmatch       " Montre le/la crochet/parenthèse/croche correspondante
set matchtime=2     " pendant 2 dixièmes de secondes
set matchpairs=(:),[:],{:},<:>
set scrolloff=10

" Enregistrement rapide
nnoremap <leader>w :w!<cr>
nnoremap <leader>m :make<cr>

" Réglages pour le python
let python_highlight_all = 1

autocmd FileType python setlocal makeprg=python\ -c\ \"import\ py_compile;\ py_compile.compile(r'%')\"
autocmd FileType python setlocal errorformat=
	\%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
	\%C\ \ \ \ %.%#,
	\%+Z%.%#Error\:\ %.%#,
	\%A\ \ File\ \"%f\"\\\,\ line\ %l,
	\%+C\ \ %.%#,
	\%-C%p^,
	\%Z%m,
	\%-G%.%#

" Réglages pour le shell
let sh_fold_enabled= 1

" La complétion intelligente
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

set pastetoggle=<F2>

vnoremap v <esc>

noremap <silent>² <esc>
inoremap <silent>² <esc>
noremap <F1> <esc>

nnoremap <leader>q :Bdelete<cr>


nnoremap <F4> :res +1<cr>
nnoremap <F5> :res -1<cr>
nnoremap <F6> :vertical res +1<cr>
nnoremap <F7> :vertical res -1<cr>

:map <Home> ^
:imap <Home> <Esc>^i

" Options pour le mode diff
set diffopt=filler,iwhite,vertical

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable      " On l'active déjà 
set foldlevel=100   " mais on ne folde rien que je n'ai demandé
set foldmarker={,}
set foldmethod=marker
set foldcolumn=0    " pas de marge à gauche pour les replis

" Récupére la sélection après une (dés)indentation shift
vnoremap <silent> < <gv
vnoremap <silent> > >gv

autocmd FileType python setlocal foldmethod=indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Recherche
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch        " hilight les recherches
set incsearch       " Recherches incrèmentales
set ignorecase      " La recherche ne tient pas compte de la casse
set smartcase       " Sauf si la recherche contient des majuscules

nnoremap <silent> <F3> :silent noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Buffers / Fenêtres / Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden          " Pour pouvoir changer de buffer sans sauvegarder
set wmh=0           " Nombre minimal de lignes pour une fenêtre
set splitright      " Nouvelle fenêtre à droite (:vsp)

" Buffer précédent/suivant
noremap <S-tab> :bp!<cr>
noremap <tab> :bn!<cr>

inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>a
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fichiers / Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set acd             " Va au répertoire du fichier en cours d'édition
set autoread        " recharge auto quand un fichier est modifié
set autowrite       " sauvegarde auto quand on quitte ou qu'on change de buffer

" cf :help backup
set nobackup
"set writebackup
"set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swap

" Le répertoire courant est celui du fichier du buffer courant
"autocmd BufEnter * :lcd %:p:h
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
nnoremap <silent> <leader>t :TagbarToggle<cr>

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Vim + tmux
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-left> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-right> :TmuxNavigateRight<cr>
nnoremap <silent> <M-up> :TmuxNavigateUp<cr>
nnoremap <silent> <M-down> :TmuxNavigateDown<cr>
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>

" Airline
set laststatus=2
set ttimeoutlen=50
set timeoutlen=500
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
if &background == "dark"
    let g:airline_theme="bubblegum"
else
    let g:airline_theme="solarized"
endif
let g:airline#extensions#tabline#enabled = 1

" Tmuxline
let g:tmuxline_powerline_separators = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" NeoComplCache
let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_disable_auto_complete = 1
let g:neocomplcache_enable_auto_select = 0

function! Smart_TabComplete(onwhite, oncharacter)
  let line = getline('.')                         " current line
  let substr = strpart(line, -1, col('.'))      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return a:onwhite
    " \<tab>"
  endif
  return a:oncharacter
  " \<C-n>"                         " file matching
endfunction

inoremap <expr><tab> Smart_TabComplete("\<tab>", "\<C-n>")
inoremap <expr><S-tab> Smart_TabComplete("\<S-tab>", "\<C-p>")
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : neocomplcache#start_manual_complete()
inoremap <expr><C-c> neocomplcache#cancel_popup()

" CamelMotion
map <silent> <S-W> <Plug>CamelCaseMotion_w
map <silent> <S-B> <Plug>CamelCaseMotion_b
map <silent> <S-E> <Plug>CamelCaseMotion_e

" tComment
map <C-e> <C-_><C-_>

" Vimroom


" Vim Cmake
map <leader>c :CMake<cr>:make<cr>

" NERDTree
map <leader>n :NERDTreeToggle<cr>

" Indentline
let g:indentLine_char = "│"
