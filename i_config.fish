set -x TERM xterm-256color
set -x EDITOR (which nvim)
set -x SHELL (which fish)

source ~/dotfiles/fish/aliases.fish
source ~/dotfiles/fish/each_arch.fish

starship init fish | source

source /Users/ymmtmdk/.local/share/nvim/lazy/tokyonight.nvim/extras/fish/tokyonight_moon.fish

if set --query nvm_default_version && set --query nvm_current_version
  _nvm_version_deactivate $nvm_current_version
  nvm use --silent $nvm_default_version
end

function fish_user_key_bindings
  # C-^
  bind \x1e 'cd ..; and commandline -f repaint'
  # C-,
  bind -k f1 prevd-or-backward-word
  # C-.
  bind -k f2 nextd-or-forward-word

  bind \cd delete-char
  bind \cs forward-kill-word
  bind \cs kill-word
  bind \cr 'peco_select_history_with_c (commandline)'
  # bind \cx 'peco_kill (commandline)'
  # bind \cq 'peco_nvimbuf (commandline)'
  bind \cm current_info
end

function current_info
  if test -z (commandline)
    ll
    if test (git rev-parse --is-inside-work-tree 2> /dev/null || echo false) = true
      git status -sb
    end
    echo
    echo
  else
    # 何か入力されているなら現在の入力を実行する
    # eval (commandline) だとヒストリーに残らない
    commandline -f execute
  end
  # 入力をクリアする
  commandline -f repaint
end

function fish_title
end

