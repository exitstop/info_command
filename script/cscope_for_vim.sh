#!/bin/bash

CSCOPE_DIR="$PWD/cscope"

if [ ! -d "$CSCOPE_DIR" ]; then
  mkdir "$CSCOPE_DIR"
fi

echo "Finding files ..."
find "$PWD" -name '*.[ch]' \
  -o -name '*.cpp' \
  -o -name '*.cc' \
  -o -name '*.cu' \
  -o -name '*.cuh' \
  -o -name '*.cl' \
  -o -name '*.hpp' > "$CSCOPE_DIR/cscope.files"

echo "Adding files to cscope db: $PWD/cscope.db ..."
cscope -b -i "$CSCOPE_DIR/cscope.files"

export CSCOPE_DB="$PWD/cscope.out"
echo "Exported CSCOPE_DB to: '$CSCOPE_DB'"
