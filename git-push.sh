#!/bin/bash

if [[ $1 == 1 ]]; then
  git config --local user.name $2
  git config --local user.email $3
  git fetch
  git checkout "$6"
  git commit -am "Automated push from [$4/#$5]"
  git push
fi
