sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker.io


# смотреть лoги докера
docker logs --tail 50 --follow --timestamps mediawiki_web_1

# Создать копию базы данных
docker-compose exec -T mysql mysqldump -u terminal_user -pPassword terminal > ./dump.sql;

# photo
docker exec -i terminal-php-fpm bash -c "cd /application/public/upload/&&tar cfvz photos.tar.gz photos";

# Скопировать файл
docker cp terminal-php-fpm:/application/public/upload/photos.tar.gz .;

# df size
docker system df

# delete docker build cache
docker builder prune -af

docker image ls
docker container ls
docker image rm $(docker images -a -q)
# удалить все контейнеры
docker stop $(docker ps -aq)
docker rm $(docker ps -qa)
sudo docker system prune -a

sudo docker build -t exitstop/torch1.4opencv_4.3_ubuntu_20.04_amd64_sys_small .
sudo docker build -t exitstop/torch1.4opencv_4.3_ubuntu_18.04_amd64_sys_small .
sudo docker build -t exitstop/ubuntu18.04 .
#docker run --name=linuxconfig-opencv4.5 -d -p 8080:80 linuxconfig/opencv4.4 bash -D FOREGROUND
docker run --name torch1.4opencv_4.3sys_small -it exitstop/torch1.4opencv_4.3sys_small
docker exec -it opencv4.5 /bin/bash
docker ps
docker ps -a
docker exec -it b6ad1502a22dc015669e4b91f8c52da59eb6e4df5f0ab3f3af95189d83a974c7 bash
docker container start b6ad1502a22dc015669e4b91f8c52da59eb6e4df5f0ab3f3af95189d83a974c7

docker exec -it container-name bash

docker push exitstop/torch1.4opencv_4.3sys_small
docker push exitstop/torch1.4opencv_4.3_ubuntu_20.04_sys_small
docker push exitstop/torch1.4opencv_4.3_ubuntu_18.04_sys_small
docker push exitstop/torch1.8.1opencv_4.3_ubuntu_18.04_arm64_sys_small
docker push exitstop/torch1.4opencv_4.3_ubuntu_20.04_amd64_sys_small


# if error
# Error on build: double free or corruption (out)
sudo apt remove golang-docker-credential-helpers

# multiarch
https://github.community/t/testing-against-multiple-architectures/17111/4
https://github.com/multiarch/qemu-user-static

sudo docker build -t exitstop/python3_arm_test .

# ssh key build argument
https://stackoverflow.com/questions/23391839/clone-private-git-repo-with-dockerfile

# запустить контейнер
#docker run exitstop/python3_arm_test /bin/sh
docker run --name exitstop_python3_arm_test -it exitstop/python3_arm_test bash
# зайти в контейнер
docker exec -ti exitstop_python3_arm_test /bin/sh

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

sudo usermod -aG dialout $(whoami)
sudo usermod -aG docker $USER


docker run --rm --privileged multiarch/qemu-user-static:register --reset
sudo docker build -t exitstop/torch1.8.1opencv_4.3_ubuntu_18.04_arm64_sys_small -f Dockerfile.18.04.arm64 .
docker run --name torch1.8.0opencv_4.3_ubuntu_18.04_arm64_sys_small -it exitstop/torch1.8.0opencv_4.3_ubuntu_18.04_arm64_sys_small bash
docker container start  ab0bbdcab7fb3d1e8c469703725b4fd099931560797a6b5a61aab3173336f62b
docker attach ab0bbdcab7fb
