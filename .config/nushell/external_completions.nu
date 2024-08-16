# TODO: dots completions are broken, some kind of span creation error.
# It looks like  the span creation is an overflow, meaning that it's getting
# some kind of negative value.

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
    print($expanded_alias)

    let tokens = if $expanded_alias != null  {
        $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
    } else {
        $spans
    }

    match $tokens.0 {
        nu => (fish_completer $tokens)
        git => (fish_completer $tokens)
        _ => (carapace_completer $tokens)
    }
}

