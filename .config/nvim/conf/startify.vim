"Startify

nnoremap <Leader>s :Startify<CR>

let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Files']            },
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]
let g:startify_bookmarks = [
    \ { 'b'  : '~/.bashrc' },
    \ { 'x'  : '~/.xinitrc' },
    \ { 'z'  : '~/.zshrc' },            
    \ { 'i'  : '~/.config/nvim/init.vim' },            
    \ { 'wm' : '~/Documents/SOLUS/GIT_PROJECTS/wm' },
    \ { 'dwm': '~/Documents/SOLUS/GIT_PROJECTS/wm/suckless/dwm/config.h' },
    \ { 'st' : '~/Documents/SOLUS/GIT_PROJECTS/wm/suckless/st/config.def.h' },
    \ ]
let g:startify_custom_header = [
    \ ' ██████  ██ ██    ██  █████      ██    ██ ██      ██  █████  ██    ██ ',
    \ ' ██   ██ ██  ██  ██  ██   ██     ██    ██ ██      ██ ██   ██  ██  ██  ',
    \ ' ██████  ██   ████   ███████     ██    ██ ██      ██ ███████   ████   ',
    \ ' ██   ██ ██    ██    ██   ██      ██  ██  ██ ██   ██ ██   ██    ██    ',
    \ ' ██   ██ ██    ██    ██   ██       ████   ██  █████  ██   ██    ██   ',
    \]

let g:startify_custom_footer =
           \ ['', " Have a nice day vj", '']



