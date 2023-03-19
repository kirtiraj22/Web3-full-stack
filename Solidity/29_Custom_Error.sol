//suppose we use : 
require(msg.sender == i_owner, "Sender is not owner");

//now the problem with the above is that we need to store the string "Sender is not owner" in a string array
//as each character needs to be stored individually, it will take a lot of memory

//so to avoid this we can make a use of custom errors
//custom error is a convenient and gas efficient way

//custom errors are defined using the error statement, which can be used inside and outside of the contracts(including interfaces and libraries)

//we need to use two keywords : error and revert
//eg of solidity code :

//SPDX-License-Identifier:MIT

pragma solidity ^0.8.4;

error NotOwner();

contract Example{
  address payable owner = payable(msg.sender);
  function withdraw() public{
    if(msg.sender != owner){
      revert NotOwner();
    }
  }
}


//this will work the same as 
require(msg.sender == owner, "some msg");
//but the advantage of custom error is that it will save some gas 
