#### Качать рекурсивно только расширение *.trt

rsync -zarv --include="*/" --include="*.trt" --exclude="*" nvidia@192.168.88.20:/home/nvidia/.face_chain_cache/ .
