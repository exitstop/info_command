#!/bin/bash
#
# download_from_github_private_release.sh 1234567890abcdf3456432345343434

TOKEN=$1 # 1234567890abcdf3456432345343434
REPO="exitstop/repo"
FILE="package.tar.gz"                   # the name of your release asset file, e.g. build.tar.gz
VERSION="latest"                        # $1                       # tag name or the word "latest"
GITHUB="https://api.github.com"

alias errcho='>&2 echo'

function gh_curl() {
    curl -H "Authorization: token $TOKEN" \
        -H "Accept: application/vnd.github.v3.raw" \
        $@
    }

if [ "$VERSION" = "latest" ]; then
    # Github should return the latest release first.
    parser=".[0].assets | map(select(.name == \"$FILE\"))[0].id"
else
    parser=". | map(select(.tag_name == \"$VERSION\"))[0].assets | map(select(.name == \"$FILE\"))[0].id"
fi;

asset_id=`gh_curl -s $GITHUB/repos/$REPO/releases | jq "$parser"`
if [ "$asset_id" = "null" ]; then
    errcho "ERROR: version not found $VERSION"
    exit 1
fi;

wget --show-progress -q --auth-no-challenge --header='Accept:application/octet-stream' \
    https://$TOKEN:@api.github.com/repos/$REPO/releases/assets/$asset_id \
    -O $FILE

