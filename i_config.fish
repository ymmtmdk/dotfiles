set -x TERM xterm-256color
set -x EDITOR (which nvim)
set -x SHELL (which fish)

set -g theme_display_git_untracked yes
set -g theme_avoid_ambiguous_glyphs yes

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
  bind -k f1 prevd-or-backward-word
  # C->
  bind -k f2 nextd-or-forward-word
  bind \cd delete-char
  bind \cs forward-kill-word
  bind \cs kill-word
  bind \cr 'peco_select_history_with_c (commandline)'
  bind \cx 'peco_kill (commandline)'
  bind \cq 'peco_nvimbuf (commandline)'
end

