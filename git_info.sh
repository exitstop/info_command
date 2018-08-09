git diff --cached # показать дифф того что в индексе

git stash # спрятать ваши изменения в карман
git stash --kepp-index # поместить в stash только то что не находится в индексе
git stash -u # -u = --include-untracked поместить в stash то что не трекается
git stash --all # спрятать в stash все, и идексированые и не отслеживаемые и тд..  (git clean - удаляет все изменения и файлы которые не отслеживаются, и восстановить нельзя в отличие от stash)
git stash list # посмотреть то что спрятали
git stash apply stash@{0}  # применить нулевой stash, но при этом stash не удаляется из кармана
git stash pop # применить последний stash и stash удалится из кармана
git stash branch b1 # создать новую ветку b1 из вашего stash. Ветка создастся с того комита в котором вы сдалали stash. Stash успешно применился без конфликтов то он удалится из кармана.

git clean -d -n # покажет но не удалит все что изменилось в вашем репозитории и даже не отслеживаем файлы
git clean -d -n -x # покажет прекомпилированне *.o
git clean -x -f # удалить безвозвратно все изменения и не отслеживаемые файлы

git grep -n "#include"   # покажет в каких файлах и на какой строке есть эта строка
git grep -c "#include"  # покажет количество совпадений в каждом файле
git grep -pn "std" # в каких функциях есть это совпадение и на какой строке
git grep -n -e "^void v(" --and -e ";" # искать чтобы совпадало и первое и второе выражение в одной строке

git log --pretty=oneline # вывести log компактно по одной строчке на коммит
git log -S vector --oneline # найти в истории где создавалась или удалялось это слово "vector"
git log -L :main:main.cpp  # увидеть все изменения функции main в файле main.cpp

git commit --amend -m "my new message" # изменить сообщение последнего коммита если вы еще на сделали push

git rebase -i HEAD~3 # изменить в интерактивном режиме последние три коммита
git commit --amend
git rebase --continue

git filter-branch --tree-filter 'rm -f passwords.txt' HEAD # удалить файл passwords.txt из всех коммитов

git reset --soft HEAD~ # удалит предыдущий комит и добавить его в индекс, после чего его можно отредактировать и закомитить снова

git merge --abort # отменить попытку слияния
git merge-file -p hello.ours.rb hello.common.rb hello.theirs.rb > hello.rb
git merge -Xours b1 # при конфликте выбирать наши изменения
git merge -Xtheirs b1 # при конфликте выбирать их изменения
git merge myBranch --no-commit --no-ff #делаем мерж без комита, изменения будут в индексе

#если хотим найти потерянный файл в истории
#если не знаем путь к искомому файлу
git log --all --full-history -- **/thefile.*
#если знаем полный путь к искомому файлу
git log --all --full-history -- <path-to-file>
