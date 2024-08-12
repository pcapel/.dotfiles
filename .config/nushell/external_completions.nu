# TODO: dotf add <tab> should provide completions where files are ordered by
# 1. untracked changes to known files
# 2. files within the home directory that are `.file`
# 3. files that are within `$HOME/.config`

export def fish_completer [spans: list<string>] {
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | $"value(char tab)description(char newline)" + $in
    | from tsv --flexible --no-infer
}

export def carapace_completer [spans: list<string>] {
    carapace $spans.0 nushell ...$spans
    | from json
    | if ($in | default [] | where value == $"($spans | last)ERR" | is-empty) {$in} else {null}
}

export def external_completer [spans: list<string>] {
    let expanded_alias = scope aliases 
    | where name == $spans.0 
    | get -i 0
    | get -i expansion

    let tokens = if $expanded_alias != null  {
        $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
    } else if $spans.0 == dots {
        # TODO: this gets command completions, but it fails to get file
        # completions...
        $spans | skip 1 | prepend "git"
    } else {
        $spans
    }

    match $tokens.0 {
        nu => (fish_completer $tokens)
        git => (fish_completer $tokens)
        _ => (carapace_completer $tokens)
    }
}

