// to fetch balance from any account present in your ganache, use the command : 
web3.eth.getBalance("addressOfWallet");

// the above command will return a promise so we need to use the .then to resolve the promise

web3.eth.getBalance("addressOfWallet").then(console.log);
// the line above will display the amount(in wei) that the particular address holds

// if we want the amount to get displayed in the form of ethers then we need to use the following : 
web3.eth.getBalance("addressOfWallet")
      .then(function(result()){ 
              console.log(web3.utils.fromWei(result,"ether"));
      });

// we are using web3.utils.fromWei package to convert wei to ethers
