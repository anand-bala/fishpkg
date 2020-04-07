function fjrnl -d "fzf search jrnl headlines"
  set -l title (jrnl --short | fzf --tac --no-sort)
    and jrnl -on "(echo $title | cut -c 1-16)" $1
end
