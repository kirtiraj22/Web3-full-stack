//now as we have the contractFactory, we can deploy our contract with ethers by using :

const contract = await contractFactory.deploy();

//here we are using await because we want to deploy the contract first i.e wait for the contract to deploy and then move further

