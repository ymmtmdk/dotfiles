set -x TERM xterm-256color
set -x EDITOR (which nvim)
set -x SHELL (which fish)

bobthefish_color
autoll

function __fish_command_not_found_handler --on-event fish_command_not_found
  autocdz $argv
end

function fish_title
  if [ $SSH_CONNECTION ]
    echo "$USER@"(hostname)": "
end
prompt_pwd
end

source ~/dotfiles/fish/aliases.fish
source ~/dotfiles/fish/each_arch.fish

function fish_user_key_bindings
  # C-^
  bind \x1e 'cd ..; and commandline -f repaint'
  # C-<
  bind \cu prevd-or-backward-word
  bind -k f1 prevd-or-backward-word
  # C->
  bind \co nextd-or-forward-word
  bind -k f2 nextd-or-forward-word
  bind \cr 'peco_select_history_with_c (commandline)'
  bind \cx peco_kill
  bind \cd delete-char
  bind \cs forward-kill-word
  bind \cs kill-word
end

