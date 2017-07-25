autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight NonText ctermfg=234 ctermbg=none
autocmd BufRead,BufNewFile *.conf setfiletype conf
autocmd FileType vue syntax sync fromstart

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
set title
set showtabline=2
set autochdir
set nobackup
set backupskip+=/private/tmp/*

" show whitespaces
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

let g:terminal_scrollback_buffer_size = 2000

let g:gitgutter_signs = 0

let g:auto_save = 1
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
set updatetime=700
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1
" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_typescript_tsc_args = "--experimentalDecorators --target ES5"
let g:syntastic_typescript_tsc_args = "--target ES5"
let g:syntastic_typescript_checkers = ['tslint', 'tsc']

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <C-t><C-[> <C-\><C-n>
tnoremap <silent> <F1> <C-[>OP
tnoremap <silent> <F2> <C-[>OQ
tnoremap <silent> <F3> <C-[>OR
tnoremap <silent> <F4> <C-[>OS
tnoremap <silent> <F5> <C-[>[15~
tnoremap <silent> <F6> <C-[>[17~
tnoremap <silent> <F7> <C-[>[18~
tnoremap <silent> <F8> <C-[>[19~
tnoremap <silent> <F9> <C-[>[20~
tnoremap <silent> <F10> <C-[>[21~
tnoremap <silent> <F11> <C-[>[23~
tnoremap <silent> <F12> <C-[>[24~
tnoremap <silent> <F13> <C-\><C-n>1gt
tnoremap <silent> <F14> <C-\><C-n>2gt
tnoremap <silent> <F15> <C-\><C-n>3gt
tnoremap <silent> <F16> <C-\><C-n>4gt
tnoremap <silent> <F17> <C-\><C-n>5gt
" tnoremap <C-t><C-n> <C-\><C-n>:!nexttab<cr>
" tnoremap <C-t>n <C-\><C-n>:!nexttab<cr>

inoremap <C-C> <Esc>
inoremap <C-D> <Del>
nnoremap <silent> <F13> 1gt
nnoremap <silent> <F14> 2gt
nnoremap <silent> <F15> 3gt
nnoremap <silent> <F16> 4gt
nnoremap <silent> <F17> 5gt
nnoremap <silent> <F18> 6gt
nnoremap <silent> <F19> 7gt
nnoremap <silent> <F20> 8gt

inoremap <C-Z> <C-O>1gt
nnoremap <C-Z> 1gt

cnoremap <C-a> <Home>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

cmap <C-s> <Plug>(cmdlineplus-forward-word)<C-w>
cmap <F1> <Plug>(cmdlineplus-backward-word)
cmap <F2> <Plug>(cmdlineplus-forward-word)

nnoremap <C-k> d$

nnoremap <F5> :UndotreeToggle<cr>
nnoremap <C-s><C-o> :Texplore<cr>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

function! TermTitleString()
  if exists('b:term_title')
    return b:term_title
  else
    return expand("%:t")
  endif
endfunction

augroup Vimrc
  function! s:weak_save()
    if filewritable(expand('%')) && &modified
      write
    endif
  endfunction

  autocmd!

  " autocmd FocusLost *.rb,*.js normal mugg=G`u
  autocmd FocusGained * checktime
  autocmd TabEnter * checktime

  autocmd TabEnter term://* startinsert

  autocmd TabNew * setlocal titlestring=%{TermTitleString()}
  autocmd TermOpen * setlocal titlestring=%{TermTitleString()}
  autocmd TabEnter term://* setlocal titlestring=%{TermTitleString()}
  autocmd TabLeave term://* setlocal titlestring=%{TermTitleString()}
  autocmd TabLeave * call s:weak_save()

  autocmd BufWritePre * FixWhitespace
  autocmd Filetype * setlocal formatoptions-=ro
  autocmd InsertLeave * call s:weak_save()
augroup END

source ~/dotfiles/vim/lightline-conf.vim

