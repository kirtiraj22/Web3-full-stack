const ethers = require("ethers");
const fs = require("fs");
require("dotenv").config();
async function main() {
  //http://127.0.0.1:7545
  const provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL);
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);

  //getting the wallet by the encrypted key that we just made
  //fs will read the file encryptedKey.json
  const encryptedJson = fs.readFileSync("./.encryptedKey.json", "utf8");
  //now creating wallet from the encrypted key :
  // let wallet = new ethers.Wallet.fromEncryptedJsonSync(
  //   encryptedJson,
  //   process.env.PRIVATE_KEY_PASSWORD
  // );
  wallet = await wallet.connect(provider);
  const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");
  const binary = fs.readFileSync(
    "./SimpleStorage_sol_SimpleStorage.bin",
    "utf8"
  );
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
  console.log("deploying, please wait.....");
  //we are using await because we want to wait for the contract to deploy first and then move further
  const contract = await contractFactory.deploy();
  // const transactionReceipt = await contract.deployTransaction.wait(1);
  await contract.deployTransaction.wait(1);
  //the below code will call the retrieve function of our smart contract
  const currentFavoriteNumber = await contract.retrieve();
  console.log(`Current favorite number : ${currentFavoriteNumber.toString()}`);
  //calling the store function(of smart contracts) and storing 12 in it :
  const transactionResponse = await contract.store(12);
  const transactionReceipt = await transactionResponse.wait(1);
  const updatedFavoriteNumber = await contract.retrieve();
  console.log(`Updated favorite Number is : ${updatedFavoriteNumber}`);
}

//main is an async function
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
