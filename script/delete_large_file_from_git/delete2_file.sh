#!/bin/bash

git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
# or, for older git versions (e.g. 1.8.3.1) which don't support --stdin
# git update-ref $(git for-each-ref --format='delete %(refname)' refs/original)
git reflog expire --expire=now --all
git gc --aggressive --prune=now
