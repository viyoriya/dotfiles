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

"set background=dark
"colorscheme molokai
"colorscheme onedark

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
  if (exists("g:tablneclosebutton"))
    let s .= '%=%999XX'
  endif
  return s
endfunction
set tabline=%!Tabline()


" tab line
hi TabLine      ctermfg=255  ctermbg=238  cterm=NONE
hi TabLineSel   ctermfg=17   ctermbg=190  cterm=NONE
hi TabLineFill  ctermfg=255  ctermbg=238  cterm=NONE

