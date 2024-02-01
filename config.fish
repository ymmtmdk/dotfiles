source ~/dotfiles/.default_env

if status -i
  source ~/dotfiles/i_config.fish
end

starship init fish | source

