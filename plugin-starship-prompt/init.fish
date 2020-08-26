# --- Starfish setup (https://starship.rs)

# disable virtualenv prompt, it breaks starship
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

set -gx STARSHIP_SHELL "fish"

set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml
