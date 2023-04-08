// to transfer ethers use the following :
web3.eth.sendTransaction({
    from:"SenderAddress",
    to:"ReceiverAddress",
    value: web3.utils.toWei("5","ether"),     // sending 5 ethers 
  }  
);
