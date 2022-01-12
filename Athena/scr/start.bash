#!/usr/bin/env bash
set +B -Cefuxvo pipefail

realpath=$(realpath "${BASH_SOURCE[0]}")
dirname=$(dirname "$realpath")

cd "$dirname"/../

crystal athena.cr 1>/dev/null &

echo $!
