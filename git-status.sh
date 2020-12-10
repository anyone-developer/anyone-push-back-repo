#!/bin/bash

tracked=$(git status -sb | tail -n +2)
hehind=$(git status -sb | sed -n 1p | grep behind)
ahead=$(git status -sb | sed -n 1p | grep ahead)

if [[ "$tracked" == "" ]] && [[ "$behind" == "" ]] && [[ "$ahead" == "" ]]; then
  echo "[INFO] There is no any changes or commits behind/ahead to the head of branch"
  exit 0
else
  if [[ "$tracked" != "" ]]; then
    echo "[INFO] track files:"
    echo "$tracked"
  fi

  if [[ "$behind" != "" ]]; then
    echo "[INFO] branch behind:"
    echo $(git status -sb | sed -n 1p)
  fi

  if [[ "$ahead" != "" ]]; then
    echo "[INFO] branch ahead:"
    echo $(git status -sb | sed -n 1p)
  fi

  exit 1
fi
