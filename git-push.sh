#!/bin/bash

if [[ $1 == 1 ]]; then
  echo "set user.name to:" $2
  git config --local user.name $2
  echo "set user.email to:" $3
  git config --local user.email $3
  
  echo "ready to git fetch"
  git fetch

  if [[ $4 == 0 ]] || [[ $5 == 0 ]]; then
    echo "will directly push to:" $6
    git add .
    git commit -a -m "Automated push for workflow: [$8/#$9]"
    git push origin $6
  else
    echo "checkout branch:" $4
    git checkout $4
    echo "pull --ff-only from origin" $4
    git pull --ff-only origin $4
    echo "rebase from" $5 "with strategy" $7
    git rebase $5 -X $7
    echo "push to:" $4
    git add .
    git commit -a -m "Automated push for workflow: [$8/#$9]"
    git push origin HEAD:$4
  fi

fi
