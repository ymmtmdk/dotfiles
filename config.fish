set -gx HOMEBREW_PREFIX "/usr/local";
set -gx HOMEBREW_CELLAR "/usr/local/Cellar";
set -gx HOMEBREW_REPOSITORY "/usr/local/Homebrew";

! set -q PATH; and set PATH ''; 
set -gx PATH "/usr/local/bin" "/usr/local/sbin" "$HOME/code/mybin" $PATH;
! set -q MANPATH; and set MANPATH '';
set -gx MANPATH "/usr/local/share/man" $MANPATH;
! set -q INFOPATH; and set INFOPATH '';
set -gx INFOPATH "/usr/local/share/info" $INFOPATH;

set -gx CFLAGS "$CFLAGS -I/usr/local/include"
set -gx CXXFLAGS "$CXXFLAGS -I/usr/local/include"
# set -gx LDFLAGS "-L/usr/local/opt/ruby/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/ruby/include"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/ruby/lib/pkgconfig"

if status is-interactive
  source ~/dotfiles/i_config.fish
end

