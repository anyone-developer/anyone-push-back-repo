# anyone-push-back-repo

![release-test](https://github.com/anyone-developer/anyone-push-back-repo/workflows/release-test/badge.svg)
![license](https://badgen.net/github/license/anyone-developer/anyone-push-back-repo)

This action help you push back to pull request when user made changes in action. Then use this action to push back to your repo. The action will check modification if current branch had staged files or unstaged files. Then decide to push commit.

*If you like my module, please buy me a coffee.*

*More and more tiny and useful github actions modules are on the way. Please donate to me. I accept part time job contract. if you need, please contact me: zhang_nan_163@163.com*

## Be noticed

Before you use this action, you should use **actions/checkout@v2** to checkout your repository for this action. checkout v1 probably won't work. I would not gurantee that will work.

## Inputs

### `user-name`

commit config user.name

### `user-email`

commit config user.email

### `ignore-directories`

the directories you want to ignore. split with comma.

## Outputs

### `modified`

modified flag 1 as "true" or 0 as "false"

## Example usage

```yml
uses: anyone-developer/anyone-push-back-repo@main
with:
  user-name: 'anyone-developer'
  user-email: 'zhang_nan_163@163.com'
```

## Donation

PalPal: https://paypal.me/nzhang4

<img src="https://raw.githubusercontent.com/anyone-developer/anyone-push-back-repo/main/misc/alipay.JPG" width="500">

<img src="https://raw.githubusercontent.com/anyone-developer/anyone-push-back-repo/main/misc/webchat_pay.JPG" width="500">


