async function main(){
  const provider = new ethers.providers.JsonRpcProvider("http://0.0.0.0:8585");
  const wallet = new ethers.Wallet("7dbe320dbf45340.......", provider);         //here the string is the private key
}


//The two lines alone can help us to interact with smart contract

//provider : it provides a connection to the blockchain
//wallet : gives a wallet with a private key so that we can sign different transactions
