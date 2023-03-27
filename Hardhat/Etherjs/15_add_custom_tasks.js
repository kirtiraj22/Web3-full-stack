// we can create our custom tasks
// we can store it to a seperate folder named as tasks
// here we will create a task that will provide user with the information about the current block that we are working with
// we can name this file as block-number.js in the tasks folder
//then we will import it to the hardhat.config.js file using :
//require("./tasks/block-number");
// now if we type the command "yarn hardhat", we will get all the available tasks(including this one)

const { task } = require("hardhat/config");

task("block-number", "Prints the current block number").setAction(
  //hre stands for hardhat runtime environment
  async (taskArgs, hre) => {
    const blockNumber = await hre.ethers.provider.getBlockNumber();
    console.log(`Current block number : ${blockNumber}`);
  }
);

task("accounts", "Prints the list of accounts", async () => {
  const accounts = await ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

module.exports = {};
