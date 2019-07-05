# равернуть javascript из ожной строчки в человеко-читаемый стиль
npm -g install js-beautify
js-beautify foo.js

# update npm
npm install -g npm@latest

# чтобы заработало ng version
npm link @angular/cli

ng new my-app
# запустить приложение
ng serve -o

# Установка angular
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
vim ~/.zshrc
# add to ~/.zshrc
export PATH=~/.npm-global/bin:$PATH

npm uninstall angular-cli
npm install @angular/cli --save-dev

# building desktop apps with Angular
# https://angularfirebase.com/lessons/desktop-apps-with-electron-and-angular/
npm install electron --save-dev
npm install electron-prebuilt
electron-packager . --platform=win32 --electron-version=6.0.0-beta.6

# error ошибка ENOSPC: no space left on device, copyfile
# удалить папку node_modules

# phantomjs
sudo apt-get update
sudo apt-get install build-essential chrpath libssl-dev libxft-dev -y
sudo apt-get install libfreetype6 libfreetype6-dev -y
sudo apt-get install libfontconfig1 libfontconfig1-dev -y
cd ~
export VERSION_PH_JS="2.1.1"
export PHANTOM_JS="phantomjs-$VERSION_PH_JS-linux-x86_64"
#wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$VERSION_PH_JS-linux-x86_64.tar.bz2
wget https://github.com/Medium/phantomjs/releases/download/v$VERSION_PH_JS/$PHANTOM_JS.tar.bz2
sudo tar xvjf $PHANTOM_JS.tar.bz2
sudo mv $PHANTOM_JS /usr/local/share
sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
phantomjs --version

npm install phantomjs-prebuilt

#wget https://chromedriver.storage.googleapis.com/76.0.3809.25/chromedriver_linux64.zip
wget https://chromedriver.storage.googleapis.com/2.46/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
rm chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
chromedriver --version

# прокрутить окно 
window.scrollTo(0,document.body.scrollHeight);
window.scrollTo(0,document.querySelector(".scrollingContainer").scrollHeight);

# получить имя
this.constructor.toString()

# Получить прослушивателя событий
getEventListeners(document.getElementsByClassName("video-stream html5-main-video")[0])

# получить функции которые можно запустить
document.querySelector("#movie_player > div.html5-video-container > video");
video.__proto__
