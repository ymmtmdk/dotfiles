set -x TERM xterm-256color
set -x EDITOR (which nvim)
set -x SHELL (which fish)

set -g theme_display_git_untracked yes
set -g theme_avoid_ambiguous_glyphs yes
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

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
  # bind \cx 'peco_kill (commandline)'
  # bind \cq 'peco_nvimbuf (commandline)'
end

# autocdz
function autocdz
  if test (count $argv) -gt 1
    echo "fish: Unknown command '$argv[1]'" >&2
  else if test -d $argv
    cd $argv
  else if __z $argv
    echo cd $PWD
  end
end

function __fish_command_not_found_handler --on-event fish_command_not_found
  autocdz $argv
end

# autoll
# function on_fish_postexec --on-event fish_postexec
#   if test -z $argv
#     ll
#   end
# end

