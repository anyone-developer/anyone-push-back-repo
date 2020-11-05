if [[ '$1' == 'true' ]]; then
  git config --local user.name $2
  git config --local user.email $3
  git commit -am "Automated push from [$4/#$5]"
  git push
fi
