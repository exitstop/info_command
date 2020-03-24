#!/bin/bash

#git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch unwanted_filename_or_folder' --prune-empty

git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch path/to/ceo.jpg' \
  --prune-empty --tag-name-filter cat -- --all

git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch path/to/ceo.jpg' \
  --prune-empty --tag-name-filter cat e0ec20d69ac9195f056214f071e12afcfe714199 --all
