#/usr/bin/env bash

# starts the cat rack app
# outputs its pid

source /usr/local/share/chruby/chruby.sh
chruby ruby-2.7.3

bundle exec thin start 1>/dev/null &
echo $!
