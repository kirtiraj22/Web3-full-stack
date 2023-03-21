//inorder to deploy our smart contracts, we need the ABI and the binary code of the smart contract

//so we need to read from two files : 
//1) abi 
//2) binary 

//to do this we need to use the fs package (which can be added by using the command : $ yarn add fs)
// so first we need to import this fs package and it can be done by :

const fs = require("fs");

//now to get the abi, we need to use the following syntax :
const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");

// and to get the binary file(.bin), we need to use the following :
const binary = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");
