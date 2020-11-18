#!/bin/bash

if [[ $1 == 1 ]]; then
  git config --local user.name $2
  git config --local user.email $3
  
  git fetch

  if [[ $4 == 0 ]] || [[ $5 == 0 ]]; then
    git add .
    git commit -a -m "Automated push for workflow: [$8/#$9]"
    git push origin $6
  else
    git checkout $4
    git pull --ff-only origin $4
    git rebase $5 -X $7
    git add .
    git commit -a -m "Automated push for workflow: [$8/#$9]"
    git push origin HEAD:$4
  fi

fi
