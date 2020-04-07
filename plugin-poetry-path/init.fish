test -n $POETRY_HOME
  or set -gx $POETRY_HOME $HOME/.poetry/bin

set -l poetry_path $POETRY_HOME

if test -d $poetry_path

  contains -- $poetry_path $PATH
    or set -gx PATH $poetry_path $PATH
end

set -l name (basename (status -f) .fish){_uninstall}

function $name -e $name
  set -l i (contains -i -- $poetry_path $PATH)
    and set -e PATH[$i]
end


