#!/usr/bin/env bash
# REQ: Installs go, revel and revel project. <skr 2022-01-12>
# ..............................................................................
set +B -Cefuvxo pipefail

realpath=$(realpath "${BASH_SOURCE[0]}")
dirname=$(dirname "$realpath")
basepath=$(realpath "$dirname/..")

version=go1.17.6
archive=$version.linux-amd64.tar.gz

cd /tmp

wget --timestamping https://go.dev/dl/$archive

sudo rm --recursive --force /usr/local/go/

sudo tar --directory /usr/local --extract --gunzip --file $archive

export PATH="$PATH:/usr/local/go/bin"

test_version=$(go version)
[[ $test_version = "go version $version linux/amd64" ]]

go version
go get github.com/revel/revel

if declare -p GOPATH &>/dev/null; then
  export GOPATH="$GOPATH:$basepath"
else
  export GOPATH="$basepath" 
fi

cd $basepath

rm --force --recursive app
revel new -a app
# SEE: https://github.com/revel/revel/issues/1528#issuecomment-813018825 <>
cd app
! revel run -a app
go mod tidy
revel run -a app
