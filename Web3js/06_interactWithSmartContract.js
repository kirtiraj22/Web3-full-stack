// suppose we have the following contract in our solidity file :
// contract demo{
//   uint public x = 10;
//   function set(uint _x) public{
//     x = _x;
//   }
// }


// WE can interact with the above contract through our web3js by the following : 


// to get a smart contract in your web3js file, use : 
let contract = new web3.eth.Contract(ABI, "AddressOfContract");

// call the methods : 
contract.methods.x().call()
    .then(console.log);

// NOTE : here x() is a function from the solidity code. as we know that if we declare a variable as public in solidity,
// it works as a function (because it automatically gets a getter function)

// we can store the number into a variable also, i.e : let num = contract.methods.x()....


// NOW WE WILL CALL THE FUNCTION set() present in our smart contract 
contract.methods.set(90).send({
    from: "accountOfSender"
  });

// now if we call the contract.methods.x().call().then(console.log);
// we will get the value of x as 90
