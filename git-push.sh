#!/bin/bash

. ./git-status.sh

print=`GET_GIT_STATUS`
modified=$?

echo "$print"
echo ::set-output name=modified::$modified #set output

if [[ $modified != 0 ]]; then
  echo "[INFO] set user.name to: $1"
  git config --local user.name $1
  echo "[INFO] set user.email to: $2"
  git config --local user.email $2
  
  echo "[INFO] ready to git fetch"
  git fetch

  branch=$(echo $5 | cut -d "/" -f 3) #direct to push

  if [[ $3 != "" ]] && [[ $4 != "" ]]; then
    branch=$3 #pull request source branch, will rebase to target branch
  fi

  echo "[INFO] checkout branch: $branch"
  git checkout $branch

  echo "[INFO] pull --ff-only from origin $branch"
  git pull --ff-only origin $branch

  if [[ $3 != "" ]] && [[ $4 != "" ]]; then
    echo "[INFO] rebase from $4 with strategy $6"
    git rebase $4 -X $6
  fi

  git add .
  message="Automated push for workflow"
  if [[ $7 != "" ]] && [[ $8 != "" ]]; then
    message="Automated push for workflow: [$7/#$8]"
  fi
  git commit -a -m "$message"
  echo "[INFO] push to: $3"
  git push origin $3
fi

exit 0