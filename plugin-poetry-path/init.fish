set -l poetry_path $HOME/.poetry/bin

if test -d $poetry_path

  contains -- $poetry_path $PATH
    or set -gx PATH $poetry_path $PATH
end

