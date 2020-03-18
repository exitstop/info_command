#!/bin/bash

git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch unwanted_filename_or_folder' --prune-empty
