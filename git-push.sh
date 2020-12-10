#!/bin/bash

actor=$1
actor_email=$2
head_ref=$3
base_ref=$4
ref=$5
strategy_option=$6
workflow=$7
run_number=$8

source ./git-status.sh

print=`GET_GIT_STATUS`
modified=$?

echo "$print"
echo ::set-output name=modified::$modified #set output

if [[ $modified -eq 1 ]]; then
  echo "[INFO] set user.name to: $actor"
  git config --local user.name $actor
  echo "[INFO] set user.email to: $actor_email"
  git config --local user.email $actor_email
  
  echo "[INFO] ready to git fetch"
  git fetch

  branch=$(echo $ref | cut -d "/" -f 3) #direct to push

  if [[ $head_ref != "_" ]] && [[ $base_ref != "_" ]]; then
    branch=$head_ref #pull request source branch, will rebase to target branch
  fi

  echo "[INFO] checkout branch: $branch"
  git checkout $branch

  echo "[INFO] pull --ff-only from origin $branch"
  git pull --ff-only origin $branch

  if [[ $head_ref != "_" ]] && [[ $base_ref != "_" ]]; then
    echo "[INFO] rebase from $base_ref with strategy $strategy_option"
    git rebase $base_ref -X $strategy_option
  fi

  git add .
  message="Automated push for workflow"
  if [[ $workflow != "_" ]] && [[ $run_number != "_" ]]; then
    message="Automated push for workflow: [$workflow/#$run_number]"
  fi
  git commit -a -m "$message"
  echo "[INFO] push to: $branch"
  git push origin $branch
fi

exit 0