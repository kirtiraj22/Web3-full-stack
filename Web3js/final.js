let Web3 = require("web3");

let web3 = new Web3(new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545"));

// to get balance of a particular adddress of a wallet
web3.eth.getBalance("addressOfWallet")
      .then(function(result()){ 
              console.log(web3.utils.fromWei(result,"ether"));
      });

// to transfer ethers use the following :
web3.eth.sendTransaction({
    from:"SenderAddress",
    to:"ReceiverAddress",
    value: web3.utils.toWei("5","ether"),     // sending 5 ethers 
  }  
);

// to get a smart contract in your web3js file, use : 
let contract = new web3.eth.Contract(ABI, "AddressOfContract");
