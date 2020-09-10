
# https://jdhao.github.io/2020/02/16/ripgrep_cheat_sheet/

#Search in a single file utils.py
rg image utils.py
#	Search in dir src/ recursively
rg image src/
# Search image in current dir recursively
rg image
# Regex searching support (lines starting with We)
rg '^We' test.txt
# Search image and ignore case (case-insensitive search)
rg -i image
# Smart case search
rg -s image
# Search literally, i.e., without using regular expression
rg -F '(test)'
# File globing (search in certain files)
rg image -g '*.py'
# Negative file globing (do not search in certain files)
rg image -g '!*.py'
# Search image in Python file
rg image --type py
# or
rg image -tpy
# Do not search image in Python file type
rg image -Tpy
# Only show files containing image (Do not show the lines)
rg -l image
# Show files not containing image
rg --files-without-match image
# Inverse search (search files not containing image)
rg -v image
# Search complete word
rg -w image
# Show the number of matching lines in a file
rg --count
# Show the number of matchings in a file
rg --count-matches
