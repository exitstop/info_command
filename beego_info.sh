~/.zshrc
# утснавливаем пути
export GOPATH="$HOME/go_projects"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# скачиваем beego чтобы работала команда bee в консоли
go get -v github.com/beego/bee


