
call plug#begin(expand('~/.config/nvim/plugged'))

"******************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'mhinz/vim-startify'
Plug 'avelino/vim-bootstrap-updater'

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

"" Color
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lilydjwg/colorizer'

Plug 'joshdick/onedark.vim'
"Plug 'tomasr/molokai'
"Plug  'arp242/startscreen.vim' 
"Plug 'skywind3000/vim-quickui'

" for Java Dev
"Plug 'artur-shaik/vim-javacomplete2'

















"*****************************************************************************
call plug#end()

"Required:

filetype plugin indent on


set background=dark

colorscheme onedark
"colorscheme molokai
