#!/bin/bash


echo checking alias

for name in cd ls; do
  if [alias "$name >/dev/null 2>&1"]; then
    echo alias is predefined
  else
    echo alias is not defined
  fi
done