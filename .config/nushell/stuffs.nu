def _worktree_opts [] {
    let table = git worktree list --porcelain 
    | split row "\n" 
    | split column " " 
    | filter {|el| $el.column1 == "worktree"}

    $table.column2
}

def --env "wt" [tree: string@_worktree_opts] {
    cd $tree
}
