# видео уроки
# от mail.ru https://www.youtube.com/watch?v=_I9vLOAsFew
# doc
# https://docs.mongodb.com/manual/reference/operator/update/push/

# https://www.tecmint.com/install-mongodb-on-ubuntu-18-04/
sudo systemctl status mongodb
sudo systemctl stop mongodb
sudo systemctl start mongodb
sudo systemctl restart mongodb
sudo systemctl disable mongodb
sudo systemctl enable mongodb

# отключить автострат autostart
sudo update-rc.d mongodb disable
# выключить mongodb
sudo service mongodb stop

# create root password
mogno
show dbs # показать все базы данных
use admin
db.createUser({user:"root", pwd:"=@!#@%$admin1", roles:[{role:"root", db:"admin"}]})
sudo vim /lib/systemd/system/mongodb.service
systemctl daemon-reload
sudo systemctl restart mongodb
sudo systemctl status mongodb
mongo -u "root" -p --authenticationDatabase "admin"

# Удалить базу  данных
db.dropDatabase()

# Узнать колличество
db.users.find().count()
# Пропустить 5 штук
db.users.find().skip(5)

use firstdb # создать базу данных
db.createCollection("users") # создать колекцию
db.users.drop() # удалить коллекцию users
db.users.insertOne({
    "name": "john",
    "email": "john@mai.ru",
    "age": 23
})

db.users.insertMany([
    {
    "name": "john2",
    "email": "john2@mai.ru",
    "age": 23
    },
    {
    "name": "john3",
    "email": "john3@mai.ru",
    "age": 23,
    "bithrday": new Date()
    }
])

db.users.findOne() # смотреть одну запись
db.users.find() # смотреть все записи в коллекции users
db.users.find().limit(2) # смотреть 2 записи
db.users.find({}, {_id:0}) # не выводить _id
db.users.find({}, {_id:0}).sort({name: -1})
db.users.find({$or: [{name: "john"}, {age: 23}]}, {_id:0})
db.users.find({name: { $in: ["john2", "mike"]}})
db.users.find({name: { $all: ["john2", "mike"]}}) 
# $lt: <  $gt: >  $lte: <=  $gte: >= $ne: !=
db.users.find({$or: [{name: "john"}, {age: {$lt: 24}}]}, {_id:0})
db.users.find({bithrday: {$exists: true} }, {_id:0})
db.users.find({child: {$size: 2} }, {_id:0})
db.users.find({"child.1": "fuck" }, {_id:0})
db.users.find({child: {$elemMatch: {$lte: "a"}} }, {_id:0})

# обновить одно значение 
db.users.updateOne({age:23}, {$set: {age: 25}})
# обновить много значений
db.users.updateMany({age:23}, {$set: {age: 25}})
# Удалить аттрибут
db.users.updateMany({age:23}, {$unset: {age: 25}})
# push to array arrayField
db.users.updateMany({age:23}, {$push: {arrayField: "-name"}})
# pop
db.users.updateMany({age:23}, {$pop: {arrayField: -1}})
# add to set добавить массив только там где нет этого поля
db.users.updateMany({age:23}, {$addToSet: {arrayField: "-name"} })


# удалить запись которая 22 >= age >= 38
db.users.deleteOne({age: {$gte: 22}, age: {%lte: 38}})
db.users.deleteMany()

# объекденить несколько команд
db.users.bulkWrite([
    {
        insertOne: {
            "document" : {
                name: "mike",
                email: "mike@mail.ru"
            }
        }
    },
    {
        deleteOne: {
            filter: {
                name: "mike2"
            }
        }
    },
    {
        updateOne: {
            filter: {
                name: "mike"
            },
            update: {
                $set: {
                    email: "fuckyou@mail.ru"
                }
            }
        }
    },
    {
        replaceOne: {
            filter: {
                name: "john"
            },
            replacement: {
                name: "bob",
                email: "fuckbob@mail.ru",
                age: 115
            }
        }
    }
])

# создание новой базы данных и посик в ней текста
# Создание интекса
db.articles.createIndex({
    title: "text",
    anonce: "text",
    text: "text"
})
# поиск 
db.articles.find({ $text: {$search: "жители"} })
db.articles.find(
    { $text: { $search: "жители здесь "} },
    { score: { $mete: "textScore" } }
).sort({ $score: { $meta: "textScore" } })

# вывести массив уникальных значений
db.users.distinct("age")

# агреггирование, суммирование полей
db.users.aggregate([
    { $match: {name: "mike"} },
    { $group: {_id: "$name", age: { $sum: "$age" } } }
])
