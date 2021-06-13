"*****************************************************************************
"" Custom configs
"*****************************************************************************

"fun! DirCheck()
"    if &ft == 'netrw'
"        return
"    endif
"    nested tab sball
"endfun
"au BufAdd,BufNewFile * call DirCheck()


"netrw dir tree
"let g:netrw_banner = 0
""let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 18
"let g:netrw_fastbrowse = 0

""autocmd FileType netrw setl bufhidden=wipe

"function! s:close_explorer_buffers()
"    for i in range(1, bufnr('$'))
"        if getbufvar(i, '&filetype') == "netrw"
"            silent exe 'bdelete! ' . i
"        endif
"    endfor
"endfunction

"nnoremap <silent><F2> :Vexplore<CR>
"nnoremap <silent><F3> :wincmd W<CR>
"nnoremap <silent><F4> :call <sid>close_explorer_buffers()<CR>


"" fzf as file browser

command! -bang -nargs=? -complete=dir FilesWithPreview
    \ call fzf#vim#files('~/', {'options': ['--layout=reverse','--info=inline', '--preview', 'cat {}']}, <bang>0)

fun! ChangeFzfLayout(fLoKey)
    if a:fLoKey == "F2"
        let g:fzf_layout = { 'window': '70vnew' }
        call fzf#vim#files('~/')
    else
        let g:fzf_layout = {'down': '40%' }
        call fzf#vim#files('~/')
    endif    
endfun    

nnoremap <C-e> <Esc>:FilesWithPreview!<CR>'
nnoremap <C-f> <Esc>:call ChangeFzfLayout("f")<CR>'
nnoremap <F2>  <Esc>:call ChangeFzfLayout("F2")<CR>'

"inoremap <C-f> <Esc>:BLines<CR>
"inoremap <C-h> <Esc>:Hstory:<CR>
"nnoremap <C-m> <Esc>:Maps!<CR>


" Dmenu filebrowser 

fun! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfun

fun! DmenuCallAgain(fileName,cmd)
    let slash = "/"
    let fname = Chomp(system("ls -a " . a:fileName ." | dmenu -l 20 -p Dir"))
    if empty(fname)
        return
    endif
    let finalFileName = a:fileName . fname 
    let dirName       = a:fileName . fname . slash
    if(isdirectory(dirName))
     return DmenuCallAgain(dirName,a:cmd)
    endif
    execute a:cmd . finalFileName
endfun

nnoremap <Leader>e :call DmenuCallAgain($HOME."/","e")<CR>
" Too much dwm & dmenu so p shortcut
nnoremap <C-p> :call DmenuCallAgain($HOME."/","e")<CR>
nnoremap <Leader>p :call DmenuCallAgain($HOME."/","vsplit")<CR>
"I dont use this
"noremap <Leader>t :call DmenuCallAgain($HOME."/","tabe")<CR>

