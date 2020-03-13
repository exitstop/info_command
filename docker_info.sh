# смотреть лиги докера
docker logs --tail 50 --follow --timestamps mediawiki_web_1

# Создать копию базы данных
docker-compose exec -T mysql mysqldump -u terminal_user -pPassword terminal > ./dump.sql;

# photo
docker exec -i terminal-php-fpm bash -c "cd /application/public/upload/&&tar cfvz photos.tar.gz photos";

# Скопировать файл
docker cp terminal-php-fpm:/application/public/upload/photos.tar.gz .;
