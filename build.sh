#!/bin/bash

CONFIG=.config
OLD_CONFIG=.config.old

git pull

if test -f "$OLD_CONFIG"; then
  rm $OLD_CONFIG
fi

if test -f "$CONFIG"; then
  mv $CONFIG $OLD_CONFIG
fi

if test -f "$1"; then
  cp $1 $CONFIG
  make -j1 V=s
else
  echo "ERROR: $1 not found!"
fi

./copy.sh
