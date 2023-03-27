//imports
const { ethers, run, network } = require("hardhat");
//async main functi

async function main() {
  //below code will deploy our contract
  const SimpleStorageFactory = await ethers.getContractFactory("SimpleStorage");
  console.log("Deploying contract...");
  const simpleStorage = await SimpleStorageFactory.deploy();
  await simpleStorage.deployed();
  console.log(`Deployed contract to : ${simpleStorage.address}`);
  //31337
  //below code will verify the contract if we are in a testnet
  if (network.config.chainId === 11155111 && process.env.ETHERSCAN_API_KEY) {
    console.log("waiting for block confirmations...");
    await simpleStorage.deployTransaction.wait(6);
    await verify(simpleStorage.address, []);
  }

  //below code will interact with our contract
  //and the code written will update value of the number stored
  const currentValue = await simpleStorage.retrieve();
  console.log(`Current Value is : ${currentValue}`);
  //update the current value :
  const transactionResponse = await simpleStorage.store(7);
  await transactionResponse.wait(1);
  const updatedValue = await simpleStorage.retrieve();

  console.log(`updated value is : ${updatedValue}`);
}

//if contract dont have constructor, then keep the args as blank
//https://api.etherscan.io/api
async function verify(contractAddress, args) {
  console.log("verifying contract...");
  try {
    //run allows us to run any hardhat tast(verify in this case)
    await run("verify:verify", {
      address: contractAddress,
      constructorArguments: args,
    });
  } catch (e) {
    if (e.message.toLowerCase().includes("already verified")) {
      console.log("Already verified");
    } else {
      console.log(e);
    }
  }
}

//calling main function
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
