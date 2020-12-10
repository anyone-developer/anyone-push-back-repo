#!/bin/bash

modified=$1
actor=$2
actor_email=$3
head_ref=$4
base_ref=$5
ref=$6
strategy_option=$7
workflow=$8
run_number=$9

if [[ $modified -eq 1 ]]; then
  echo "[INFO] set user.name to: $actor"
  git config --local user.name $actor
  echo "[INFO] set user.email to: $actor_email"
  git config --local user.email $actor_email
  
  echo "[INFO] ready to git fetch"
  git fetch

  branch=$(echo $ref | cut -d "/" -f 3)

  echo "[DEBUG] ref: $ref"
  echo "[DEBUG] head_ref: $head_ref"
  echo "[DEBUG] base_ref: $base_ref"

  if [[ "$head_ref" != "_" ]] && [[ "$base_ref" != "_" ]]; then
    branch=$head_ref
  fi

  echo "[INFO] checkout branch: $branch"
  git checkout $branch

  echo "[INFO] pull --ff-only from origin $branch"
  git pull --ff-only origin $branch

  if [[ "$head_ref" != "_" ]] && [[ "$base_ref" != "_" ]]; then
    echo "[INFO] rebase from $base_ref with strategy $strategy_option"
    git rebase $base_ref -X $strategy_option
  fi

  git add .
  message="Automated push for workflow"
  if [[ "$workflow" != "_" ]] && [[ "$run_number" != "_" ]]; then
    message="Automated push for workflow: [$workflow/#$run_number]"
  fi
  git commit -a -m "$message"
  echo "[INFO] push to: $branch"
  git push origin $branch
fi

exit 0