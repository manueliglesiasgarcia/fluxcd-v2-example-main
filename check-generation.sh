#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

for dir in $(find . -name "kustomization.yaml" -exec dirname {} \;) ; do
    echo -e "\e[32m Checking generation in ${dir}\e[0m"
    
    if kubectl kustomize $dir > /dev/null
        then
            echo -e "\e[32m OK!\e[0m"
        else
            echo -e "\033[31m Failed!\e[0m"
    fi
done