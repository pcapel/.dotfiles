# Dotfile management
#
# The base dots command is basically a proxy for using the correct flags to run
# arbitrary git commands. Think of it like `git` and you'll be set. Requires the
# DOTFILES_GIT_DIR and DOTFILES_WORKTREE environment settings.
alias dots = git --git-dir $env.DOTFILES_GIT_DIR --work-tree $env.DOTFILES_WORKTREE
