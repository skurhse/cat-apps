#!/usr/bin/env bash
# REQ: Installs shards. <skr 2022-01-11>
# ..............................................................................
set +B -Cefuxvo pipefail

realpath=$(realpath "${BASH_SOURCE[0]}")
dirname=$(dirname "$realpath")

cd "$dirname"/..

rm -f shard.yml

shards init

deps=$(jq -c <<EOF
{
    "athena": {
        "github": "athena-framework/framework",
        "version": "~> 0.16.0"
    }
}
EOF
)

cfg=$(yq -Y ".dependencies = $deps" <shard.yml)

rm -f shard.yml

cat >shard.yml <<<$cfg

shards install

