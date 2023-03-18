//modifier is a keyword that can be added in a function
//we can define the name and the functionality of our modifier

//for eg : if we want to withdraw funds from smart contracts and we want that only the owner can withdraw it then we can define modifier as :

modifier onlyOwner {
  require(msg.sender == owner, "sender is not owner");
  _;
}

function withdraw() public onlyOwner{
  //code
}



//so our modifier onlyOwner is used in our withdraw function
//Note that we have an underscore(_;) below the require keyword at line 8
//this is below the require keyword so it means that first require will be executed then we will move to the function which uses onlyOwner modifier(in this case we have withdraw function at line 11)
//If the underscore was above the require keyword, then the function withdraw() would have executed before the require
