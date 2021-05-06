####  Отписка

```bash
main.cf:
  header_checks = regexp:/etc/postfix/header_checks
header_checks:
/^From:/ PREPEND List-Unsubscribe: bla bla bla

#postmap /etc/postfix/header_checks
#postfix reload
```
