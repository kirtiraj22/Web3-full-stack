//create an object named as web3 using the Web3 class that we made above
let web3 = new Web3(new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545"));
//NOTE : the http.... is the ganache URL(RPC server)
// so now we can control our ganache using web3
