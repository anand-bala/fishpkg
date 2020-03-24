# Based on https://github.com/halostatue/fish-haskell/

function __plugin_haskell_bin_paths
  for p in $argv
    if test -d $p
      contains -- $p/bin in $PATH
      or contains -- $p/bin in $fish_user_paths
      or set -gx PATH $p/bin $PATH
    end
  end
end

__plugin_haskell_bin_paths $HOME/.cabal

set -q GHCUP_INSTALL_BASE_PREFIX
and set -l ghcup_install $GHCUP_INSTALL_BASE_PREFIX/.ghcup
or set -l ghcup_install $HOME/.ghcup

test -f $ghcup_install/env
and __plugin_haskell_bin_paths $ghcup_install

functions -e __plugin_haskell_bin_paths

set -l name (basename (status -f) .fish){_uninstall}

function $name -e $name
  set -l rem_paths $HOME/.cabal $HOME/.ghcup $GHCUP_INSTALL_BASE_PREFIX/.ghcup
  for p in $rem_paths
    set -l i (contains -i -- $p/bin $PATH)
    and set -e PATH[$i]
  end
end
