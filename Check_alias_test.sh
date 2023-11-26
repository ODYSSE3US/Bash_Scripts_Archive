#!/bin/bash


echo checking alias

shopt -s expand_aliases
source ~/.zshrc

for name in cd ls; do
  if ["$(type -t $name)" = 'alias' ]; then
    echo alias is predefined
  else
    echo alias is not defined
  fi
done