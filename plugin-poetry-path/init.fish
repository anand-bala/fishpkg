if test -z "$POETRY_HOME"
  set -gx POETRY_HOME $HOME/.poetry/bin
end

set -l poetry_path $POETRY_HOME

if test -d $poetry_path

  contains -- $poetry_path $PATH
    or set -gx PATH $poetry_path $PATH
end

