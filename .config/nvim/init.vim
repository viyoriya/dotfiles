" vim-bootstrap 

"******************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = ""
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"******************************************************************************
"" Plug install packages
"*****************************************************************************
"Plug 'mhinz/vim-startify'
Plug 'avelino/vim-bootstrap-updater'

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

"" Color
Plug 'lilydjwg/colorizer'
Plug 'joshdick/onedark.vim'
"Plug 'christianchiarulli/nvcode-color-schemes.vim'
"Plug 'tomasr/molokai'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'

" for Java Dev
"Plug 'artur-shaik/vim-javacomplete2'


"*****************************************************************************
"" Custom bundles
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
set hidden

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set cursorline
"set colorcolumn=90

set fileformats=unix,dos,mac

"set tabline=
"set guitablabel=\[%N\]\ %t\ %M

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"let &colorcolumn=join(range(91,999),",")

set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"" Map leader to ,
let mapleader=','
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

let no_buffers_menu=1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number relativenumber
set background=dark
"split
"set splitbelow                          
"set splitright                        


"colorscheme molokai
colorscheme onedark
"let g:nvcode_termcolors=256
"colorscheme nvcode


"set gfn=Hack\ Font\ 20
"set guifont=Hack:syle=Regular\ 9
"set guifont=JetBrains\ Mono:style=Bold:size=25


set mousemodel=popup
set t_Co=256
set guioptions=egmrti

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
    let g:CSApprox_loaded = 1
    " IndentLine
    let g:indentLine_enabled = 1
    let g:indentLine_concealcursor = 0
    let g:indentLine_char = '┆'
    let g:indentLine_faster = 1
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=darkred
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=darkblue
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=darkblue

hi User1 ctermfg=147 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=008 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=234 ctermbg=234 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

function Totalbuffers()
    return len(getbufinfo({'buflisted':1}))
endfunction

let g:cm={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}
set statusline=
set statusline+=%0*\ %{toupper(g:cm[mode()])}\          
set statusline+=%1*\ %<%F%m%r%h%w\                 
set statusline+=%3*│                                     
set statusline+=%=                                       
set statusline+=%2*\ %Y\                                 
"set statusline+=%3*│                                     
"set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     
"set statusline+=\ [%{&ff}]                              
set statusline+=%2*\ col\ %c\                         
"set statusline+=%3*│                                     
set statusline+=%1*\ ln\ %02l/%L\               
set statusline+=%0*\ %{winnr()}/%{Totalbuffers()}\ 

"set statusline=%1*\ %{toupper(g:cm[mode()])}\ %F%m%r%h%w%=\ %Y\ col\ %c\ %1*\ ln\ %l\/%L\ %0*\ [%{winnr()}/%n]

"Tabline

let g:tablineclosebutton=1

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  if (exists("g:tablineclosebutton"))
    let s .= '%=%999XX'
  endif
  return s
endfunction
set tabline=%!Tabline()



"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
 
"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd common rules
""*****************************************************************************

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setl filetype=cmake
augroup END


" .conf file sysntax highlighting
au BufEnter,BufRead *.conf setf dosini


set autoread

"for java

autocmd FileType java setl ts=4 sw=4 sts=2 et pa+=** commentstring=//\ %s
autocmd FileType java nnoremap <buffer> <F9> :exec '!javac' shellescape(expand('%'), 1) '&& java' shellescape(expand('%:r'), 1)<cr>


"*****************************************************************************
"" Mappings
"*****************************************************************************


" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Split window
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Close window & close all except active window
noremap <Leader>wc :close<CR>
noremap <Leader>wo :only<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"Source nvim init.vim
nnoremap <leader>r :source $MYVIMRC<cr>
nnoremap <leader>o :e $MYVIMRC<cr>
"Add '"quotes"' 
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
"noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
"noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
"nnoremap <silent> <leader>b :Buffers<CR>

"Recovery commands from history through FZF
nnoremap <leader>y :history:<CR>

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap XX "+x<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows / Switching split windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


"*****************************************************************************
"" Custom configs
"*****************************************************************************

" tab line
hi TabLine      ctermfg=255  ctermbg=238  cterm=NONE
hi TabLineSel   ctermfg=17   ctermbg=190  cterm=NONE
hi TabLineFill  ctermfg=255  ctermbg=238  cterm=NONE

" Open buffers in Tab and netwr will open in left

au BufAdd,BufNewFile *.* nested tab sball


