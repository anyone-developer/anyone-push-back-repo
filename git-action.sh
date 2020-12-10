#!/bin/bash

input_actor=$(if [[ "${{ inputs.actor }}" == "" ]]; then echo 0; else echo "${{ inputs.actor }}"; fi)
input_actor_email=$(if [[ "${{ inputs.actor-email }}" == "" ]]; then echo 0; else echo "${{ inputs.actor-email }}"; fi)
github_head_ref=$(if [[ "${{github.head_ref}}" == "" ]]; then echo 0; else echo "${{github.head_ref}}"; fi)
github_base_ref=$(if [[ "${{github.base_ref}}" == "" ]]; then echo 0; else echo "${{github.base_ref}}"; fi)
github_ref=$(if [[ "${{github.ref}}" == "" ]]; then echo 0; else echo "${{github.ref}}"; fi)
input_strategy_option=$(if [[ "${{ inputs.strategy-option }}" == "" ]]; then echo 0; else echo "${{ inputs.strategy-option }}"; fi)
github_workflow= $(if [[ "${{github.workflow}}" == "" ]]; then echo 0; else echo "${{github.workflow}}"; fi)
github_row_number=$(if [[ "${{github.run_number}}" == "" ]]; then echo 0; else echo "${{github.run_number}}"; fi)

sh ./git-push.sh $input_actor $input_actor_email $github_head_ref $github_base_ref $github_ref $input_strategy_option $github_workflow $github_row_number