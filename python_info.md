#### errors

# установить все пакеты в определнную папку
PYTHONUSERBASE=/home/bg/install pip3 install --target=/home/bg/install -r requirements.txt
PYTHONUSERBASE=/usr/local/lib/python3.6/dist-packages/ sudo -H pip3 install --target=/usr/local/lib/python3.6/dist-packages/ -r requirements.txt
sudo -H pip3 install -r requirements.txt

# скачать пакет и сбилдить его
sudo -H pip3 download --no-deps onnx==1.8.1
sudo -H pip3 wheel --no-deps onnx-1.8.1.tar.gz
