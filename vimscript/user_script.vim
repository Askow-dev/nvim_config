let g:blamer_enabled = 1
let g:blamer_delay = 1500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_template = '<commit-short> : <author>, <committer-time> • <summary>'

let g:git_messenger_always_into_popup = v:true

"nnoremap <leader>gd :call GitDiff()<cr>

set noexpandtab

"Disable macro recording
map q <Nop>

"define :Tidy command to run perltidy on visual selection || entire buffer"
command -range=% -nargs=* Tidy <line1>,<line2>!perltidy

"run :Tidy on entire buffer and return cursor to (approximate) original position"
fun DoTidy()
    let l = line(".")
    let c = col(".")
    :Tidy
    call cursor(l, c)
endfun

"shortcut for normal mode to run on entire buffer then return to current line"
au Filetype perl nmap <F2> :call DoTidy()<CR>

"shortcut for visual mode to run on the current visual selection"
au Filetype perl vmap <F2> :Tidy<CR>
autocmd BufNewFile,BufRead *[jJ]enkinsfile set syntax=groovy
" autocmd CursorHold * lua vim.diagnostic.open_float({scope="line"})
nnoremap <F4> :call Termpy() <CR>
" Create a function to open a neovim terminal in a small split window and run python
function! Termpy()
  exec winheight(0)/4."split" | terminal python3 %
endfunction
