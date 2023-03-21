//now if we have an abi and binary, we can create something called contract factory

//contract factory is just an obkect that we can use to deploy contracts

//syntax for it :

const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
