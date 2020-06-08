#!/bin/bash

rm -rf terminalgo_little/

rsync -avC --delete \
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
    terminalgo_crash/ terminalgo_little/

du -h --max-depth=0 terminalgo_little
