#### SQL

Получить id и полное имя пользователей (mysql)

```sql
SELECT u.id, concat_ws(' ', u.`surname`, u.`first_name`, u.`middle_name`) `full_name` 
FROM `users` `u` WHERE 1
```
### Связанные таблицы

- ##### Mysql
```sql
SELECT u.id, concat_ws(' ', u.`surname`, u.`first_name`, u.`middle_name`) `full_name` 
FROM `users` `u` INNER JOIN `images` `im` ON im.user_id=u.id 
WHERE true
```

- ##### Postgresql
```sql
SELECT u.id, concat(u.last_name, ' ', u.first_name, ' ', u.middle_name) "full_name" 
FROM "users" "u" INNER JOIN "features" "f" ON f.users_id=u.id 
WHERE true;
```


- Связанные таблицы, есть смысл если выводить из правой таблицы значение
```sql
SELECT u.id, concat_ws(' ', u.`surname`, u.`first_name`, u.`middle_name`) `full_name`, im.nk FROM `users` `u` 
LEFT JOIN `images` `im` ON im.user_id=u.id 
WHERE true
```
Запрос в скобках выполняется вторым
```sql
SELECT u.id, concat_ws(' ', u.`surname`, u.`first_name`, u.`middle_name`) `full_name`, 
(SELECT im.nk FROM `images` `im` WHERE im.user_id=u.id) `nk` FROM `users` `u` 
WHERE true limit 10
```
```sql
SELECT u.id, concat_ws(' ', u.`surname`, u.`first_name`, u.`middle_name`) `full_name` 
FROM `users` `u` RIGHT JOIN `images` `im` ON im.user_id=u.id 
WHERE true
```
```sql
SELECT u.id, concat_ws(' ', u.`surname`, u.`first_name`, u.`middle_name`) `full_name` FROM `users` `u` 
INNER JOIN `images` `im` ON im.user_id=u.id 
WHERE im.nk=1
```

```sql
SELECT u.id, concat_ws(' ', u.`surname`, u.`first_name`, u.`middle_name`) `full_name`, (SELECT im.nk 
FROM `images` `im` WHERE im.user_id=u.id) `nk` FROM `users` `u` 
WHERE u.id IN (SELECT id FROM users WHERE true ) LIMIT 10
```

```sql
FROM visits AS v
INNER JOIN users AS u ON u.id=v.users_id AND v.purpose='entrance'
WHERE v.id IN (
        SELECT b.id 
        FROM visits AS b
        WHERE 
        v.users_id=b.users_id	
        AND b.created_at <= ?
        ORDER BY b.created_at DESC
        LIMIT 1
        )
```
