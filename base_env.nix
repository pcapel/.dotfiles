let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in {
  inherit (pkgs)
    # something is erroring with no tmux present, I just want it gone
    # TODO: figure out what needs tmux...
    tmux

    # Because of course we need a vcs
    git

    # Makes life a little more scriptable
    gh

    # Name a better editor that isn't emacs
    neovim

    # I'm digging it so far
    nushell

    # Because completions are something that it does really well
    fish

    # For when fish isn't enough
    carapace

    # Lovely lines
    oh-my-posh

    # Yup, just a fact of life
    kubectl

    # Because clusters are hard enough without archane API responses
    k9s

    # As per usual
    docker

    # You just gotta be sure
    gnumake

    # FAAAAAST
    ripgrep

    # Tmux was my first love, but... floating windows.
    zellij

    # spelling matters
    codespell

    # beauty is in the eye of the beholder
    prettierd
   # TODO: add prettier

    # find yo self
    fd

    # Language runtimes to allow installation using Mason until I sort out
    # handling those things with nix or similar
    rustup
    nodejs
    elixir;
}
