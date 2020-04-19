set -l opam_dir $HOME/.opam

if test -d $opam_dir
  set -gx OPAM_HOME $opam_dir

  opam_switch default
end
