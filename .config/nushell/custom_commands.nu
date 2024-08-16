def _worktree_opts [] {
    let table = git worktree list --porcelain 
    | split row "\n" 
    | split column " " 
    | filter {|el| $el.column1 == "worktree"}

    $table.column2
}

# Allow switching trivially between work-trees.
#
# If you don't know why yet, then learn you something new today!
# https://stackoverflow.com/questions/31935776/what-would-i-use-git-worktree-for
#
# This command is a simple way to list and switch between work-trees. This is
# merely a convenience function right now, but I plan to grow it into a more
# fully featured thing in the future.
def --env "wt" [tree: string@_worktree_opts] {
    cd $tree
}

# [Incomplete] Parse and use an environment file to run a specific command.
def "using" [env_file, block] {
     open $env_file | filter {|el| $el != ""} | inspect
    with-env {} {do $block}
}

# Check docker's disk usage.
def "checkup docker" [] {
    sudo du -sh /var/lib/docker
}
