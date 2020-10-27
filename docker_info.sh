# смотреть лoги докера
docker logs --tail 50 --follow --timestamps mediawiki_web_1

# Создать копию базы данных
docker-compose exec -T mysql mysqldump -u terminal_user -pPassword terminal > ./dump.sql;

# photo
docker exec -i terminal-php-fpm bash -c "cd /application/public/upload/&&tar cfvz photos.tar.gz photos";

# Скопировать файл
docker cp terminal-php-fpm:/application/public/upload/photos.tar.gz .;

docker image ls
docker container ls
docker image rm $(docker images -a -q)
# удалить все контейнеры
docker stop $(docker ps -aq)
docker rm $(docker ps -qa)
docker system prune -a

sudo docker build -t exitstop/torch1.4opencv_4.3sys_small .
sudo docker build -t exitstop/ubuntu18.04 .
#docker run --name=linuxconfig-opencv4.5 -d -p 8080:80 linuxconfig/opencv4.4 bash -D FOREGROUND
docker run --name torch1.4opencv_4.3sys -it exitstop/torch1.4opencv_4.3sys
docker exec -it opencv4.5 /bin/bash
docker ps
docker ps -a
docker exec -it b6ad1502a22dc015669e4b91f8c52da59eb6e4df5f0ab3f3af95189d83a974c7 bash
docker container start b6ad1502a22dc015669e4b91f8c52da59eb6e4df5f0ab3f3af95189d83a974c7

docker push exitstop/torch1.4opencv_4.3

# if error
# Error on build: double free or corruption (out)
sudo apt remove golang-docker-credential-helpers
