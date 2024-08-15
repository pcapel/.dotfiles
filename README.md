# My Dotfiles
I use the bare repository approach to manage my dotfiles. A good breakdown is
[here](https://www.atlassian.com/git/tutorials/dotfiles). The reasoning for me
was pretty simple, I don't like having all those symlinks cluttering my view of
the home directory.

I currently am playing with using nushell, so I wrote a [helper
command](https://github.com/pcapel/.dotfiles/blob/main/.config/nushell/dotfile.nu)
and use some environment variables. Though I can't pass flags to commands
because the command `dots` needs to be explicitly written with them. That's a
pain, but I dunno. Maybe it should just be an alias?


# TODO
- [ ] Figure out how to get wezterm to install successfully
- [ ] Inventory Neovim plugins
- [ ] Sort out debugging story in Elixir
- [ ] Learn more nix and figure out better configuration
- [ ] Come up with a "fresh install" story and write up some scripts
