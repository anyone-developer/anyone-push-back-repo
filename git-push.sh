#!/bin/bash

if [[ $1 == 1 ]]; then
  git config --local user.name $2
  git config --local user.email $2@users.noreply.github.com
  git fetch
  git checkout "$5"
  git rebase $6 -X$7
  git add --all
  git config --global user.signingkey $8
  git commit -am "Automated push from [$3/#$4]"
  git push
fi
