# But actually... nvim
alias vim = nvim

# Helpers for running more complex git nonsense
# TODO: Consider how these might be altered into a set of functions
let _gap = { git add -p }
let _gref = { git --no-pager diff --cached --stat | command grep " |\\s*0$" | awk '{system("command git reset " $1)}' }
let _gnap = { git add -N --ignore-removal .; do $_gap; do $_gref  }

# Git aliases that I'm used to
alias gap = do $_gap
alias gb = git branch
alias gc = git commit -v
alias gca = git commit -a -v
alias gcl = git clean -f -d
alias gco = git checkout
alias gd = git diff
alias gdc = git diff --cached
alias gdh = git diff HEAD
alias gl = git pull
alias glg = git log --graph --oneline --decorate --color --all
alias glod = git log --oneline --decorate
alias glp = git log -p
alias gnap = do $_gnap
alias gp = git push
alias gplease = git push --force-with-lease
alias gpr = git pull --rebase
alias gr = git rebase
alias gra = git rebase --abort
alias grc = git rebase --continue
alias grim = git rebase -i main
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
