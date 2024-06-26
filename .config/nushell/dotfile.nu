let _cmd = {|sub: list| ^git --git-dir $env.DOTFILES_GIT_DIR --work-tree $env.DOTFILES_WORKTREE ...$sub}

# Dotfile management
#
# The base dotf command can be used to see the status of the dotfiles that are
# managed using a bare git repo. All of the commands herein rely on the
# DOTFILES_GIT_DIR and DOTFILES_WORKTREE environment settings.
def dotf [] {
    dotf status
}

# Show the current status of the bare repo
#
# Basically an alias for `git status`
def "dotf status" [] {
    do $_cmd ["status"]
}

# Show the current diff
#
# Basically an alias for `git diff`
def "dotf diff" [] {
    do $_cmd ["diff"]
}

# Add new dotfiles to bare repo
#
# Using a list, you can add specific files, which is useful if you want to do
# some munging. Otherwise, you may just want to add all the changes that you've
# made to already tracked files. Paths should be given relative to `~`.
def "dotf add" [paths?: list<path>, --all (-a), --patch (-p)] {
    if (not $patch and $paths == null and not $all) {
        null
    } else if ($all) {
        # TODO: better error when there's no modified
        let paths = do $_cmd ["ls-files", "--modified", $env.DOTFILES_WORKTREE] | split row "\n"
        do $_cmd ["add", ...$paths]
    } else if ($patch) {
        do $_cmd ["add", "--patch"]
    } else {
        let paths = $paths | each {|path| $"~/($path)" | path expand }
        do $_cmd ["add", ...$paths]
    }
}

# Commit dotfiles
def "dotf commit" [] {
    do $_cmd ["commit", "--verbose"]
}

# Remove a file
def --wrapped "dotf rm" [...paths] {
    let paths = $paths | each {|path| $path | path expand }
    do $_cmd ["rm", "--cached", ...$paths]
}

# Push changes
def "dotf push" [] {
    do $_cmd ["push"]
}

# Rebase for dotfiles
def --wrapped "dotf rebase" [...args] {
  do $_cmd ["rebase", ...$args ]
}
