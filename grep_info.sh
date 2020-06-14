- Ограничить по длине вывода, если строчка выводится слишком большая
`grep -r -E -o ".{0,10}maxFilesize.{0,10}" *`

# https://github.com/BurntSushi/ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
sudo apt-get install ripgrep
