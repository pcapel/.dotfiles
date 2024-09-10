# My Dotfiles
I use the bare repository approach to manage my dot files. A good breakdown is
[here](https://www.atlassian.com/git/tutorials/dotfiles). The reasoning for me
was pretty simple, I don't like having all those symlinks cluttering my view of
the home directory.

I've started to play with using [nushell](https://www.nushell.sh/), so I wrote a [helper
command](https://github.com/pcapel/.dotfiles/blob/main/.config/nushell/dotfile.nu)
and use some environment variables. Though I can't pass flags to commands
because the command `dots` needs to be explicitly written with them. That's a
pain, but I dunno. Maybe it should just be an alias?

For nix, I use `nix-env -ir --file base_env.nix`. This is a [clean
installation](https://nix.dev/manual/nix/2.18/command-ref/nix-env/install#flags)
of all the packages that I normally use for development. I will usually use a
`shell.nix` file for different project specific dependencies as well. This
process could probably use some work though. It really depends on the work
context, so a little tricky.



# TODO
- [ ] Figure out why treesitter keeps installing plugins on startup
- [ ] Sort out the `query.get_query` `query.get` deprecation
- [ ] Sort out why mason keeps screaming at me about tools
- [ ] Look into why indent blank line keeps having issues
- [ ] Figure out how to get wezterm to install successfully
- [ ] Inventory Neovim plugins
- [ ] Sort out debugging story in Elixir
- [ ] Learn more nix and figure out better configuration
- [ ] Come up with a "fresh install" story and write up some scripts
- [ ] Get nushell to be default for zellij
- [ ] Get a way to automatically start shells with base environment
