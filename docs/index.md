# anyone-push-back-repo

![test-create-file](https://github.com/anyone-developer/anyone-push-back-repo/workflows/test-create-file/badge.svg)
![test-delete-file](https://github.com/anyone-developer/anyone-push-back-repo/workflows/test-delete-file/badge.svg)
![license](https://badgen.net/github/license/anyone-developer/anyone-push-back-repo)

This action helps you push back to pull requests when the user made changes in action. Then use this action to push back to your repo. The action will check modification if the current branch had staged files or unstaged files. Then decide to push a commit.

*If you like my module, please buy me a coffee.*

*More and more tiny and useful GitHub action modules are on the way. Please donate to me. I accept a part-time job contract. if you need, please contact me: zhang_nan_163@163.com*

## Be noticed

Before you use this action, you should use **actions/checkout@v2** to check out your repository for this action. checkout v1 probably won't work. I would not guarantee that will work.

## Add **[Personal Access Token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line)** to avoid that push event blocking

Important: If you have other pull request checks besides the following workflow then you must use a [Personal Access Token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line) instead of the default GITHUB_TOKEN. This is due to a deliberate limitation imposed by GitHub Actions that events raised by a workflow (such as push) cannot trigger further workflow runs. This is to prevent accidental "infinite loop" situations, and as an anti-abuse measure. Using a repo scoped [Personal Access Token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line) is an approved workaround. See [this GitHub issue](https://github.com/peter-evans/create-pull-request/issues/48) for further detail on the workaround.

```yml
- uses: actions/checkout@v2
  with:
    token: ${{ secrets.PAT }}
```

## Inputs

### `strategy-option`

action will rebase to target branch with a specific strategy. usually will use -X<strategy-option>. default is 'ours'. Please reference here: https://www.atlassian.com/git/tutorials/using-branches/merge-strategy

## Outputs

### `modified`

modified flag 1 as "true" or 0 as "false"

## Example usage

```yml
uses: anyone-developer/anyone-push-back-repo@main
with:
  strategy-option: 'theirs'
```

## Donation

PalPal: https://paypal.me/nzhang4

<img src="https://raw.githubusercontent.com/anyone-developer/anyone-push-back-repo/main/misc/alipay.JPG" width="500">

<img src="https://raw.githubusercontent.com/anyone-developer/anyone-push-back-repo/main/misc/webchat_pay.JPG" width="500">


