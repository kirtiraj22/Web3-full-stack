//there is a way in which we can send the raw data(of the contract from its binary file)
//syntax :

const nonce = await wallet.getTransactionCount();     //get the nonce(unique number)
const tx = {
  nonce: nonce,
  gasPrice: 20000000000,
  gasLimit: 1000000,
  to: null,
  value: 0,
  data: "0x6080604052......",      //we need to copy the data from binary file(.bin) and add "0x" before it
  chainId: 1337,
}

const sentTxResponse = await wallet.sendTransaction(tx);
await sentTxResponse.wait(1);
//console.log(sentTxResponse)
