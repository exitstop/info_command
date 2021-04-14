#### Ошибка

```bash
dpkg: unrecoverable fatal error, aborting:
 files list file for package 'linux-generic' is missing final newline
E: Sub-process /usr/bin/dpkg returned an error code (2)
```
- или
```bash
dpkg: предупреждение: список файлов пакета «libcurl4:amd64» отсутствует; 
предполагаем, что на данный момент у пакета нет установленных файлов
```

- Решение

```bash
sudo mv /var/lib/dpkg/info/libcurl4:amd64.list{,bk}
```
