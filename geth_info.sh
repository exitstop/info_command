geth --syncmode "fast" -cache 1024 console
geth --maxpeers 0 consoleeth.blockNumbe
web3.fromWei(eth.getBalance(eth.coinbase), "ether") 

geth account new
geth account new --password /path/to/passwdfile
geth account new --password <(echo $mypassword)

eth.sendTransaction({from:'fromAddress', to:'toAddress', value: web3.toWei(0.05, "ether"), gas:21000});
