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

  let g:deoplete#enable_at_startup = 1
  call dein#add('Shougo/deoplete.nvim')

  call dein#add('Shougo/vimshell')

  call dein#add('flazz/vim-colorschemes')
  call dein#add('felixhummel/setcolors.vim')

  call dein#add('tpope/vim-commentary', {'lazy': 0})
  call dein#add('mbbill/undotree', {'lazy': 1})
  call dein#add('roblillack/vim-bufferlist', {'lazy': 1})
  call dein#add('scrooloose/nerdtree', {'lazy': 1})

  call dein#add('ntpeters/vim-better-whitespace', {'lazy': 0})
  call dein#add('vim-scripts/vim-auto-save')
  call dein#add('bronson/vim-trailing-whitespace')

  call dein#add('kana/vim-textobj-user', {'lazy': 1})
  call dein#add('kana/vim-textobj-entire', {'lazy': 1})

  call dein#add('tmux-plugins/vim-tmux-focus-events', {'lazy': 1})
  call dein#add('itchyny/lightline.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('honza/vim-snippets', {'lazy': 1})

  call dein#add('othree/yajs.vim', {'lazy': 1})
  " call dein#add('dag/vim-fish')
  call dein#add('kballard/vim-fish')
  " call dein#add('onodera-punpun/vim-fish')
  call dein#add('vim-scripts/applescript.vim', {'lazy': 1})
  call dein#add('gregsexton/gitv', {'lazy': 1})
  call dein#add('keith/swift.vim', {'lazy': 0})
  call dein#add('derekwyatt/vim-scala', {'lazy': 1})
  call dein#add('mxw/vim-jsx', {'lazy': 1})
  call dein#add('kchmck/vim-coffee-script', {'lazy': 1})
  call dein#add('rust-lang/rust.vim', {'lazy': 1})
  call dein#add('rhysd/vim-crystal', {'lazy': 1})
  call dein#add('leafgarland/typescript-vim', {'lazy': 1})

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

