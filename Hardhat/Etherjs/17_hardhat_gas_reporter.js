// hardhat gas reporter is a package that automatically gives us an output that tells us approx. how much gas is required to complete the function
// we can have many functions in our smart contract, and hardhat gas reporter will tell us how much gas is required by each function(of our smart contract)

// firstly we need to add the command to install the package :
// yarn add hardhat-gas-reporter --save-dev

// and now we need to add the following code in our hardhat.config.js file

require("hardhat-gas-reporter");

// also include the following code in hardhat.config.js file :

etherscan: {
  ... 
},
gasReporter : {
  enabled: true,
  outputFile: "gas-reporter.txt",
  noColors: true,
  currency: "USD",
  coinmarketcap: COINMARKETCAP_API,
},
  
  
// the currency and the coinmarketcap(line 20 and 21) are optional
// those lines will provide the amount in USD 
// we need to use the coinmarket cap api to get the data 
