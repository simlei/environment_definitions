## Initial setup

 - install go
 - `go get github.com/direnv/direnv`
 - `ln -s "$HOME/go/bin/direnv" "$HOME/bin/direnv"`

# User dotfiles:

Those go on top of the $HOME dotfiles:

## .bash_profile
This sets up just the bare requirements to source everything from this repo.

    export LOCALBASH_DIR="$HOME/environment_definitions"
    source "$LOCALBASH_DIR/path_to.bash_profile"
    
## .bashrc
.bashrc and its sources in this repository are generally for environment-agnostic aliases, functions. They may assume the environment defined in their own directories.

    source $LOCALBASH_DIR/dlr/dlr.bashrc

    
# Inheritance / hierarchical organization of environments

Concepts:

- "machine-level" software is defined by root or `~/.bash_profile` + sources, PATHed in `~/.bashrc` + sources, or is already on a login-shell-defined PATH. `direnv` is machine-global for example. The gist is that those are always available to shell sessions, whether interactive or not.
- "user-level" is (...?). The gist is that those are available to interactive shells if the `~/.envrc + sources` is sourced, as happening when there is a source_up command. Therefore, anything PATHed by .envrc in this repository is meant to be "user-level" if it is PATHed in `.envrc`. If it is PATHed in `*.bashrc`, it is supposed to be 

- any `PATH` or other variable affecting system state is managed by `.envrc` files


The default configuration is in the repo base directory and assumes default global installations. Subdirectories will want to source the defaults and adapt. Since we can't really avoid scripts writing stuff into $USER dotfiles, a principled approach __for dotfiles residing in this repository__ is needed to avoid havoc. Those are the rules:

- *.bash_profile define environment variables that specify where "global" (but per-user) 
    
# Default installations as assumed in the repository base dotfiles
 
## Pyenv and virtualenv

    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    
    ln -s "$LOCALBASH_DIR/configurations/direnv/direnvrc" "$HOME/.config/direnv/direnvrc"
    
