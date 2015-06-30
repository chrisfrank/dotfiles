export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/usr/local/bin:$PATH
eval "$(rbenv init - --no-rehash)"

autoload -U compinit
compinit -C

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

export NODE_PATH=/usr/local/lib/node_modules
alias ghpublish='git checkout gh-pages; git rebase master; git push origin gh-pages; git checkout master'
alias js='jekyll serve -w'
alias nserve='supervisor bin/www'
