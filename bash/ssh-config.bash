#!/bin/bash

# generates and installs an ssh identity file for GitHub

email="$(git config --global user.email)"
if [[ -z "$email" ]]
then
  read -p email: email
fi

# https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key
ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/github_rsa

cat <<EOF >>~/.ssh/config
host github.com
 IdentityFile ~/.ssh/github_rsa
EOF
