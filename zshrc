eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$(yarn global bin)"
alias rake="bundle exec rake"
function song() {
  mkdir -p ~/Documents/Lyrics/$1;
  cd ~/Documents/Lyrics/$1;
  vim -O no.txt maybe.txt yes.txt;
}
alias rr="rerun --ignore '**/*.{js,css,scss,sass,coffee}|public/assets/|lib/fingerprint.rb' -- foreman start"
