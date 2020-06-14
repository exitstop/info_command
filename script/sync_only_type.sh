#!/bin/bash

rm -rf terminalgo_little/

var=

if [ -n "$1" ]; then
  echo "You supplied the first parameter!"
  var=--delete
else
  echo "First parameter not supplied."
fi

rsync -avC $var \
    --exclude='node_modules/*' \
    --exclude='storage' \
    --exclude='public' \
    --exclude='package-lock.json' \
    --exclude='mix-manifest.json' \
    --exclude='users.json' \
    --include 'script/*' \
    --include 'internal' \
    --exclude='temp_*/' \
    --exclude='uploads*/' \
    --include '*/' \
    --include='*.png' \
    --include='.gitignore' \
    --include='.gitattributes' \
    --include='.golangci.yml' \
    --include='.babelrc' \
    --include='Makefile' \
    --include='*.sh' \
    --include='*.ini' \
    --include='*.mod' \
    --include='*.gohtml' \
    --include='*.toml' \
    --include='*.conf' \
    --include='*.sql' \
    --include='*.jpg' \
    --include='*.svg' \
    --include='*.scss' \
    --include='*.json' \
    --include='*.go' \
    --include='*.vue' \
    --include='*.js' \
    --include='*.md' \
    --exclude='*' \
    --prune-empty-dirs \
    terminalgo/ terminalgo_refresh/

du -h --max-depth=0 terminalgo_refresh
