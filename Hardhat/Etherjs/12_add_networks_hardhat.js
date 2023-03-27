// by default, hardhat deploys the smart contract in its fake hardhat network
// we can deploy it to custom networks by adding the following code in our hardhat.config.js file :

module.exports = {
  default: "hardhat";
  networks: {
    sepolia: {
      url: TESTNET_RPC_URL,     
      accounts: [PRIVATE_KEY],
      chainId: Id_of_testnet,
    }
  }
}
