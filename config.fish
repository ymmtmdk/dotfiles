source ~/dotfiles/.default_env

set -x TERM xterm-256color
set -x EDITOR (which nvim)
set -x SHELL (which fish)

bobthefish_color
autoll

function __fish_command_not_found_handler --on-event fish_command_not_found
  autocdz $argv
end

source ~/dotfiles/fish/aliases.fish
source ~/dotfiles/fish/each_arch.fish

function fish_user_key_bindings
  # C-^
  bind \x1e 'cd ..; and commandline -f repaint'
  # C-<
  bind \e\[25~ prevd-or-backward-word
  # C->
  bind \e\[26~ nextd-or-forward-word
  bind \cr peco_select_history (commandline)
  bind \cx peco_tmux_pane
  bind \cd delete-char
  bind \cs forward-kill-word
  bind \cs kill-word
end

