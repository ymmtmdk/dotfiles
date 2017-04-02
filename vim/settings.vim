autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

colorscheme beekai

set ignorecase
set wildignorecase
set shiftwidth=2
set autoindent
set smartindent
set expandtab
set number
set ruler
set noshowmode
set smartcase
set autoread
set undodir=~/.config/nvim/undo
set undofile
set sh=fish

tnoremap <silent> <ESC> <C-\><C-n>

let g:gitgutter_signs = 0

let g:auto_save = 1
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
set updatetime=1000
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  " call ZenkakuSpace()
endif

" map <silent> <F3> :call BufferList()<CR>
" for InsertLeave
inoremap <C-C> <Esc>
nnoremap <silent> <F13> :b 1 <CR>
nnoremap <silent> <F14> :b 2 <CR>
nnoremap <silent> <F15> :b 3 <CR>
nnoremap <silent> <F16> :b 4 <CR>
nnoremap <silent> <F17> :b 5 <CR>
nnoremap <silent> <F18> :b 6 <CR>
nnoremap <silent> <F19> :b 7 <CR>
nnoremap <silent> <F20> :b 8 <CR>

inoremap <C-Z> <C-O>:suspend<cr>
nnoremap <C-Z> :w<cr>:suspend<cr>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <F5> :UndotreeToggle<cr>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" for crontab -e
autocmd BufEnter /private/tmp/crontab.* setl backupcopy=yes
autocmd FocusLost *.rb,*.js,*.html normal mugg=G`u
autocmd BufWritePre * FixWhitespace
autocmd Filetype * setlocal formatoptions-=ro

autocmd bufnewfile,bufread *.scpt,*.applescript :setl filetype=applescript
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup Vimrc
  autocmd!
  autocmd InsertLeave * call <SID>auto_save()
  function! s:auto_save()
    if filewritable(expand('%'))
      write
    endif
  endfunction
augroup END

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_typescript_tsc_args = "--experimentalDecorators --target ES5"
let g:syntastic_typescript_tsc_args = "--target ES5"
let g:syntastic_typescript_checkers = ['tslint', 'tsc']

source ~/dotfiles/vim/lightline-conf.vim
