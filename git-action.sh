#!/bin/bash

input_actor=$(if [[ "$1" == "" ]]; then echo 0; else echo "$1"; fi)
input_actor_email=$(if [[ "$2" == "" ]]; then echo 0; else echo "$2"; fi)
github_head_ref=$(if [[ "$3" == "" ]]; then echo 0; else echo "$3"; fi)
github_base_ref=$(if [[ "$4" == "" ]]; then echo 0; else echo "$4"; fi)
github_ref=$(if [[ "$5" == "" ]]; then echo 0; else echo "$5"; fi)
input_strategy_option=$(if [[ "$6" == "" ]]; then echo 0; else echo "$6"; fi)
github_workflow= $(if [[ "$7" == "" ]]; then echo 0; else echo "$7"; fi)
github_row_number=$(if [[ "$8" == "" ]]; then echo 0; else echo "$8"; fi)

sh ./git-push.sh $input_actor $input_actor_email $github_head_ref $github_base_ref $github_ref $input_strategy_option $github_workflow $github_row_number