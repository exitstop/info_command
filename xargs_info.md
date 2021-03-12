cat binary/install_manifest_opencv.txt | xargs  -i sh -c 'mkdir -p tmp_opencv$(dirname {})'
cat binary/install_manifest_opencv.txt | xargs  -I '{}' cp -rp '{}' tmp_opencv'{}'
cat ~/file.list| xargs  -I '{}' mv '{}' one/'{}'

