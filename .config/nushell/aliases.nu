# But actually... nvim
alias vim = nvim

# Helpers for running more complex git nonsense
# TODO: Consider how these might be altered into a set of functions
let _current_branch = { git rev-parse --abbrev-ref HEAD }
let _gap = { git add --patch }
let _gref = { git --no-pager diff --cached --stat | command grep " |\\s*0$" | awk '{system("command git reset " $1)}' }
let _gnap = { git add --intent-to-add --ignore-removal .; do $_gap; do $_gref  }
let _gpn = { git push --set-upstream origin (do $_current_branch) }

# Git aliases that I'm used to

# Git add -p
alias gap = do $_gap

# Git branch
alias gb = git branch

# Git commit -v
alias gc = git commit --verbose

# Git commit -a -v
alias gca = git commit --all --verbose

# You committed to the wrong branch, didn't you...
alias gundo = git reset HEAD^

alias gcl = git clean -d --force
alias gco = git checkout
alias gd = git diff
alias gdc = git diff --cached
alias gdh = git diff HEAD
alias gl = git pull
alias glg = git log --graph --oneline --decorate --color --all
alias glod = git log --oneline --decorate
alias glp = git log -p
alias gnap = do $_gnap

# Easy git push
alias gp = git push

# Git push new branch
alias gpn = do $_gpn

# Force push with lease (safe changes)
alias gplease = git push --force-with-lease

alias gpr = git pull --rebase
alias gr = git rebase
alias gra = git rebase --abort
alias grc = git rebase --continue
alias grim = git rebase --interactive main
alias gst = git status
alias gref = do $_gref

# Fun stuff for mix
alias mget = mix deps.get
alias phs = mix phx.server

# Aliasing kubectl this way has the added benefit of causing the docker prompt to display the configured context prior to opening k9s
alias k = kubectl

# ls easier
alias l = ls -a
alias ll = ls -alh

# Common operations when not inside of a poetry shell
alias pr = poetry run
alias pri = poetry run ipython
alias ppy = poetry run python
