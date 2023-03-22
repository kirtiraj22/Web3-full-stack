//to pass raw data and then send transactions to the smart contracts is quite hectic

//so, we can use another method to interact with smart contracts directly
// i.e we can directly call our smart contract functions from our ether js
// the syntax for it is :

const variableName = await contract.functionName();

//for eg: suppose our smart contract has a function named as retrieve() which will return our favorite number
//so to call that function, we cam use the syntax : 

const favoriteNumber = await contract.retrieve();

//this will call the retrieve() function in our smart contract
//that retrieve function will return a uint which will be stored in our favoriteNumber variable
