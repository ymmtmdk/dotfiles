"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
let s:dein_dir = expand('~/.config/nvim/dein')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimshell')
  let g:deoplete#enable_at_startup = 1
  call dein#add('Shougo/deoplete.nvim')
  " call dein#add('Shougo/denite.nvim')

  call dein#add('thinca/vim-localrc')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('felixhummel/setcolors.vim')

  call dein#add('tpope/vim-commentary')
  call dein#add('mbbill/undotree')
  call dein#add('roblillack/vim-bufferlist')
  " call dein#add('scrooloose/nerdtree')
  " call dein#add('jistr/vim-nerdtree-tabs')

  " call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('vim-scripts/vim-auto-save')
  call dein#add('bronson/vim-trailing-whitespace')
  " call dein#add('thinca/vim-zenspace')

  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-entire')
  call dein#add('LeafCage/cmdlineplus.vim')

  " call dein#add('tmux-plugins/vim-tmux-focus-events')
  call dein#add('itchyny/lightline.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('cohama/agit.vim')
  call dein#add('honza/vim-snippets')

  call dein#add('Shougo/vinarise.vim')
  call dein#add('othree/yajs.vim')
  " call dein#add('dag/vim-fish')
  call dein#add('kballard/vim-fish')
  " call dein#add('onodera-punpun/vim-fish')
  call dein#add('vim-scripts/applescript.vim')
  call dein#add('gregsexton/gitv')
  call dein#add('keith/swift.vim')
  call dein#add('derekwyatt/vim-scala')
  call dein#add('mxw/vim-jsx')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('rust-lang/rust.vim')
  call dein#add('rhysd/vim-crystal')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('fatih/vim-go')
  call dein#add('udalov/kotlin-vim')
  call dein#add('posva/vim-vue')

  " Required:
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

source ~/dotfiles/vim/settings.vim

