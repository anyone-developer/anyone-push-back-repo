#!/bin/bash

function GET_GIT_STATUS()
{
  tracked=$(git status -sb | tail -n +2)
  hehind=$(git status -sb | sed -n 1p | grep behind)
  ahead=$(git status -sb | sed -n 1p | grep ahead)

  if [[ "$tracked" == "" ]] && [[ "$behind" == "" ]] && [[ "$ahead" == "" ]]; then
    echo "[INFO] There is no any changes or commits behind/ahead to the head of branch"
    return 0
  else
    if [[ "$tracked" != "" ]]; then
      echo "[INFO] track files:"
      echo "$tracked"
    fi
    
    if [[ "$behind" != "" ]] || [[ "$ahead" != "" ]]; then
      echo "[INFO] branch ahead/behind:"
      echo $(git status -sb | sed -n 1p)
    fi

    return 1
  fi
}

print=`GET_GIT_STATUS`
echo ::set-output name=modified::$?
echo "$print"