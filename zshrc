eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$(yarn global bin)"
alias rake="bundle exec rake"
alias work="ssh -i ~/.ssh/ec2.pem ubuntu@ec2-52-86-42-170.compute-1.amazonaws.com"
alias rr="rerun --ignore '**/*.{js,css,scss,sass,coffee}|public/assets/|lib/fingerprint.rb' -- foreman start"
alias jekyll="bundle exec jekyll serve"
alias hot="customdisplayprofiles set ~/Library/ColorSync/Profiles/Warm.icc"
alias cold="customdisplayprofiles set ~/Library/ColorSync/Profiles/Cool.icc"