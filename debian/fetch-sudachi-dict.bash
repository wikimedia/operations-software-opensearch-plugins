#!/bin/bash


ROOT_DIR=$1
DICT_URL="https://d2ej7fkh96fzlu.cloudfront.net/sudachidict/sudachi-dictionary-20250129-core.zip"

temp_dir=$(mktemp -d)

set -e
trap "{ rm -f $LOCKFILE; }" EXIT

curl -fLo "${temp_dir}/dict.zip" "${DICT_URL}"
unzip -j "${temp_dir}/dict.zip" -d "${temp_dir}/sudachi-dict"
mkdir -p "${ROOT_DIR}/usr/share/opensearch/config/sudachi/"
cp -a "${temp_dir}/sudachi-dict/system_core.dic" "${ROOT_DIR}/usr/share/opensearch/config/sudachi/"
