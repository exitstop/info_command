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
docker system prune -a

sudo docker build -t linuxconfig/torch1.4opencv_4.5 .
#docker run --name=linuxconfig-opencv4.5 -d -p 8080:80 linuxconfig/opencv4.4 bash -D FOREGROUND
docker run --name torch1.4opencv_4.5 -it linuxconfig/torch1.4opencv_4.5
docker exec -it opencv4.5 /bin/bash
docker ps

# if error
# Error on build: double free or corruption (out)
sudo apt remove golang-docker-credential-helpers
