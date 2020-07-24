bind \cf '__fzf_search_current_dir'
bind \cr '__fzf_search_history'
alias glg='__fzf_search_git_log'

# If FZF_DEFAULT_OPTS is not set, then set some sane defaults. This also affects fzf outside of this plugin.
# See https://github.com/junegunn/fzf#environment-variables
if not set --query FZF_DEFAULT_OPTS
    set --export FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height 40%'
end

if not set -q FZF_DEFAULT_COMMAND
  set -gx   FZF_DEFAULT_COMMAND         "fd -L -d 4 --color always ."
end

