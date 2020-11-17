#!/bin/bash

if [[ $1 == 1 ]]; then
  git config --local user.name $2
  git config --local user.email $3
  
  git fetch
  git checkout $4
  git pull --ff-only origin $4
  git rebase $5 -X $6
  
  git add .
  git commit -a -m "Automated push for workflow: [$7/#$8]"
  git push origin HEAD:$4
fi
