function opam_switch

  set -l old_switch (opam switch show)

  set -gx OPAMNOENVNOTICE true
  opam switch $argv
  if test $status -ne 0
    return 1
  end
  set -l switching_to (opam switch show)

  # If $OPAM_HOME is not set, ask people to source the init.fish file ...
  if test -z "$OPAM_HOME"
    echo "OPAM_HOME is not set, did you install plugin correctly?"
    return 1
  end

  set -l old_switch_path "$OPAM_HOME/$old_switch"
  set -l switch_path "$OPAM_HOME/$switching_to"
  # Now set environment variables
  set -gx OPAM_SWITCH_PREFIX  "$switch_path"
  set -gx --path CAML_LD_LIBRARY_PATH "$switch_path/lib/stublibs" "$switch_path/lib/ocaml/stublibs" "$switch_path/lib/ocaml"
  set -gx --path OCAML_TOPLEVEL_PATH "$switch_path/lib/toplevel"

  set -l i (contains -i "$old_switch_path/man" $MANPATH)
  if test -n "$i"
    set -e --path MANPATH[$i]
  end
  set -gx --path MANPATH $MANPATH "$switch_path/man"

  set -l i (contains -i "$old_switch_path/bin" $PATH)
  if test -n "$i"
    set -e PATH[$i]
  end
  set -gx PATH $PATH "$switch_path/bin"
end
