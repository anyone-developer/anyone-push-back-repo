#!/bin/bash

if [[ $1 == 1 ]]; then
  echo "[INFO] set user.name to:" $2
  git config --local user.name $2
  echo "[INFO] set user.email to:" $3
  git config --local user.email $3
  
  echo "[INFO] ready to git fetch"
  git fetch

  if [[ $4 == 0 ]] || [[ $5 == 0 ]]; then
    echo "[INFO] checkout branch:" $6
    git checkout $6
    echo "[INFO] pull --ff-only from origin" $6
    git pull --ff-only origin $6
    git add .
    git commit -a -m "Automated push for workflow: [$8/#$9]"
    echo "[INFO] push to:" $6
    git push origin $6
  else
    echo "[INFO] checkout branch:" $4
    git checkout $4
    echo "[INFO] pull --ff-only from origin" $4
    git pull --ff-only origin $4
    echo "[INFO] rebase from" $5 "with strategy" $7
    git rebase $5 -X $7
    git add .
    git commit -a -m "Automated push for workflow: [$8/#$9]"
    echo "[INFO] push to:" $4
    git push origin $4
  fi

fi
