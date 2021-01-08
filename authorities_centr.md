### Центр сертификации


### Работает если прочтать комментарии
- https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309


### Создаем свой центр сертификации на 99000 дней

```bash
openssl genrsa -des3 -out rootCA.key 4096
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 99000 -out rootCA.crt
#openssl req -new -key mydomain.com.key -out mydomain.com.csr
```

### Добавить центр rootCA.crt в браузер

- chrome://settings/certificates

### Подписываем сертификат для нашего домена

```bash
openssl genrsa -out mydomain.com.key 2048

openssl req -new -sha256 \
    -key mydomain.com.key \
    -subj "/C=US/ST=North Carolina/O=ORG/OU=ORG_UNIT/CN=mydomain.com" \
    -reqexts SAN \
    -config <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:mydomain.com")) \
    -out mydomain.com.csr

# проверить запрос
openssl req -in mydomain.com.csr -noout -text

openssl x509 -req -extfile <(printf "subjectAltName=DNS:mydomain.com") -days 90000 -in mydomain.com.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out mydomain.com.crt -sha256
```

### Подписываем сертификат для нашего ip

```bash
openssl genrsa -out mydomain.com.key 2048

openssl req -new -sha256 \
    -key mydomain.com.key \
    -subj "/C=US/ST=North Carolina/O=ORG/OU=ORG_UNIT/CN=192.168.0.162" \
    -reqexts SAN \
    -config <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=IP:192.168.0.162")) \
    -out mydomain.com.csr

# проверить запрос
openssl req -in mydomain.com.csr -noout -text

openssl x509 -req -extfile <(printf "subjectAltName=IP:192.168.0.162") -days 90000 -in mydomain.com.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out mydomain.com.crt -sha256
```


### НЕ РАБОТАЕТ

- https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-ca-on-ubuntu-20-04-ru

```bash

wget https://github.com/OpenVPN/easy-rsa/archive/master.zip
unzip master.zip
```
